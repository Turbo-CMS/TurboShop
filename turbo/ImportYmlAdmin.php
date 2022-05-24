<?php
require_once('api/Turbo.php');

class ImportYmlAdmin extends Turbo
{

    public $import_files_dir = 'turbo/files/import/';
    public $import_file = 'import.yml';
    public $import_file_csv = 'import.csv';
    public $allowed_extensions = array('yml', 'gz');
    private $locale = 'ru_RU.UTF-8';

    private $columns = array(
        'name' =>             'name',
        'url' =>              'url',
        'visible' =>          'visible',
        'featured' =>         'featured',
        'category' =>         'category',
        'brand' =>            'brand',
        'variant' =>          'variant',
        'price' =>            'price',
        'currency' =>         'currency',
        'weight' =>           'weight',
        'compare price' =>    'compare_price',
        'sku' =>              'sku',
        'stock' =>            'stock',
        'meta title' =>       'meta_title',
        'meta keywords' =>    'meta_keywords',
        'meta description' => 'meta_description',
        'annotation' =>       'annotation',
        'description' =>      'description',
        'images' =>           'images',

    );

    private $columns_min = array(
        'name' =>             '###1###',
        'url' =>              '###2###',
        'visible' =>          '###3###',
        'featured' =>         '###4###',
        'category' =>         '###5###',
        'brand' =>            '###6###',
        'variant' =>          '###7###',
        'price' =>            '###8###',
        'currency' =>         '###9###',
        'weight' =>           '###10###',
        'compare price' =>    '###11###',
        'sku' =>              '###12###',
        'stock' =>            '###13###',
        'meta title' =>       '###14###',
        'meta keywords' =>    '###15###',
        'meta description' => '###16###',
        'annotation' =>       '###17###',
        'description' =>      '###18###',
        'images' =>           '###19###',

    );

    private $columns_compared = array(
        'vendorCode' => 'sku',
        'offer_available' => 'visible',
        'price' => 'price',
        'oldprice' => 'compare price',
        'categoryId' => 'category',
        'picture' => 'images',
        'stock' => 'stock',
        'vendor' => 'brand',
        'model' => 'name',
        'description' => 'description',
    );

