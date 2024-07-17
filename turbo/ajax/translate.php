<?php

require_once('../../api/GoogleTranslate.php');

$source = $_POST['source_lang'];
$target = $_POST['target_lang'];
$text = $_POST['text'];

$tr = new GoogleTranslateForFree();
$result = $tr->translate($source, $target, $text);

echo $result;
