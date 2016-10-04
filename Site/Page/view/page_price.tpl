<?php echo $header; ?>

<div class="<?php echo $bgclass; ?>" style="<?php echo $bgimg; ?>">
<div>
<h1><?php echo $title; ?></h1>
</div>
</div>


<div class="<?php echo $pageclass; ?>">
<div class="container">

<?php echo $description; ?>



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


<?php if(isset($service['uslugi'])) { ?>




<div class="table-responsive">
	
		<tbody>
<?php foreach($service['uslugi'] as $uslugi) { ?>
<table class="table">
			<?php if($uslugi['pricelist']) { ?>
			<tr class="pricetblbg">
				<td colspan="<?php echo $uslugi['columns']; ?>"><?php echo $uslugi['name']; ?></td>
			</tr>	
			<?php	 foreach($uslugi['pricelist'] as $price) { ?>	
			<?php if($price['sort_order'] == 1) { ?>
			<tr class="pricetblz">	
			<?php } else { ?>
			<tr >	
			<?php } ?>
			<?

				if(preg_grep("/^".$price['price']."$/", array(1,3,4))){

					$w_col1 = 'width="85%"';
					$w_col2 = 'width="5%"';
					$w_col3 = 'width="5%"';
					$w_col4 = 'width="5%"';
					$w_col5 = 'width="35%"';
				}elseif(preg_grep("/^".$price['price']."$/", array(5,6,24,25,26,17,18,41,9,22,28,33,42))){
					// |--------------------------|---|---|
					$w_col1 = 'width="71.5%"';
					$w_col2 = 'width="14.5%"';
					$w_col3 = 'width="14%"';
					$w_col4 = 'width="5%"';
					$w_col5 = 'width="35%"';
				}elseif(preg_grep("/^".$price['price']."$/", array(14,16,13,15,35))){
					// |----------|--|--|-----------------|
					$w_col1 = 'width="30%"';
					$w_col2 = 'width="10%"';
					$w_col3 = 'width="10%"';
					$w_col4 = 'width="50%"';
					$w_col5 = 'width="35%"';
				}elseif(preg_grep("/^".$price['price']."$/", array(12,11,36,38,10,30,32,43,7,40,44,45,46,20,19))){
					// |-----|--|--|---------|------------|
					$w_col1 = 'width="15%"';
					$w_col2 = 'width="10%"';
					$w_col3 = 'width="30%"';
					$w_col4 = 'width="35%"';
					$w_col5 = 'width="35%"';
				}elseif(preg_grep("/^".$price['price']."$/", array(21))){
					// |---|--|--|--|--|--|-------|-------|
					$w_col1 = 'width="15%"';
					$w_col2 = 'width="5%"';
					$w_col3 = 'width="5%"';
					$w_col4 = 'width="5%"';
					$w_col5 = 'width="5%"';
					$w_col6 = 'width="5%"';
					$w_col7 = 'width="20%"';
					$w_col8 = 'width="20%"';
				}

			?>

				<td <?php echo $w_col1; ?>><?php echo $price['col1']; ?></td>
				<td <?php echo $w_col2; ?>><?php echo $price['col2']; ?></td>
				<?php if($uslugi['columns'] > 2) { ?>
				<td <?php echo $w_col2; ?>><?php echo $price['col3']; ?></td>
				<?php } ?>
				<?php if($uslugi['columns'] > 3) { ?>
				<td <?php echo $w_col4; ?>><?php echo $price['col4']; ?></td>
				<?php } ?>		
				<?php if($uslugi['columns'] > 4) { ?>
				<td <?php echo $w_col5; ?>><?php echo $price['col5']; ?></td>
				<?php } ?>
				<?php if($uslugi['columns'] > 5) { ?>
				<td><?php echo $price['col6']; ?></td>
				<?php } ?>
				<?php if($uslugi['columns'] > 6) { ?>
				<td><?php echo $price['col7']; ?></td>
				<?php } ?>											
				<?php if($uslugi['columns'] > 7) { ?>
				<td><?php echo $price['col8']; ?></td>
				<?php } ?>
				<?php if($uslugi['columns'] > 8) { ?>
				<td><?php echo $price['col9']; ?></td>
				<?php } ?>	
			</tr>
			<?php	} ?>
			<?php	} ?>					
</table>
<?php	} ?>
		</tbody>
							
</div>



<?php foreach($service['uslugi'] as $uslugi) { ?>
<?php if($uslugi['pricelist']) { ?>					
<div class="tblmobtabl">
	<?php foreach($uslugi['pricelist'] as $price) { ?>	
	<div class="row">
		<?php if($uslugi['columns'] > 0) { ?>
		<div class="col-xs-12">
		<b><?php echo $uslugi['pricelist'][0]['col1']; ?>:</b>
		<p><?php echo $price['col1']; ?></p>
		</div>
		<?php } ?>
		<?php if($uslugi['columns'] > 1) { ?>
		<div class="col-xs-12">
		<b><?php echo $uslugi['pricelist'][0]['col2']; ?>:</b>
		<p><?php echo $price['col2']; ?></p>
		</div>
		<?php } ?>
		<?php if($uslugi['columns'] > 2) { ?>
		<div class="col-xs-12">
		<b><?php echo $uslugi['pricelist'][0]['col3']; ?>:</b>
		<p><?php echo $price['col3']; ?></p>
		</div>
		<?php } ?>
		<?php if($uslugi['columns'] > 3) { ?>
		<div class="col-xs-12">
		<b><?php echo $uslugi['pricelist'][0]['col4']; ?>:</b>
		<p><?php echo $price['col4']; ?></p>
		</div>
		<?php } ?>
		<?php if($uslugi['columns'] > 4) { ?>
		<div class="col-xs-12">
		<b><?php echo $uslugi['pricelist'][0]['col5']; ?>:</b>
		<p><?php echo $price['col5']; ?></p>
		</div>
		<?php } ?>
		<?php if($uslugi['columns'] > 5) { ?>
		<div class="col-xs-12">
		<b><?php echo $uslugi['pricelist'][0]['col6']; ?>:</b>
		<p><?php echo $price['col6']; ?></p>
		</div>
		<?php } ?>
		<?php if($uslugi['columns'] > 6) { ?>
		<div class="col-xs-12">
		<b><?php echo $uslugi['pricelist'][0]['col7']; ?>:</b>
		<p><?php echo $price['col7']; ?></p>
		</div>
		<?php } ?>
		<?php if($uslugi['columns'] > 7) { ?>
		<div class="col-xs-12">
		<b><?php echo $uslugi['pricelist'][0]['col8']; ?>:</b>
		<p><?php echo $price['col8']; ?></p>
		</div>
		<?php } ?>
		<?php if($uslugi['columns'] > 8) { ?>
		<div class="col-xs-12">
			<b><?php echo $uslugi['pricelist'][0]['col9']; ?>:</b>
			<p><?php echo $price['col9']; ?></p>
		</div>
		<?php } ?>
	</div>
	<?php } ?>	
</div>
<?php	} ?>				





<?php } ?>
<?php } ?>

</div>
</div>
</div>	





<?php } ?>
<?php } ?>


	
	
		







</div>













































</div>
</div>

<?php echo $footer; ?>