    public function fetch()
    {
        $this->design->assign('import_files_dir', $this->import_files_dir);
        if (!is_writable($this->import_files_dir)) {
            $this->design->assign('message_error', 'no_permission');
        }

        // Checking the locale 
        $old_locale = setlocale(LC_ALL, 0);
        setlocale(LC_ALL, $this->locale);
        if (setlocale(LC_ALL, 0) != $this->locale) {
            $this->design->assign('message_error', 'locale_error');
            $this->design->assign('locale', $this->locale);
        }
        setlocale(LC_ALL, $old_locale);

        // Check if the file is uploaded
        if ($this->request->method('post') && ($this->request->files("file") || $this->request->post("file_url"))) {

            // If the remote file is not specified, we take the uploaded file from the post request
            $temp = tempnam($this->import_files_dir, 'temp_');

            if (!$this->request->post("file_url")) {
                $uploaded_name = $this->request->files("file", "tmp_name");
                if (!$file_ok = move_uploaded_file($uploaded_name, $temp)) {
                    $this->design->assign('message_error', 'upload_error');
                }
            } else {
                $file_url = $this->request->post("file_url");
                if (!$file_ok = @copy($file_url, $temp)) {
                    $this->design->assign('message_error', 'download_error');
                }
            }
            //print "$file_ok";

            if ($file_ok && $is_gzip = $this->is_gzip($temp)) {
                $temp2 = $temp;
                $temp = tempnam($this->import_files_dir, 'temp_');
                $gzopen = gzopen($temp2, "r");
                $fopen = fopen($temp, "w");
                // Uncompress pieces of 2 mb and write 
                while (!feof($gzopen)) {
                    $data = gzread($gzopen, 2097152);
                    fwrite($fopen, $data);
                }
                fclose($fopen);
                gzclose($gzopen);
                unlink($temp2);
            }

            // We check the XML whether it is a file we got it
            $is_xml = $this->is_xml($temp);
            if ($file_ok && !$is_xml) {
                $content = file_get_contents($temp, null, null, null, 50);
                $this->design->assign('message_error', "XML ERROR. WRONG HEADER '$content'");
            } else {
                if (!$this->convert_file($temp, $this->import_files_dir . $this->import_file)) {
                    $this->design->assign('message_error', 'convert_error');
                }
            }
            unlink($temp);
        } elseif ($this->request->method('post') && $this->request->post("file_fields")) {
            // Choose from YML currencies
            $yml_currencies = $this->get_yml_currencies($this->import_files_dir . $this->request->post("file_fields"));
            // Save currencies for further work
            if (!empty($yml_currencies)) {
                $_SESSION['yml_currencies'] = $yml_currencies;
            }

            // Select field names from YML
            $yml_params = $this->get_yml_offers_params($this->import_files_dir . $this->request->post("file_fields"));
            //print_r($yml_params);

            // Select the available parameters from the database
            $this->db->query("SELECT name FROM __features ORDER BY position");
            $features = $this->db->results('name');

            // Add variables to access them from the tpl template
            $this->design->assign('features',  $features);
            $this->design->assign('yml_params',  $yml_params);
            $this->design->assign('yml_currencies',  $yml_currencies);
            $this->design->assign('columns',  $this->columns);
            $this->design->assign('columns_compared',  $this->columns_compared);
        }

        // Check if the page with the post request is open and we have valid XML
        if ($this->request->method('post') && $this->is_xml($this->import_files_dir . $this->import_file)) {
            $filename_yml_size = $this->human_filesize(filesize($this->import_files_dir . $this->import_file));
            //$filename_yml_size = $this->import_files_dir.$this->import_file;
            $this->design->assign('filename_yml',  $this->import_file);
            $this->design->assign('filename_yml_size',  $filename_yml_size);
        }

        if ($this->request->method('post') && $this->request->post("start_import_yml")) {
            //var_export($_POST);

            // Get field names from POST request
            $yml_params = $_POST['yml_params'];
            // Remove other service values from the array (only the parameters themselves remain)
            //unset($yml_params['session_id'], $yml_params['start_import_yml'], $yml_params['convert_only'], $yml_params['yml_import_currency']); 

            //print_r($yml_params);

            foreach ($yml_params as $k => $p) {
                if (mb_substr($p, 0, 6) == 'param_') {
                    $yml_params[$k] = mb_substr($p, 6);
                }
            }
            //print_r($yml_params);

            if ($_POST['convert_only'] == 1) {
                $this->design->assign('convert_only',  1);
            }

            if (isset($_POST['yml_import_currency'])) {
                $yml_currencies = $_SESSION['yml_currencies'];
                $yml_currency['id'] = $_POST['yml_import_currency'];
                $yml_currency['rate'] =  $yml_currencies[$yml_currency['id']]['rate'];
                // Create a currency if we don't have one yet (the standard get_currency method works crookedly, did not change the standard method, so I had to fence such a garden) 
				
                $db_currency = $this->money->get_currency($yml_currency['id']);
                if ($db_currency->code != $yml_currency['id']) {
                    $this->money->add_currency(array(
                        'name' => $yml_currency['id'], 'sign' => $yml_currency['id'],
                        'code' => $yml_currency['id'], 'code' => $yml_currency['id'],
                        'rate_from' => '1.00', 'rate_to' => '1.00'
                    ));
                    $yml_currency['dbid'] = $this->money->get_currency($yml_currency['id'])->id;
                } else {
                    $yml_currency['dbid'] = $db_currency->id;
                }
            }

            $yml_params = $this->add_minimum_params($yml_params, $this->columns_min);
            $this->convert_yml_to_csv($this->import_files_dir . $this->import_file, $this->import_files_dir . $this->import_file_csv, $yml_params, $yml_currency, $yml_currencies);

            $filename_csv_size = $this->human_filesize(filesize($this->import_files_dir . $this->import_file_csv));
            $this->design->assign('filename_csv',  $this->import_file_csv);
            $this->design->assign('filename_csv_size',  $filename_csv_size);
        }

        return $this->design->fetch('import_yml.tpl');
    }

    private function is_gzip($realpath)
    {
        $mystery_string = file_get_contents($realpath, null, null, null, 50);

        if (mb_strpos($mystery_string, "\x1f" . "\x8b" . "\x08") !== false) {;
            return true;
        }
    }

