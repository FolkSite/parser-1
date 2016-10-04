<?php echo $header; ?>

<div class="<?php echo $bgclass; ?>" style="<?php echo $bgimg; ?>">
<div>
<h1><?php echo $title; ?></h1>
</div>
</div>


<div class="<?php echo $pageclass; ?>">
<div class="container">

<?php echo $description; ?>

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








<p class="reviewsall"><a role="button" data-toggle="modal" data-target="#modal_review" >оставить отзыв</a><a href="#" style="display:none;">больше отзывов</a></p>



</div>
</div>

<?php echo $footer; ?>