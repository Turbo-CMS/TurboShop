<?php

session_start();

require_once('../../api/Turbo.php');

class ImportAjax extends Turbo
{
    // Correspondence of fields in the database and column names in the file
    private $columns_names = array(
        'name' =>             array('product', 'name'),
        'url' =>              array('url'),
        'visible' =>          array('visible', 'published'),
        'featured' =>         array('featured', 'hit'),
        'category' =>         array('category'),
        'brand' =>            array('brand'),
        'variant' =>          array('variant'),
        'price' =>            array('price'),
        'compare_price' =>    array('compare price'),
        'sku' =>              array('sku'),
        'stock' =>            array('stock'),
        'meta_title' =>       array('meta title'),
        'meta_keywords' =>    array('meta keywords'),
        'meta_description' => array('meta description'),
        'annotation' =>       array('annotation'),
        'description' =>      array('description'),
        'images' =>           array('images')
    );

    // Correspondence of the column name and field in the database
    private $internal_columns_names = array();

    private $import_files_dir      = '../files/import/';     // Temporary folder
    private $import_file           = 'import.csv';           // Temporary file
    private $category_delimiter = ',';                       // Category separator in a file
    private $subcategory_delimiter = '/';                    // Subcategory separator in a file
    private $column_delimiter      = ';';
    private $products_count        = 10;
    private $columns               = array();

    public function import()
    {
        if (!$this->managers->access('import'))
            return false;

        // For correct operation, set the locale to UTF-8
        setlocale(LC_ALL, 'en_EN.UTF-8');

        $result = new stdClass;

        // Define columns from the first line of the file
        $f = fopen($this->import_files_dir . $this->import_file, 'r');
        $this->columns = fgetcsv($f, null, $this->column_delimiter);

        // Replacing the column names from the file with internal column names
        foreach ($this->columns as &$column) {
            if ($internal_name = $this->internal_column_name($column)) {
                $this->internal_columns_names[$column] = $internal_name;
                $column = $internal_name;
            }
        }

        // If there is no product name, we will not import
        if (!in_array('name', $this->columns) && !in_array('sku', $this->columns))
            return false;

        // Go to the given position if we import not from the beginning
        if ($from = $this->request->get('from'))
            fseek($f, $from);

        // Array of imported goods
        $imported_items = array();

        // Loop through the lines until the end of the file
        // or until enough rows have been imported for a single request
        for ($k = 0; !feof($f) && $k < $this->products_count; $k++) {
            // Читаем строку
            $line = fgetcsv($f, 0, $this->column_delimiter);

            $product = null;

            if (is_array($line))
                //Looping through the columns of a row
                foreach ($this->columns as $i => $col) {
                    // Create an array item[column_name]=value
                    if (isset($line[$i]) && !empty($line) && !empty($col))
                        $product[$col] = $line[$i];
                }

            // We import this product
            if ($imported_item = $this->import_item($product))
                $imported_items[] = $imported_item;
        }

        // We remember where the import ended
        $from = ftell($f);

        // And have you finished the whole file?
        $result->end = feof($f);

        fclose($f);
        $size = filesize($this->import_files_dir . $this->import_file);

        // Create a result object
        $result->from = $from;          // Where did you stop
        $result->totalsize = $size;     // Whole file size
        $result->items = $imported_items;   // Imported products

        return $result;
    }