    private function is_xml($realpath)
    {
        $mystery_string = trim(@file_get_contents($realpath, null, null, null, 50));

        if (mb_strpos($mystery_string, '<?xml') !== false) {
            return true;
        }
    }

    private function human_filesize($bytes, $decimals = 2)
    {
        $sz = 'BKMGTP';
        $factor = floor((strlen($bytes) - 1) / 3);
        return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . @$sz[$factor];
    }

    private function convert_file($source, $dest)
    {
        // Find out what encoding the file has
        $teststring = file_get_contents($source, null, null, null, 1000000);

        // Encoding - UTF8
        if (mb_detect_encoding($teststring, 'UTF-8')) {
            // Just copy the file
            return copy($source, $dest);
            // If encoding CP1251
        } elseif (mb_detect_encoding($teststring, 'CP1251')) {
            // Convert to UFT8
            if (!$src = fopen($source, "r")) {
                return false;
            }

            if (!$dst = fopen($dest, "w")) {
                return false;
            }

            while (($line = fgets($src, 4096)) !== false) {
                $line = $this->win_to_utf($line);
                fwrite($dst, $line);
            }
            fclose($src);
            fclose($dst);
            return true;
        }
    }

    private function win_to_utf($text)
    {
        if (function_exists('iconv')) {
            return @iconv('windows-1251', 'UTF-8', $text);
        } else {
            $t = '';
            for ($i = 0, $m = strlen($text); $i < $m; $i++) {
                $c = ord($text[$i]);
                if ($c <= 127) {
                    $t .= chr($c);
                    continue;
                }
                if ($c >= 192 && $c <= 207) {
                    $t .= chr(208) . chr($c - 48);
                    continue;
                }
                if ($c >= 208 && $c <= 239) {
                    $t .= chr(208) . chr($c - 48);
                    continue;
                }
                if ($c >= 240 && $c <= 255) {
                    $t .= chr(209) . chr($c - 112);
                    continue;
                }
                //	if ($c==184) { $t.=chr(209).chr(209); continue; };
                //	if ($c==168) { $t.=chr(208).chr(129);  continue; };
                if ($c == 184) {
                    $t .= chr(209) . chr(145);
                    continue;
                }; #ё
                if ($c == 168) {
                    $t .= chr(208) . chr(129);
                    continue;
                }; #Ё
                if ($c == 179) {
                    $t .= chr(209) . chr(150);
                    continue;
                }; #і
                if ($c == 178) {
                    $t .= chr(208) . chr(134);
                    continue;
                }; #І
                if ($c == 191) {
                    $t .= chr(209) . chr(151);
                    continue;
                }; #ї
                if ($c == 175) {
                    $t .= chr(208) . chr(135);
                    continue;
                }; #ї
                if ($c == 186) {
                    $t .= chr(209) . chr(148);
                    continue;
                }; #є
                if ($c == 170) {
                    $t .= chr(208) . chr(132);
                    continue;
                }; #Є
                if ($c == 180) {
                    $t .= chr(210) . chr(145);
                    continue;
                }; #ґ
                if ($c == 165) {
                    $t .= chr(210) . chr(144);
                    continue;
                }; #Ґ
                if ($c == 184) {
                    $t .= chr(209) . chr(145);
                    continue;
                }; #Ґ
            }
            return $t;
        }
    }

    private function get_yml_offers_params($xmlfile, $pics_concat = true)
    {
        $key = '';

        // Open XML
        $xml = new XMLReader;
        $xml->open($xmlfile);

        while ($xml->read() && $xml->name !== 'offer') {
        }

        while ($xml->name === 'offer') {
            $node = new SimpleXMLElement($xml->readOuterXML());

            $names = array();

            // We create these fields manually, because they are attributes of the $node itself, not within its elements
            $fields['offer_id'] = '';
            $fields['offer_available'] = '';

            foreach ($node as $elem) {
                $elem_name = (string)$elem->getName();
                // Change the name of the url tag so that there is no match with the url field
                if ($elem_name == 'url') {
                    $elem_name = '#url#';
                }

                // Separate recording of repeating elements or gluing picture elements
                if ($pics_concat == true && in_array($key, array('picture', 'image'))) {
                    $key = $elem_name;
                } else {
                    if (array_key_exists($elem_name, $names)) {
                        $key = $elem_name . count($names[$elem_name]);
                    } else {
                        $key = $elem_name;
                    }
                }

                // This array to count the number of repeated elements
                $names[$elem_name][] = '';

                if ($elem->attributes()) {
                    $attribs = array();
                    foreach ($elem->attributes() as $nnn) {
                        $attribs[] = $nnn;
                    }
                    $attribs = $elem_name . '_' . implode(', ', $attribs);
                    $fields[$attribs] = '';
                } else {
                    $fields[$key] = '';
                }
            }

            $xml->next('offer');
        }

        return $fields;
    }

