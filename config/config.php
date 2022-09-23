;<? exit(); ?>

[database]

;Database server
db_server = "localhost";

;Database User
db_user = "root";

;Database password
db_password = "root";

;Database name
db_name = "turboshop";

;Prefix for tables
db_prefix = "t_";

;Database encoding
db_charset = "UTF8MB4";

;SQL Mode
db_sql_mode = "NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";

;Time zone offset
;db_timezone = "+03:00";

[php]

error_reporting = E_ALL;
php_charset = UTF8;
php_locale_collate = en_US;
php_locale_ctype = en_US;
php_locale_monetary = en_US;
php_locale_numeric = en_US;
php_locale_time = en_US;
;php_timezone = Europe/Kiev;
debug_mode = false;

logfile = admin/log/log.txt;

[debug]

debug = false;

[minify]

minify_js = false; compress javascript (true=yes, false=no)
minify_css = false; compress css (true=yes, false=no)
minify_gzip_level = 0; compression level (gzip) from 0 to 9
minify_cache_dir = /cache/minify/; cache folder

[smarty]

smarty_compile_check = true;
smarty_caching = false;
smarty_cache_lifetime = 0;
smarty_debugging = false;
smarty_html_minify = false;
smarty_security = true;
debug_translation = false;

[images]

;Use imagemagick for image processing (instead of gd)
use_imagick = true;

;Directory of original images
original_images_dir = files/originals/;

;Thumbnail directory
resized_images_dir = files/products/;

;Category images
categories_images_dir = files/categories/;
resized_category_images_dir = files/categories/preview/;

;Brand images
brands_images_dir = files/brands/;
resized_brands_images_dir = files/brands/preview/;

;Watermark image file
watermark_file = turbo/files/watermark/watermark.png;

;Banner images
banners_images_dir = files/slides/;
resized_banners_images_dir = files/slides/preview/;

;Blog post images
posts_images_dir = files/posts/;
resized_posts_images_dir = files/posts/preview/;

;Article post images
articles_images_dir = files/articles/;
resized_articles_images_dir = files/articles/preview/;

[files]

;File directory
cms_files_dir = files/files/;