    // Single item import $item[column_name] = value;
    private function import_item($item)
    {
        $imported_item = new stdClass;

        // Check if the name and article are not empty (there must be at least one of them)
        if (empty($item['name']) && empty($item['sku']))
            return false;

        // Prepare the product for adding to the database
        $product = array();

        if (isset($item['name']))
            $product['name'] = trim($item['name']);

        if (isset($item['meta_title']))
            $product['meta_title'] = trim($item['meta_title']);

        if (isset($item['meta_keywords']))
            $product['meta_keywords'] = trim($item['meta_keywords']);

        if (isset($item['meta_description']))
            $product['meta_description'] = trim($item['meta_description']);

        if (isset($item['annotation']))
            $product['annotation'] = trim($item['annotation']);

        if (isset($item['description']))
            $product['body'] = trim($item['description']);

        if (isset($item['visible']))
            $product['visible'] = intval($item['visible']);

        if (isset($item['featured']))
            $product['featured'] = intval($item['featured']);

        if (!empty($item['url']))
            $product['url'] = trim($item['url']);
        elseif (!empty($item['name']))
            $product['url'] = $this->translit($item['name']);

        // If a brand is given
        if (!empty($item['brand'])) {
            $item['brand'] = trim($item['brand']);
            // Let's find him by name
            $this->db->query('SELECT id FROM __brands WHERE name=?', $item['brand']);
            if (!$product['brand_id'] = $this->db->result('id'))
                // Create if not found
                $product['brand_id'] = $this->brands->add_brand(array('name' => $item['brand'], 'meta_title' => $item['brand'], 'meta_keywords' => $item['brand'], 'meta_description' => $item['brand']));
        }

        // Prepare a product variant
        $category_id = null;
        $categories_ids = array();
        if (!empty($item['category'])) {
            foreach (explode($this->category_delimiter, $item['category']) as $c)
                $categories_ids[] = $this->import_category($c);
            $category_id = reset($categories_ids);
        }

        // Prepare a product variant
        $variant = array();

        if (isset($item['variant']))
            $variant['name'] = trim($item['variant']);

        if (isset($item['price']))
            $variant['price'] = str_replace(',', '.', str_replace(' ', '', trim($item['price'])));

        if (isset($item['compare_price']))
            $variant['compare_price'] = trim($item['compare_price']);

        if (isset($item['stock']))
            if ($item['stock'] == '')
                $variant['stock'] = null;
            else
                $variant['stock'] = trim($item['stock']);

        if (isset($item['sku']))
            $variant['sku'] = trim($item['sku']);

        // If a variant article is given, we will find this variant and the corresponding product
        if (!empty($variant['sku'])) {
            $this->db->query('SELECT v.id as variant_id, v.product_id FROM __variants v, __products p WHERE v.sku=? AND v.product_id = p.id LIMIT 1', $variant['sku']);
            $result = $this->db->result();
            if ($result) {
                // and update the product
                if (!empty($product))
                    $this->products->update_product($result->product_id, $product);
                // and variant
                if (!empty($variant))
                    $this->variants->update_variant($result->variant_id, $variant);

                $product_id = $result->product_id;
                $variant_id = $result->variant_id;
                // Updated
                $imported_item->status = 'updated';
            }
        }

        // If the product was not found at the previous step, and at least the name of the product is specified
        if ((empty($product_id) || empty($variant_id)) && isset($item['name'])) {
            if (!empty($variant['sku']) && empty($variant['name']))
                $this->db->query('SELECT v.id as variant_id, p.id as product_id FROM __products p LEFT JOIN __variants v ON v.product_id=p.id WHERE v.sku=? LIMIT 1', $variant['sku']);
            elseif (isset($item['variant']))
                $this->db->query('SELECT v.id as variant_id, p.id as product_id FROM __products p LEFT JOIN __variants v ON v.product_id=p.id AND v.name=? WHERE p.name=? LIMIT 1', $item['variant'], $item['name']);
            else
                $this->db->query('SELECT v.id as variant_id, p.id as product_id FROM __products p LEFT JOIN __variants v ON v.product_id=p.id WHERE p.name=? LIMIT 1', $item['name']);

            $r =  $this->db->result();
            if ($r) {
                $product_id = $r->product_id;
                $variant_id = $r->variant_id;
            }
            // If a variant is found - update
            if (!empty($variant_id)) {
                $this->variants->update_variant($variant_id, $variant);
                $this->products->update_product($product_id, $product);
                $imported_item->status = 'updated';
            }
            // Otherwise, add
            elseif (empty($variant_id)) {
                if (empty($product_id))
                    $product_id = $this->products->add_product($product);

                $this->db->query('SELECT max(v.position) as pos FROM __variants v WHERE v.product_id=? LIMIT 1', $product_id);
                $pos =  $this->db->result('pos');

                $variant['position'] = $pos + 1;
                $variant['product_id'] = $product_id;
                $variant_id = $this->variants->add_variant($variant);
                $imported_item->status = 'added';
            }
        }

        if (!empty($variant_id) && !empty($product_id)) {
            // Need to return a refurbished product
            $imported_item->variant = $this->variants->get_variant(intval($variant_id));
            $imported_item->product = $this->products->get_product(intval($product_id));

            // Adding product categories
            if (!empty($categories_ids))
                foreach ($categories_ids as $c_id)
                    $this->categories->add_product_category($product_id, $c_id);

            // Product images
            if (isset($item['images'])) {
                // There can be several images, separated by commas
                $images = explode(',', $item['images']);
                foreach ($images as $image) {
                    $image = trim($image);
                    if (!empty($image)) {
                        // File name
                        $image_filename = pathinfo($image, PATHINFO_BASENAME);

                        // We add an image only if it is not already in this product
                        $this->db->query('SELECT filename FROM __images WHERE product_id=? AND (filename=? OR filename=?) LIMIT 1', $product_id, $image_filename, $image);
                        if (!$this->db->result('filename')) {
                            $this->products->add_image($product_id, $image);
                        }
                    }
                }
            }
            // Product features
            foreach ($item as $feature_name => $feature_value) {
                // If there is no such column name, then this is the name of the property
                if (!in_array($feature_name, $this->internal_columns_names)) {
                    // The property is added only if the product has a category and a non-empty property value
                    if ($category_id && $feature_value !== '') {
                        $this->db->query('SELECT f.id FROM __features f WHERE f.name=? LIMIT 1', $feature_name);
                        if (!$feature_id = $this->db->result('id'))
                            $feature_id = $this->features->add_feature(array('name' => $feature_name, 'url' => $this->translit($feature_name)));

                        if (!empty($feature_value)) {
                            $this->features->add_feature_category($feature_id, $category_id);
                            while ($this->features->get_options(array('product_id' => $product_id, 'feature_id' => $feature_id)))
                                $this->features->delete_option($product_id, $feature_id);
                            $pos = 0;
                            foreach (explode('|', $feature_value) as $f_value)
                                $this->features->update_option($product_id, $feature_id, $f_value, $pos++);
                        }
                    }
                }
            }
            return $imported_item;
        }
    }