    private function convert_yml_to_csv($xmlfile, $csvfile, $fields, $currency = array(), $currencies = array(), $pics_concat = true,  $codepage = null)
    {
        if (!is_string($xmlfile) || !is_string($csvfile) || !is_array($fields)) {
            error_log("required arguments missing!", 0);
            return false;
        }

        // Remove the array $currency and $currencies if any of the conditions worked
        if (empty($currencies) || !isset($currencies[$currency['id']]) || !is_string($currency['id']) || !is_numeric($currency['rate'])) {
            unset($currency, $currencies);
        }

        // Remove empty elements from array
        $fields = array_filter($fields);

        // File encoding
        $codepages = array('UTF-8', 'CP1251');
        $codepage = strtoupper($codepage);

        // If the encoding is set, the conversion will be performed
        if (isset($codepage) && in_array($codepage, $codepages)) {
            $convert_flag = true;
        }

        // Delete csv file if it already exists 
        if (file_exists($csvfile)) {
            @unlink($csvfile);
        }
        // Open csv file for writing

        // If it is not possible to open the file for writing, stop the function
        if (!$fcsv = fopen($csvfile, 'w')) {
            return false;
        }

        // Make a string template for writing to a file
        $flip = array_flip($fields);
        foreach ($fields as $k => $v) {
            $row_tpl[$k] = '';
        }
        //print_r($row_tpl);

        // Write 1 line with headings
        fputcsv($fcsv, $fields, ";");

        //открываем XML
        $xml = new XMLReader;
        $xml->open($xmlfile);

        // Select categories from XML file
        $yml_categories = $this->get_yml_categories($xmlfile);

        $opened = array();
        while ($xml->read() && $xml->name !== 'offer') {
        }

        while ($xml->name === 'offer') {
            // Make a row blank from the $row_tpl template
            $row = $row_tpl;
            // print_r($row);
            // Convert the XML offer node to a SimpleXMLElement object 
            $node = new SimpleXMLElement($xml->readOuterXML());

            // Array for element names, repeated element names will be written with different names
            $names = array();

            // Write the attributes of the $node itself
            $row['offer_id'] = (string)$node->attributes()['id'];
            $av = (string)$node->attributes()['available'];
            if ($av == 'true') {
                $row['offer_available'] = 1;
            } else {
                $row['offer_available'] = 0;
            }

            foreach ($node as $elem) {
                $elem_name = (string)$elem->getName();
                // Change the name of the url tag so that there is no match with the url field
                if ($elem_name == 'url') {
                    $elem_name = '#url#';
                }

                // Separate recording of repeating elements or gluing picture elements
                if ($pics_concat == true && $elem_name == 'picture') {
                    $key = $elem_name;
                } else {
                    if (array_key_exists($elem_name, $names)) {
                        $key = $elem_name . count($names[$elem_name]);
                    } else {
                        $key = $elem_name;
                    }
                }

                // This array to count the number of repeated elements
                $names[$elem_name][] = '';

                if ($elem->attributes()) {
                    $attribs = array();
                    foreach ($elem->attributes() as $nnn) {
                        $attribs[] = $nnn;
                    }
                    $attribs = $elem_name . '_' . implode(', ', $attribs);
                    // We write only if we have such a title in $row
                    if (isset($row[$attribs])) {
                        $row[$attribs] = (string)$elem;
                        $p = $row[$attribs];
                    }
                } else {
                    // We write only if we have such a title in $row
                    if (isset($row[$key])) {
                        if ($pics_concat == true && in_array($key, array('picture', 'image'))) {
                            if (!is_array($row[$key])) {
                                $row[$key] = array();
                            }
                            $row[$key][] = (string)$elem;
                        } else {
                            $row[$key] = (string)$elem;
                        }
                    }
                }
            }

            // Connect pictures with commas
            if ($pics_concat == true && is_array($row['picture'])) {
                $row['picture'] = implode(',', $row['picture']);
            }

            // Change the price to the one selected from the currency file
            // If the $currency array is not set, do not perform any transformations  
            
            //print_r($currencies);
            if (isset($currencies) && isset($row['currencyId'])) {
                if (is_numeric($currencies[$row['currencyId']]['rate'])) {
                    if (isset($row['price'])) {
                        $row['price'] = $row['price'] * $currencies[$row['currencyId']]['rate'] / $currency['rate'];
                    }

                    if (isset($row['oldprice'])) {
                        $row['oldprice'] = floatval($row['oldprice']) * $currencies[$row['currencyId']]['rate'] / $currency['rate'];
                    }
                    if (isset($row['currencyId'])) {
                        $row['currencyId'] = $currency['id'];
                    }
                }
            }
            // Add the currency id value, default is 0
            if (isset($currency['dbid']) && isset($row[$flip['currency']])) {
                $row[$flip['currency']] = $currency['dbid'];
            } else {
                $row[$flip['currency']] = 0;
            }

            if (isset($row['categoryId'])) {
                $row['categoryId'] = $yml_categories[$row['categoryId']]['path'];
            }

            // print_r($row);
            // write string to csv file
            // print "";
            fputcsv($fcsv, $row, ";");

            // Move on to the next <offer> node
            $xml->next('offer');
        }
        // Close the file
        fclose($fcsv);

        if (file_exists($csvfile)) {
            return true;
        } else {
            return false;
        }
    }

