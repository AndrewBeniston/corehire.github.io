<?php 
	etag_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    <h1><a href="/">Hello</a></h1>
    <main>
        <?php
			if ( have_posts() ) :

				/* Start the Loop */
				while ( have_posts() ) : the_post();

					/*
					 * Include the Post-Format-specific template for the content.
					 * If you want to override this in a child theme, then include a file
					 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
					 */
					get_template_part( 'template-parts/post/content', get_post_format() );

				endwhile;

				the_posts_pagination(
					array(
						'prev_text' => '<span class="screen-reader-text">Previous page</span>',
						'next_text' => '<span class="screen-reader-text">Next page</span>',
						'before_page_number' => '<span class="meta-nav screen-reader-text">Page</span>',
					) 
				);

			else :

				get_template_part( 'template-parts/post/content', 'none' );

			endif;
        ?>
    </main>
</body>
</html>
<?php
	etag_end();
?>