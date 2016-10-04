<?php echo $header; ?>


<div id="mainslideshow" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
<?php 
$k = 0;
foreach($slides as $slide) { 

?>	
    <li data-target="#mainslideshow" data-slide-to="<?php echo $k; ?>" class="<?php if($k == 0) { ?>active<?php } ?>"></li>
<?php
$k++;
 }	?>			
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
	
	


<?php 
$i = 0;
foreach($slides as $slide) { 
$i++;
?>
		
    <div class="item <?php if($i == 1) { ?>active<?php } ?>">
		<a href="<?php echo $slide['link']; ?>">
		<div class="slidebackground" style="background-image:url('<?php echo $slide['image']; ?>');"></div> 
      <div class="carousel-caption" >
        <p><b><?php echo $slide['text']; ?></b> </p>
				<p class="paddingleftline"><b></b> </p>
      </div>
		</a>	
    </div>	
	
<?php }	?>		

		
		
		

  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#mainslideshow" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#mainslideshow" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


<?php if($about_info){ ?>
	
<div class="hometext">
<div class="container">
<h2><?php echo $about_info['title']; ?></h2>

<?php echo $about_info['description']; ?>

</div>
</div>	
	
<?php } ?>




<div class="homesubscr">
<div class="homesubscrl">
<div id="btnsubsform">
<p>ПОДПИШИТЕСЬ НА НАШУ РАССЫЛКУ</p>
<p class="homesubscrline2">И ПОЛУЧАЙТЕ СПЕЦИАЛЬНЫЕ БОНУСНЫЕ АКЦИИ</p>
<div class="row">
<div class="col-lg-9 col-sm-8 col-xs-9">
<input class="homesubscrinput" id="homesubscrinput" name="homesubscrmail" placeholder="Ваш email" required="required" aria-required="true">
</div>
<div class="col-lg-3 col-sm-4 col-xs-3">
<button type="button" class="homesubscrbtn" id="btnsubmitsubs">OK</button>
</div>
</div>

</div>

</div>
<div class="homesubscrr">
<div></div>
</div>
</div>



<?php 

if(isset($topusls)) {
	

?>

<div class="homeuslugi">
<div class="container">
<h2>Услуги</h2>
<p class="uslugitopp">Топовые популярные услуги: </p>

<div class="uslugilinks row">

<?php 

foreach($topusls as $topusl) { 

?>
		
<a href="<?php echo $topusl['link']; ?>">
<img src="<?php echo $topusl['image']; ?>"/>
<span><?php echo $topusl['text']; ?></span></a>
	
<?php }	?>

</div>
<p class="uslugiall"><a href="/service/">Все услуги</a></p>
</div>
</div>

<?php }	?>



<div class="partners" >
<div class="container">
<h2>Наши партнеры</h2>
<div class="partnerslogo">

<?php echo $home_info['description']; ?>



</div>
</div>
</div>





<?php if($reviews) { ?>
<div class="homereviews">
<div class="container">
<h2>Отзывы</h2>
<?php foreach ($reviews as $review) { ?>
	
<div class="homereviewrow">
<div class="homereviewrowimg">
<span><?php echo $review['fname']; ?></span>
</div>
<div class="homereviewrowtext">
<div class="homereviewrowtexthead">
<div class="homereviewrowtextheadrating"><div class="ratingbg"><div class="ratingbgyes" style="width:<?php echo $review['ratingw']; ?>%;"></div></div></div>
<div class="homereviewrowtextheadname"><?php echo $review['name']; ?></div>
</div>
<p><?php echo $review['text']; ?></p>
</div>
</div>	
	
<?php } ?>
<p class="reviewsall"><a href="/reviews/">Еще</a></p>
</div>
</div>
<?php } ?>








<?php if($contact_info){ ?>



<div class="homecontacts" id="homecontacts">
<div class="container">
<h2><?php echo $contact_info['title']; ?></h2>
<?php echo $contact_info['description']; ?>


</div>
</div>
<?php } ?>
 

<?php echo $footer; ?>