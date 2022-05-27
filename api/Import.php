<?php

require_once('Turbo.php');

class Import extends Turbo
{

    // Correspondence of fields in the database and column names in the file
    public $columns_names = array(
        'category' =>         array('category'),
        'brand' =>            array('brand'),
        'name' =>             array('product', 'name'),
        'variant' =>          array('variant'),
        'sku' =>              array('sku'),
        'price' =>            array('price'),
        'compare_price' =>    array('compare price', 'old price'),
        'weight' =>           array('weight'),
        'stock' =>            array('stock'),
        'visible' =>          array('visible', 'published'),
        'featured' =>         array('featured', 'hit'),
        'meta_title' =>       array('meta title'),
        'meta_keywords' =>    array('meta keywords'),
        'meta_description' => array('meta description'),
        'annotation' =>       array('annotation'),
        'description' =>      array('description'),
        'images' =>           array('images'),
        'url' =>              array('url')

    );

    // Correspondence of the column name and field in the database 
    protected $internal_columns_names;

    protected $import_files_dir      = 'turbo/files/import/';   // Temporary folder
    protected $import_file           = 'import.csv';            // Temporary file
    protected $category_delimiter    = ',';                     // Category separator in file
    protected $subcategory_delimiter = '/';                     // Subcategory separator in file
    protected $values_delimiter      = '|';                     // Product property value separator
    protected $column_delimiter      = ';';
    protected $products_count        = 100;
    protected $columns               = array();
	protected $locale                = 'en_US.UTF-8';
    protected $values_ids            = array();

    // Returns the internal column name based on the column name in the file
    private function internal_column_name($name)
    {
        $name = trim($name);
        $name = str_replace('/', '', $name);
        $name = str_replace('\/', '', $name);
        foreach ($this->columns_names as $i => $names) {
            foreach ($names as $n) {
                if (!empty($name) && preg_match("/^" . preg_quote($name) . "$/ui", $n)) {
                    return $i;
                }
            }
        }
        return false;
    }

    // Replacing the column names from the file with internal column names
    protected function init_internal_columns($fields = array())
    {
        if (isset($this->internal_columns_names)) {
            return true;
        }
        if (empty($this->columns)) {
            return false;
        }
        if (!empty($fields)) {
            foreach ($fields as $csv => $inner) {
                if (isset($this->columns_names[$inner]) && !in_array(mb_strtolower($csv), array_map("mb_strtolower", $this->columns_names[$inner]))) {
                    $this->columns_names[$inner][] = $csv;
                }
            }
        }
        $this->internal_columns_names = array();
        foreach ($this->columns as &$column) {
            if ($internal_name = $this->internal_column_name($column)) {
                $this->internal_columns_names[$column] = $internal_name;
                $column = $internal_name;
            }
        }
        return true;
    }

    // Define columns from the first line of the file
    protected function init_columns()
    {
        $f = fopen($this->import_files_dir . $this->import_file, 'r');
        $this->columns = fgetcsv($f, null, $this->column_delimiter);
        fclose($f);
    }
}
