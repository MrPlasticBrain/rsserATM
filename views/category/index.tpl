<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title><?php echo $title; ?></title>
    </head>
    <body>
	
		<?php include HOME . DS . 'includes' . DS . 'menu.inc.php'; ?>
		
        <h1>Categories</h1>

		<?php 
            if ($categories){
            foreach ($categories as $c){ ?>

			<article>
				<header>
					<h1><a href="<?php echo SITE_URL?>/category/details/<?php echo $c['category_id']; ?>"><?php echo $c['category_name']; ?></a></h1>
					<p><?php echo $c['category_name']; ?></p>
					
				</header>
				<p><?php echo $c['category_name']; ?></p>
				<p><a href="<?php echo SITE_URL?>/category/details/<?php echo $c['category_id']; ?>">Continue reading</a></p>
				<hr/>
			</article>
		<?php 
            }
            }else{ ?>

        <h1>Welcome!</h1>
        <p>We currently do not have any category.</p>

        <?php }//endif; ?>
		
    </body>
</html>