<?php require( PAVO_THEME_DIR."/template/common/config_layout.tpl" );  ?>
<div class="container">
    <div class="breadcrumbs breadcrumbs-center light-style background-img-v1">      
        <?php $tmp = $breadcrumbs;  $end = array_slice($tmp , count($tmp)-1 ); ?>
        <h2 class="letter-spacing-2"><?php echo $end[0]['text'] ?></h2>
        <?php if( isset($breadcrumbs) ) { ?>
	    <ul class="list-unstyled breadcrumb-links">
	   		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	   		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	   		<?php } ?>
	   	</ul>
  	<?php } ?>
    </div>
</div>