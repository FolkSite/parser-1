<?php echo $header; ?>

<div class="<?php echo $bgclass; ?>" style="<?php echo $bgimg; ?>">
<div>
<h1><?php echo $title; ?></h1>
</div>
</div>


<div class="<?php echo $pageclass; ?>">
<div class="container">

<?php echo $description; ?>
<?php	
if($pricelist){
?>
<h3>Цены</h3>



<div class="table-responsive">
	<table class="table">
		<tbody>

		
		
<?php	

	foreach($pricelist as $price) {
?>	

	
<?php if($price['sort_order'] == 1) { ?>
<tr class="pricetblz">	
<?php } else { ?>
<tr >	
<?php } ?>

<td><?php echo $price['col1']; ?></td>
<td><?php echo $price['col2']; ?></td>


<?php if($columns > 2) { ?>
<td><?php echo $price['col3']; ?></td>
<?php } ?>

<?php if($columns > 3) { ?>
<td><?php echo $price['col4']; ?></td>
<?php } ?>		

<?php if($columns > 4) { ?>
<td><?php echo $price['col5']; ?></td>
<?php } ?>

<?php if($columns > 5) { ?>
<td><?php echo $price['col6']; ?></td>
<?php } ?>

<?php if($columns > 6) { ?>
<td><?php echo $price['col7']; ?></td>
<?php } ?>											

<?php if($columns > 7) { ?>
<td><?php echo $price['col8']; ?></td>
<?php } ?>

<?php if($columns > 8) { ?>
<td><?php echo $price['col9']; ?></td>
<?php } ?>	

</tr>




<?php	
	}
?>	





	



		</tbody>
	</table>	
</div>



<div class="tblmobtabl">
	
<?php	
$kk = 0;
	foreach($pricelist as $price) {
$kk++;	

if($kk > 1)	{
?>	

<div class="row">


<?php if($columns > 0) { 

?>
<div class="col-xs-12">
<b><?php echo $pricelist[0]['col1']; ?>:</b>
<p><?php echo $price['col1']; ?></p>
</div>
<?php

} 
?>

<?php if($columns > 1) { ?>
<div class="col-xs-12">
<b><?php echo $pricelist[0]['col2']; ?>:</b>
<p><?php echo $price['col2']; ?></p>
</div>
<?php } ?>

<?php if($columns > 2) { ?>
<div class="col-xs-12">
<b><?php echo $pricelist[0]['col3']; ?>:</b>
<p><?php echo $price['col3']; ?></p>
</div>
<?php } ?>

<?php if($columns > 3) { ?>
<div class="col-xs-12">
<b><?php echo $pricelist[0]['col4']; ?>:</b>
<p><?php echo $price['col4']; ?></p>
</div>
<?php } ?>

<?php if($columns > 4) { ?>
<div class="col-xs-12">
<b><?php echo $pricelist[0]['col5']; ?>:</b>
<p><?php echo $price['col5']; ?></p>
</div>
<?php } ?>

<?php if($columns > 5) { ?>
<div class="col-xs-12">
<b><?php echo $pricelist[0]['col6']; ?>:</b>
<p><?php echo $price['col6']; ?></p>
</div>
<?php } ?>

<?php if($columns > 6) { ?>
<div class="col-xs-12">
<b><?php echo $pricelist[0]['col7']; ?>:</b>
<p><?php echo $price['col7']; ?></p>
</div>
<?php } ?>

<?php if($columns > 7) { ?>
<div class="col-xs-12">
<b><?php echo $pricelist[0]['col8']; ?>:</b>
<p><?php echo $price['col8']; ?></p>
</div>
<?php } ?>

<?php if($columns > 8) { ?>
<div class="col-xs-12">
<b><?php echo $pricelist[0]['col9']; ?>:</b>
<p><?php echo $price['col9']; ?></p>
</div>
<?php } ?>






</div>
<?php	
	}
	}
?>	

</div>


<?php	
	}
?>

	



<p class="servicezapis"><a role="button" data-toggle="modal" data-target="#modal_zapis" data-whatever="Запись - <?php echo $title; ?>">Записаться</a></p>



</div>
</div>

<?php echo $footer; ?>