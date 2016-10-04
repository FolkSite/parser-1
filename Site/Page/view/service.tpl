<?php echo $header; ?>

<div class="<?php echo $bgclass; ?>" style="<?php echo $bgimg; ?>">
<div>
<h1><?php echo $title; ?></h1>
</div>
</div>


<div class="<?php echo $pageclass; ?>">
<div class="container">

<?php echo $description; ?>

<div class="row">



<?php function isMobile() {
    return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|tablet|up\.browser|up\.link|webos|wos)/i", $_SERVER["HTTP_USER_AGENT"]);
}
// If the user is on a mobile device, redirect them
if(isMobile()){
  $mobilee = TRUE; 
} else {
	$mobilee = FALSE; 
}
?>



<div class="col-lg-10 col-sm-8 col-xs-12">




<div class="servicemain">



<div class="panel-group" id="accordionprice" role="tablist" aria-multiselectable="true">

<?php 
if(isset($services)){
	$i = 0;
	foreach($services as $service) {
	$i++;

?>


  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingtbl<?php echo $i; ?>">
      <h4 class="panel-title">
        <a class="<?php if($i == 1) {?><?php } else { ?>collapsed<?php } ?>" role="button" data-toggle="collapse" data-parent="#accordionprice" href="#collapsetbl<?php echo $i; ?>" aria-expanded="<?php if($i == 1) {?>true<?php } else { ?>false<?php } ?>" aria-controls="collapsetbl<?php echo $i; ?>">
          <?php echo $service['name']; ?>
        </a>
      </h4>
    </div>
    <div id="collapsetbl<?php echo $i; ?>" class="panel-collapse collapse <?php if($i == 1) {?>in<?php } else { ?><?php } ?>" role="tabpanel" aria-labelledby="headingtbl<?php echo $i; ?>">
      <div class="panel-body">
			


	<div class="row">
			<?php if(isset($service['uslugi'])) { ?>
				<?php foreach($service['uslugi'] as $uslugi) { ?>

<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
	<a href="<?php echo $uslugi['url']; ?>">
		<div class="servicemainblockb">
			<div class="servicemainblockbl">
				<img src="<?php echo $uslugi['image']; ?>">
			</div>
			<div class="servicemainblockbr">
				<h4><?php echo $uslugi['name']; ?></h4>
				<p><?php echo $uslugi['intro']; ?></p>
			</div>
		</div>
	</a>
</div>

				<?php	
					}	
				}
				?>				
	</div>				


			</div>
		</div>
	</div>
	
	
	
	
	
<?php } ?>	
<?php } ?>	
</div>


</div>






</div>


<div class="col-lg-2 col-sm-4 col-xs-12">
<?php if($mobilee) { ?>
<a style="margin-top:30px;text-align:center;" class="btn btn-link btnrmenuu" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
  Список всех услуг (от А до Я)
</a>
<div class="collapse" id="collapseExample">
<?php } ?>

<div class="servicenav">
<?php foreach($uslugi_menu as $uslugi_menu) { ?>
	<a href="<?php echo $uslugi_menu['url']; ?>"><?php echo $uslugi_menu['name']; ?></a>
<?php } ?>
</div>

<?php if($mobilee) { ?>
</div>
<?php } ?>
</div>




</div>

















</div>
</div>

<?php echo $footer; ?>