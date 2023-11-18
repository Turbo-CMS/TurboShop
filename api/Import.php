<?php

require_once 'Turbo.php';

class Import extends Turbo
{
    public $columnsNames = [
        'category' => ['category'],
        'brand' => ['brand'],
        'name' => ['product', 'name'],
        'variant' => ['variant'],
        'color' => ['variant color'],
        'color_code' => ['color code'],
        'sku' => ['sku'],
        'price' => ['price'],
        'compare_price' => ['compare price', 'old price'],
        'currency' => ['currency', 'currency id'],
        'weight' => ['weight'],
        'stock' => ['stock'],
        'visible' => ['visible', 'published'],
        'featured' => ['featured', 'hit'],
        'meta_title' => ['meta title'],
        'meta_keywords' => ['meta keywords'],
        'meta_description' => ['meta description'],
        'annotation' => ['annotation'],
        'description' => ['description'],
        'images' => ['images'],
        'url' => ['url'],
    ];

    protected $internalColumnsNames;
    protected $importFilesDir = 'turbo/files/import/';
    protected $importFile = 'import.csv';
    protected $categoryDelimiter = ',';
    protected $subcategoryDelimiter = '/';
    protected $valuesDelimiter = '|';
    protected $columnDelimiter = ';';
    protected $productsCount = 100;
    protected $columns = [];
    protected $locale = 'en_US.UTF-8';
    protected $valuesIds = [];

    /**
     * Get Internal Column Name
     */
    private function getInternalColumnName($name)
    {
        $name = trim($name);
        $name = str_replace('/', '', $name);
        $name = str_replace('\/', '', $name);

        foreach ($this->columnsNames as $i => $names) {
            foreach ($names as $n) {
                if (!empty($name) && preg_match("/^" . preg_quote($name) . "$/ui", $n)) {
                    return $i;
                }
            }
        }

        return false;
    }

    /**
     * Initializes Internal Columns
     */
    protected function initInternalColumns($fields = [])
    {
        if (isset($this->internalColumnsNames)) {
            return true;
        }

        if (empty($this->columns)) {
            return false;
        }

        if (!empty($fields)) {
            foreach ($fields as $csv => $inner) {
                if (isset($this->columnNames[$inner]) && !in_array(mb_strtolower($csv), array_map('mb_strtolower', $this->columnNames[$inner]))) {
                    $this->columnsNames[$inner][] = $csv;
                }
            }
        }

        $this->internalColumnsNames = [];

        foreach ($this->columns as &$column) {
            if ($internalName = $this->getInternalColumnName($column)) {
                $this->internalColumnsNames[$column] = $internalName;
                $column = $internalName;
            }
        }

        return true;
    }

    /**
     * Init Columns
     */
    protected function initColumns()
    {
        $fileHandler = fopen($this->importFilesDir . $this->importFile, 'r');
        $this->columns = fgetcsv($fileHandler, null, $this->columnDelimiter);
        fclose($fileHandler);
    }
}
