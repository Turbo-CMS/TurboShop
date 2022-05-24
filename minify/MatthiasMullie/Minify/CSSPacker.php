<?php
/**
 * CSS Packer (Lite version Minify)
 *
 * Please report bugs on https://github.com/matthiasmullie/minify/issues
 *
 * @author Matthias Mullie <minify@mullie.eu>
 * @copyright Copyright (c) 2012, Matthias Mullie. All rights reserved
 * @license MIT License
 */

namespace MatthiasMullie\Minify;

use MatthiasMullie\Minify\Exceptions\FileImportException;
use MatthiasMullie\PathConverter\ConverterInterface;
use MatthiasMullie\PathConverter\Converter;

/**
 * CSS minifier
 *
 * Please report bugs on https://github.com/matthiasmullie/minify/issues
 *
 * @package Minify
 * @author Matthias Mullie <minify@mullie.eu>
 * @author Tijs Verkoyen <minify@verkoyen.eu>
 * @copyright Copyright (c) 2012, Matthias Mullie. All rights reserved
 * @license MIT License
 */
class CSSPacker extends Minify
{

	protected $source_root = '';

	
	public function setRootSource($source)
	{
		$this->source_root = strval($source);
	}

    /**
     * Move any import statements to the top.
     *
     * @param string $content Nearly finished CSS content
     *
     * @return string
     */
    protected function moveImportsToTop($content)
    {
        if (preg_match_all('/(;?)(@import (?<url>url\()?(?P<quotes>["\']?).+?(?P=quotes)(?(url)\)))/', $content, $matches)) {
            // remove from content
            foreach ($matches[0] as $import) {
                $content = str_replace($import, '', $content);
            }

            // add to top
            $content = implode(';', $matches[2]).';'.trim($content, ';');
        }

        return $content;
    }


    /**
     * Minify the data.
     * Perform CSS optimizations.
     *
     * @param string[optional] $path    Path to write the data to
     * @param string[]         $parents Parent paths, for circular reference checks
     *
     * @return string The minified data
     */
    public function execute($path = null)
    {
        $content = '';

        // loop CSS data (raw data and files)
        foreach ($this->data as $source => $css) {
            /*
             * Let's first take out strings & comments, since we can't just
             * remove whitespace anywhere. If whitespace occurs inside a string,
             * we should leave it alone. E.g.:
             * p { content: "a   test" }
             */
            $this->extractStrings();
            $css = $this->replace($css);

            // restore the string we've extracted earlier
            $css = $this->restoreExtractedData($css);

            $source = is_int($source) ? $this->source_root : $source;

            /*
             * If we'll save to a new path, we'll have to fix the relative paths
             * to be relative no longer to the source file, but to the new path.
             * If we don't write to a file, fall back to same path so no
             * conversion happens (because we still want it to go through most
             * of the move code, which also addresses url() & @import syntax...)
             */
            $converter = $this->getPathConverter($source, $path ?: $source);
            $css = $this->move($converter, $css);

            // combine css
            $content .= $css;
        }

        $content = $this->moveImportsToTop($content);

        return $content;
    }

    /**
     * Moving a css file should update all relative urls.
     * Relative references (e.g. ../images/image.gif) in a certain css file,
     * will have to be updated when a file is being saved at another location
     * (e.g. ../../images/image.gif, if the new CSS file is 1 folder deeper).
     *
     * @param ConverterInterface $converter Relative path converter
     * @param string             $content   The CSS content to update relative urls for
     *
     * @return string
     */
    protected function move(ConverterInterface $converter, $content)
    {
        /*
         * Relative path references will usually be enclosed by url(). @import
         * is an exception, where url() is not necessary around the path (but is
         * allowed).
         * This *could* be 1 regular expression, where both regular expressions
         * in this array are on different sides of a |. But we're using named
         * patterns in both regexes, the same name on both regexes. This is only
         * possible with a (?J) modifier, but that only works after a fairly
         * recent PCRE version. That's why I'm doing 2 separate regular
         * expressions & combining the matches after executing of both.
         */
        $relativeRegexes = array(
            // url(xxx)
            '/
            # open url()
            url\(

                \s*

                # open path enclosure
                (?P<quotes>["\'])?

                    # fetch path
                    (?P<path>.+?)

                # close path enclosure
                (?(quotes)(?P=quotes))

                \s*

            # close url()
            \)

            /ix',

            // @import "xxx"
            '/
            # import statement
            @import

            # whitespace
            \s+

                # we don\'t have to check for @import url(), because the
                # condition above will already catch these

                # open path enclosure
                (?P<quotes>["\'])

                    # fetch path
                    (?P<path>.+?)

                # close path enclosure
                (?P=quotes)

            /ix',
        );

        // find all relative urls in css
        $matches = array();
        foreach ($relativeRegexes as $relativeRegex) {
            if (preg_match_all($relativeRegex, $content, $regexMatches, PREG_SET_ORDER)) {
                $matches = array_merge($matches, $regexMatches);
            }
        }

        $search = array();
        $replace = array();

        // loop all urls
        foreach ($matches as $match) {
            // determine if it's a url() or an @import match
            $type = (strpos($match[0], '@import') === 0 ? 'import' : 'url');

            $url = $match['path'];
            if ($this->canImportByPath($url)) {
                // attempting to interpret GET-params makes no sense, so let's discard them for awhile
                $params = strrchr($url, '?');
                $url = $params ? substr($url, 0, -strlen($params)) : $url;

                // fix relative url
                $url = $converter->convert($url);

                // now that the path has been converted, re-apply GET-params
                $url .= $params;
            }

            /*
             * Urls with control characters above 0x7e should be quoted.
             * According to Mozilla's parser, whitespace is only allowed at the
             * end of unquoted urls.
             * Urls with `)` (as could happen with data: uris) should also be
             * quoted to avoid being confused for the url() closing parentheses.
             * And urls with a # have also been reported to cause issues.
             * Urls with quotes inside should also remain escaped.
             *
             * @see https://developer.mozilla.org/nl/docs/Web/CSS/url#The_url()_functional_notation
             * @see https://hg.mozilla.org/mozilla-central/rev/14abca4e7378
             * @see https://github.com/matthiasmullie/minify/issues/193
             */
            $url = trim($url);
            if (preg_match('/[\s\)\'"#\x{7f}-\x{9f}]/u', $url)) {
                $url = $match['quotes'] . $url . $match['quotes'];
            }

            // build replacement
            $search[] = $match[0];
            if ($type === 'url') {
                $replace[] = 'url('.$url.')';
            } elseif ($type === 'import') {
                $replace[] = '@import "'.$url.'"';
            }
        }

        // replace urls
        return str_replace($search, $replace, $content);
    }

   



    /**
     * Check if file a file can be imported, going by the path.
     *
     * @param string $path
     *
     * @return bool
     */
    protected function canImportByPath($path)
    {
        return preg_match('/^(data:|https?:|\\/)/', $path) === 0;
    }

    /**
     * Return a converter to update relative paths to be relative to the new
     * destination.
     *
     * @param string $source
     * @param string $target
     *
     * @return ConverterInterface
     */
    protected function getPathConverter($source, $target)
    {
        return new Converter($source, $target);
    }
}
