<?php

/*
 *  Helper methods for controlling output buffering
 */

$etag_depth = 0;

function is_being_etagged() {
    global $etag_depth;

    return $etag_depth > 0;
}

function etag_start() {
    global $etag_depth;

    if ( $etag_depth == 0 ) ob_start();

    $etag_depth++;

    rc_log("New Request");
}

function etag_end() {
    global $etag_depth;

    $etag_depth--;

    if ( $etag_depth > 0 ) return;

    $content = ob_get_clean();
    $etag = hash('sha256', $content);
    $request = isset( $_SERVER['HTTP_IF_NONE_MATCH'] ) ? $_SERVER['HTTP_IF_NONE_MATCH'] : "";

    rc_log("ETAG - " . $etag);
    rc_log("IS SET - " . isset( $_SERVER['HTTP_IF_NONE_MATCH'] ));
    rc_log("REQUEST - " . $request);

    if ( $etag == $request ) {
        rc_log("Returning 304");
        http_response_code(304);
        return;
    } 

    header('Etag: ' . $etag);
    echo $content;
}