    private function add_minimum_params($params1, $params2)
    {
        if (!is_array($params1) || !is_array($params2) || empty($params1) || empty($params1)) {
            return false;
        }
        $params2 = array_diff(array_flip($params2), $params1);

        $merged = array_merge($params1, $params2);
        return $merged;
    }

    private function get_yml_currencies($xmlfile)
    {
        $xml = new XMLReader;
        $xml->open($xmlfile);

        $opened = array();
        while ($xml->read() && $xml->name !== 'currencies') {
        }

        $node = new SimpleXMLElement($xml->readOuterXML());
        //print_r($node);
        foreach ($node as $k => $n) {
            $id = (string)$n->attributes()['id'];
            $rate = (string)$n->attributes()['rate'];


            $cats[$id]['id'] = $id;
            $cats[$id]['rate'] = $rate;
        }

        return $cats;
    }

    function get_yml_categories($xmlfile)
    {
        $xml = new XMLReader;
        $xml->open($xmlfile);

        $opened = array();
        while ($xml->read() && $xml->name !== 'categories') {
        }

        $node = new SimpleXMLElement($xml->readOuterXML());
        //print_r($node);
        foreach ($node as $k => $n) {
            $id = (string)$n->attributes()['id'];
            $parent_id = (string)$n->attributes()['parentId'];


            $cats[$id]['id'] = $id;
            $cats[$id]['name'] = (string)$n;


            if (!empty($parent_id)) {
                $cats[$id]['parent_id'] = $parent_id;
            } else {
                $cats[$id]['parent_id'] = 0;
            }
        }

        // Category tree
        $tree = array();
        $tree['subcategories'] = array();

        // Pointers to tree nodes
        $pointers = array();
        $pointers[0] = &$tree;
        $pointers[0]['path'] = array();
        $pointers[0]['level'] = 0;

        $finish = false;
        while (!empty($cats)  && $finish === false) {
            $flag = false;
            // Go through all selected categories
            foreach ($cats as $k => $category) {
                if (isset($pointers[$category['parent_id']])) {
                    // Add the current category to the category tree (through the pointer)
                    $pointers[$category['id']] = $pointers[$category['parent_id']]['subcategories'][] = $category;

                    // Path to current category
                    $curr[0] = $category['name'];
                    $pointers[$category['id']]['path'] = implode("/", array_merge((array)$pointers[$category['parent_id']]['path'], $curr));

                    // Category nesting level
                    $pointers[$category['id']]['level'] = 1 + $pointers[$category['parent_id']]['level'];

                    // Removing the used category from the category array
                    unset($cats[$k]);
                    $flag = true;
                }
            }
            if ($flag === true) {
                $finish = true;
            }
        }

        return $pointers;
    }
}
