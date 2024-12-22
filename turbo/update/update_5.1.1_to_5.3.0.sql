ALTER TABLE t_banners_images ADD COLUMN side VARCHAR(255) NOT NULL AFTER code;
INSERT INTO t_settings (name, value) VALUES ('image_quality', '90');