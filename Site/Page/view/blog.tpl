<?php echo $header; ?>

<div class="<?php echo $bgclass; ?>" style="<?php echo $bgimg; ?>">
<div>
<h1><?php echo $title; ?></h1>
</div>
</div>


<div class="<?php echo $pageclass; ?>">
<div class="container">

<?php echo $description; ?>

<?php foreach ($blogs as $blog) { ?>

<div class="pageblogrow">
<div class="pageblogrowimg">
<div class="pageblogrowimground">
<?php if($blog['image']) { ?>
<img src="<?php echo $blog['image']; ?>" />
<?php } ?>

</div>
<div class="pageblogrowimgdate"><?php echo $blog['date']; ?></div>
</div>
<div class="pageblogrowtext">
<div class="pageblogrowtexthead">
<a href="<?php echo $blog['url_blog']; ?>" class="pageblogtextheadname"><?php echo $blog['title']; ?></a>
</div>
<p><?php echo $blog['intro']; ?></p>
</div>
</div>

<?php } ?>





<!--<p class="specialall"><a href="#">Еще</a></p>-->


</div>
</div>

<?php echo $footer; ?>