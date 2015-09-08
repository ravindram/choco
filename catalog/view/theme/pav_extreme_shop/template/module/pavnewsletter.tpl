<?php 
	 
	$id='newsletter'.rand();
?>
<?php if( $mode == 'flybot') { ?>
<div class="footer-newsletter" id="<?php echo $id; ?>">
  <div class="">
    <div class="row">
    	<div class=" ">
    		<div class="newsletter-fly">
		    	<div class="col-lg-5 col-md-5 hidden-sm hidden-xs">
					<?php if (!empty($social)): ?>
							<?php  echo html_entity_decode( $social );?>
					<?php endif ?>
				</div>

		      	<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
		      		<div class="newsletter-v3 bg-success clearfix">
		      			<div class="col-lg-5 col-md-6 col-sm-5 col-xs-12">
						<h4 class="newsletter-label"><?php echo $objlang->get("entry_sign_up_for_newsletter");?></h4>
						<div><?php echo html_entity_decode( $description );?></div>
					</div>
					<div class="col-lg-7 col-md-6 col-sm-7 col-xs-12">		
							<form id="formNewLestter" method="post" action="<?php echo $action; ?>">
								<div class="input-group">
								<input type="text" placeholder="" class="form-control radius-7x email" <?php if(!isset($customer_email)): ?> <?php endif; ?> size="18" name="email">
								<span class="input-group-btn">
									<button type="submit" name="submitNewsletter" class="btn btn-inverse-light">
			                            <?php echo $objlang->get("button_ok");?>
			                        </button>
								</span>
								</div>		
				
							<div class="valid"></div>
						</form>
					</div>
		      		</div>
					
				</div>
			</div>
		</div>	<!-- end offset -->
    </div>
  </div>
</div>

<?php } else { ?>
<div class="<?php echo $prefix; ?>newsletter-v8 parallax space-padding-tb-120 box newsletter" id="newsletter_<?php echo $position.$id;?>">
	<div class="heading heading-light">
        <h1><?php echo $objlang->get("entry_sign_up_for_newsletter");?>  </h1>
        <?php echo html_entity_decode( $description );?>
		<div class="social hidden"><?php echo html_entity_decode( $social );?></div>   
    </div>		
			<form id="formNewLestter" method="post" action="<?php echo $action; ?>">
			<div class="input-group newsletter-group">
				 <input type="text" class="newsletter-input form-control input-lg email" <?php if(!isset($customer_email)): ?> <?php endif; ?> size="18" name="email">
				<div class="input-group-btn">
					<button type="submit" name="submitNewsletter" class="btn btn-lg btn-success">
	                    <?php echo $objlang->get("button_subscribe");?>
	                </button>
                </div>
				
			</div>
			<div class="valid"></div>
		</form>
</div>
<?php } ?>
<script type="text/javascript"><!--

$( document ).ready(function() {

	$('#formNewLestter').on('submit', function() {
		var email = $('.email').val();
		$(".success_inline, .warning_inline, .error").remove();
		if(!isValidEmailAddress(email)) {				
			$('.valid').html("<div class=\"error alert alert-danger\"><?php echo $objlang->get('valid_email'); ?><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button></div></div>");
			$('.email').focus();
			return false;
		}
	
		var url = "<?php echo $action; ?>";
		$.ajax({
			type: "post",
			url: url,
			data: $("#formNewLestter").serialize(),
			dataType: 'json',
			success: function(json)
			{
				$(".success_inline, .warning_inline, .error").remove();
				if (json['error']) {
					$('.valid').html("<div class=\"warning_inline alert alert-danger\">"+json['error']+"<button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button></div>");
				}
				if (json['success']) {
					$('.valid').html("<div class=\"success_inline alert alert-success\">"+json['success']+"<button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button></div>");
				}
			}
		}); return false;
	
	}); //end submmit
}); //end document

function isValidEmailAddress(emailAddress) {
	var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
	return pattern.test(emailAddress);
}
--></script>