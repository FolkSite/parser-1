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


<?php foreach ($specials as $special) { ?>

<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
<div class="specialoverlayimg" style="background-image:url('<?php echo $special['image']; ?>');">
<div class="specialoverlay">
<div>
<a href="<?php echo $special['url_special']; ?>"> <?php echo $special['title']; ?></a>
</div>
</div>
<div class="specialoverdate"><?php echo $special['date']; ?></div>
</div>
</div>

<?php } ?>



</div>

<!--<p class="specialall"><a href="#">Еще</a></p>-->




</div>
</div>

<?php echo $footer; ?>