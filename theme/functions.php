<?php

// Add in all the supported WordPress options
function setup_theme() {

    // Add default posts and comments RSS feed links to head.
    add_theme_support( 'automatic-feed-links' );
    
    /*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
    add_theme_support( 'title-tag' );
    
    /*
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
	 */
	add_theme_support( 'post-thumbnails' );
	// add_image_size( 'featured-image', 2000, 1200, true ); // true to crop
    // add_image_size( 'thumbnail-avatar', 100, 100, true );
    
    // Add theme support for Custom Logo.
	add_theme_support( 'custom-logo', array(
		'width'       => 250,
		'height'      => 250,
        'flex-width'  => true,
        'header-text' => array( 'site-title', 'site-description' ),
    ) );
    
    /*
	 * Enable support for Post Formats.
	 *
	 * See: https://codex.wordpress.org/Post_Formats
	 */
	add_theme_support( 'post-formats', array(
		'aside',
		'image',
		'video',
		'quote',
		'link',
		'gallery',
		'audio',
    ) );
    
    /*
	 * This theme styles the visual editor to resemble the theme style,
	 * specifically font, colors, and column width.
 	 */
	//add_editor_style( array( 'assets/css/editor-style.css') );

}
add_action('after_setup_theme', 'setup_theme');


// Hide admin update notifications to everyone except Admin users
function hide_update_notices() {
	if (!current_user_can("update_core")) {
		remove_action("admin_notices", "update_nag", 3);	
		remove_submenu_page( 'index.php', 'update-core.php' );
	}
	
}
add_action("admin_head", "hide_update_notices");



/**
 * Include all other helper files
 */
require get_parent_theme_file_path( '/inc/template-tags.php' );
require get_parent_theme_file_path( '/inc/helper-etag.php' );
require get_parent_theme_file_path( '/inc/helper-misc.php' );