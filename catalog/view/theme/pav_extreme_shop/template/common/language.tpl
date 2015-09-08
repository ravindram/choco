 <div class="quickaccess-toggle">
    <span><?php echo $text_language; ?></span><i class="fa fa-angle-down"></i>
    <div class="inner-toggle">
    <?php if (count($languages) > 1) { ?>
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
	    <ul class="list-inline">
	      <?php foreach ($languages as $language) { ?>
	      <li><a href="<?php echo $language['code']; ?>">
	      <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /></a>
	      </li>
	      <?php } ?>
	    </ul>
	  <input type="hidden" name="code" value="" />
	  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</form>
	<?php } ?>
    </div>
</div>