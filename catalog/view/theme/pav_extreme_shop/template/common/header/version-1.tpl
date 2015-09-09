<?php
  $this->language( 'module/themecontrol' );
  $objlang = $this->registry->get('language');
  $megamenu = $helper->renderModule('pavmegamenu');
  $autosearch = $helper->renderModule('pavautosearch');
  $verticalmenu = $helper->renderModule('pavverticalmenu');
  if( isset($_COOKIE[$themeName .'_skin']) && $_COOKIE[$themeName .'_skin'] ){
    $skin = trim($_COOKIE[$themeName .'_skin']);
  }
?>

<header id="header-layout">
<div  id="loader-theme" class="logo-store">
  <a class="img-responsive"></a>
  <p class="pull-center text-center">page is loaging...</p>
</div>
<nav id="topbar">
  <div class="container">
    <div class="inside">
      <div class="row ">
        <div class="col-lg-4 col-md-5 col-sm-4 col-xs-12 hidden-xs">
          <div class="custom-top pull-left">
          <i class="fa fa-phone"></i>
          <span> <?php echo $config->get('config_telephone');?></span>
        </div>
          <div class="custom-top pull-left hidden-sm hidden-xs">
          <i class="fa fa-envelope"></i><?php echo $config->get('config_email');?>
        </div>
        
      </div>    
      <div class="col-lg-8 col-md-7 col-sm-8 col-xs-12 pull-right">
        <div class="show-mobile pull-right">
         <div class="welcome hidden-xs pull-left">
          <?php if ($logged) { ?>
                <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> -
                <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
                <?php } else { ?>
                <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> or
                <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                <?php } ?>
        </div> 
            
        <div class="quick-user pull-right">
        <?php echo $language; ?>
        </div>  
        <div class="quick-user pull-right">
        <?php echo $currency; ?>
        </div>  
        <div class="quick-setting pull-right">
          <div class="quickaccess-toggle">
            <span><?php echo $objlang->get('text_setting');?></span><i class="fa fa-angle-down"></i>
            <div class="inner-toggle">
              <ul class="links ">
                <li><a class="wishlist" href="<?php echo $wishlist; ?>" id="wishlist-total"><span class="fa fa-heart"></span><?php echo $text_wishlist; ?></a></li>
                <li><a class="" href="<?php echo $account; ?>"><span class="fa fa-user"></span><?php echo $text_account; ?></a></li>
                <li><a class="shoppingcart" href="<?php echo $shopping_cart; ?>"><span class="fa fa-shopping-cart"></span><?php echo $text_shopping_cart; ?></a></li>
                <li><a class="last" href="<?php echo $checkout; ?>"><span class="fa fa-file"></span><?php echo $text_checkout; ?></a></li> 
                <?php if ($logged) { ?>
                    <li><a href="<?php echo $logout; ?>"><span class="fa fa-unlock"></span><?php echo $text_logout; ?></a></li>
                   <?php } else { ?>
                    <li><a href="<?php echo $register; ?>"><span class="fa fa-pencil"></span><?php echo $text_register; ?></a></li>
                    <li><a href="<?php echo $login; ?>"><span class="fa fa-unlock"></span><?php echo $text_login; ?></a> </li>
                  <?php } ?>

              </ul>
            </div>
          </div>
        </div>    
        <div class="quick-setting pull-right hidden-lg hidden-md">
          <div class="quickaccess-toggle">
            <i class="icon-list"></i>
            <div class="inner-toggle">
              <?php if ($logged) { ?>
                    <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> -
                    <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> or
                    <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                    <?php } ?>
            </div>
          </div>
        </div>
        </div>
      </div>      
      </div><!-- end -->
      </div>
  </div>
</nav>

  <div class="container">
    <div class="inside">
      <div class="row inner">
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
          <!-- logo -->
          <?php if( $logoType=='logo-theme'){ ?>
          <div  id="logo-theme" class="logo-store"><a href="<?php echo $home; ?>" class="img-responsive"><span><?php echo $name; ?></span></a></div>
          <?php } elseif ($logo) { ?>
          <div id="logo" class="logo-store"><a href="<?php echo $home; ?>" class="img-responsive"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
          <?php } ?>
        </div>
        <div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
          <!-- menu -->
          <div id="pav-mainnav" class="pav-mainnav"><div class="pav-megamenu">
            <button data-toggle="offcanvas" class="btn btn-success btn-xs canvas-menu hidden-lg hidden-md" type="button"><span class="fa fa-bars"></span> Menu</button>
                      
            <?php
            /**
            * Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
            */
            if (count($megamenu) && !empty($megamenu)) { echo $megamenu;?>
            <?php } elseif ($categories) { ?>
            <nav id="menu" class="navbar">
              <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                  <?php foreach ($categories as $category) { ?>
                  <?php if ($category['children']) { ?>
                  <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                  <div class="dropdown-menu">
                    <div class="dropdown-inner">
                      <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                      <ul class="list-unstyled">
                        <?php foreach ($children as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                        <?php } ?>
                      </ul>
                      <?php } ?>
                    </div>
                    <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
                  </li>
                  <?php } else { ?>
                  <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                  <?php } ?>
                  <?php } ?>
                </ul>
              </div>
            </nav>
            <?php } ?>
          </div></div> 
          <!-- menu -->     
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-9 hidden-xs">
          <?php echo $cart; ?>
          <div class="btn-group search-focus pull-right">
            <i class="fa fa-search"></i> 
          </div>        
        </div>
      </div>
  </div>
  </div>
</header>
<div class="nav-search">
  <?php echo $search; ?>
</div>