    // Separate function for category import
    private function import_category($category)
    {
        // The field "category" can consist of several names separated by subcategory_delimiter
        // Only unescaped subcategory_delimiter can delimit categories
        $delimiter = $this->subcategory_delimiter;
        $regex = "/\\DELIMITER((?:[^\\\\\DELIMITER]|\\\\.)*)/";
        $regex = str_replace('DELIMITER', $delimiter, $regex);
        $names = preg_split($regex, $category, 0, PREG_SPLIT_DELIM_CAPTURE);
        $id = null;
        $parent = 0;

        // For each category
        foreach ($names as $name) {
           // Replace \/ with /
            $name = trim(str_replace("\\$delimiter", $delimiter, $name));
            if (!empty($name)) {
                // Find category by name
                $this->db->query('SELECT id FROM __categories WHERE name=? AND parent_id=?', $name, $parent);
                $id = $this->db->result('id');

                // If not found, add it
                if (empty($id))
                    $id = $this->categories->add_category(array('name' => $name, 'parent_id' => $parent, 'meta_title' => $name,  'meta_keywords' => $name,  'meta_description' => $name, 'url' => $this->translit($name)));

                $parent = $id;
            }
        }
        return $id;
    }

    private function translit($text)
    {
        $ru = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я");
        $en = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

        $res = str_replace($ru, $en, $text);
        $res = preg_replace("/[\s]+/ui", '-', $res);
        $res = preg_replace('/[^\p{L}\p{Nd}\d-]/ui', '', $res);
        $res = strtolower($res);
        return $res;
    }

    // Returns the internal column name based on the column name in the file
    private function internal_column_name($name)
    {
        $name = trim($name);
        $name = str_replace('/', '', $name);
        $name = str_replace('\/', '', $name);
        foreach ($this->columns_names as $i => $names) {
            foreach ($names as $n)
                if (!empty($name) && preg_match("/^" . preg_quote($name) . "$/ui", $n))
                    return $i;
        }
        return false;
    }
}

$import_ajax = new ImportAjax();
header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

$json = json_encode($import_ajax->import());
print $json;
