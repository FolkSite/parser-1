<?php echo $header; ?>

<div class="<?php echo $pageclass; ?>">
<div class="container">

<h1><?php echo $title; ?></h1>

<?php echo $description; ?>


<div class="row rowourfoto">

<?php foreach ($images as $image) { ?>

<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 nourfoto">
<a href="<?php echo $image['popup']; ?>"><img src="<?php echo $image['thumb']; ?>"></a>
</div>

<?php } ?>

</div>



</div>
</div>



<?php echo $footer; ?>