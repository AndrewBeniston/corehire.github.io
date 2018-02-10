<?php

/*
 *  pass in ?fragment=true to get the page without the header and footer
 */
function is_fragment() {
    return isset( $_GET['fragment'] ) && 'true' === $_GET['fragment'];
}


function rc_log($msg) {
    $file = __DIR__ . "/log.txt";
    // Open the file to get existing content
    $current = file_get_contents($file);
    // Append a new person to the file
    $current .= date("Y-m-d h:i:sa") . ": " . $msg . "\n";
    // Write the contents back to the file
    $result = file_put_contents($file, $current);
}