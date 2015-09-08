<?php $id = rand(1,10); $width =  100/$columns; // echo $columns;die;?>

<div id="pavcarousel<?php echo $id;?>" class="panel panel-default panel-v1 carousel slide pavcarousel">
	<div class="panel-heading hidden">
		<h4 class="panel-title"><?php echo $objlang->get('text_logo_brand');?></h4>
	</div>
	<div class="panel-body carousel-content text-center">
		<div class="carousel-inner box-content">
			<?php
			$pages = array_chunk( $banners, $itemsperpage );?>

			<?php foreach ($pages as $k => $tbanners) {?>
			<div class="item <?php if($k==0) {?>active<?php } ?>">
				<?php foreach( $tbanners as $i => $banner ) {  $i=$i+1;?>
				<?php if( $i%$columns == 1 ) { ?>
				<div class="row">
					<?php } ?>
				<div style="width:<?php echo $width;?>%; float: left">
				
						<div class="item-inner">
							<?php if ($banner['link']) { ?>
							<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
							<?php } else { ?>
							<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
							<?php } ?>
						</div>
					</div>

					<?php if( $i%$columns == 0 || $i==count($tbanners) ) { ?>
				</div>
				<?php } ?>
				<?php } //endforeach; banner ?>
			</div>
			<?php } //endforeach; pages?>	
		</div>
		<?php if( count($banners) > $itemsperpage ){ ?>	
		<div class="carousel-controls carousel-controls-v3">
			<a class="carousel-control radius-x left middle" href="#pavcarousel<?php echo $id;?>" data-slide="prev">
				<i class="fa fa-angle-left"></i>
			</a>
			<a class="carousel-control radius-x right middle" href="#pavcarousel<?php echo $id;?>" data-slide="next">
				<i class="fa fa-angle-right"></i>
			</a>
		</div>
				
		<?php } ?>
	</div>
</div>
<?php if( count($banners) > 1 ){ ?>
<script type="text/javascript"><!--
$('#pavcarousel<?php echo $id;?>').carousel({interval:false});
--></script>
<?php } ?>