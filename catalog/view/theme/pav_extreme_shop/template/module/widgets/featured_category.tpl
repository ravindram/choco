<div class="widget-category clearfix <?php echo $addition_cls?>">
	<?php if( $show_title ) { ?>
	<div class="widget-heading panel-heading"><h4><span class="panel-title"><?php echo $heading_title?></span></h4></div>
	<?php } ?>
	<div class="widget-inner">	
		<?php if(!empty($categories)) { ?>
			<div class="box-content">
				<ul class="list-unstyled">
					<?php foreach ($categories as $category): ?>
					<li>
						<a href="<?php echo $category['href']; ?>">
							<?php if ($category['image'] !== '') { ?>
							<img src="image/<?php echo $category['image']; ?>" alt="" class="img-responsive">
							<?php
							} ?>
						</a>
						<div class="caption action">
							<h6><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h6>
							<div class="item"><a class="text-lighten" href="<?php echo $category['href']; ?>"><?php echo $category['items']; ?></a></div>
							<a class="link" href="<?php echo $category['href']; ?>"><i class="icons icons-outline icons-md radius-x fa fa-arrow-right"></i></a>
						</div>						
					</li>
					<?php endforeach ?>
				</ul>
			</div>
		<?php } ?>


	</div>
</div>