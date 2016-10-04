

 
<div class="footer">
<div class="container">
<div class="row">
<div class="col-lg-6 col-md-8 col-sm-8 col-xs-12">
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
<img src="<?php echo $media_url; ?>images/logof.png">
</div>
<div class="col-lg-3 col-md-3 col-sm-4  col-xs-6 footermenu">
<a href="/">Главная</a>
<a href="/about/">О нас</a>
<a href="/service/">Услуги</a>
<a href="/special/">Акции</a>
<a href="/price/" >Цены</a>
<a href="/reviews/">Отзывы</a>
</div>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 footermenu">
<a href="/contacts/">Контакты</a>
<a href="/blog/">Блог</a>
<a href="/work/">Работа у нас</a>
</div>
</div>
</div>
<div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 footer-right">
<p><a href="tel:+74991259555">+7(499) 125-95-55</a></p>
<p><a href="tel:+74957793565">+7(495) 779-35-65</a></p>
<p class="footer-mail"><a href="mailto:info@dreams-factory.ru">info@dreams-factory.ru</a></p>
<p class="footer-social">
<a href="https://www.instagram.com/fabrika_grez/" target="_blank"><span class="social-in"></span></a>
<a href="https://www.facebook.com/FabrikaGryoz/" target="_blank"><span class="social-fb"></span></a>
<!-- <a href="#" target="_blank"><span class="social-vk"></span></a> -->
</p> 
</div>
</div>
<p class="footer-copyright">© 2016 dreams-factory.ru Все права защищены. Design by <a href="#">STREL</a></p>
</div> 
</div> 





<!-- Modal -->
<div class="modal fade" id="modal_review" tabindex="-1" role="dialog" aria-labelledby="modal_reviewLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        
      </div>
      <div class="modal-body">

<form id="rcontact-form" action="" method="POST" name="rcontact-form">


<input id="name" class="form-control" type="text" placeholder="Имя" required="required" aria-required="true" name="recipientname" />
<input id="email" class="form-control" type="email" placeholder="Ваш email" required="required" aria-required="true" name="recipientemail" />
<input id="tel" class="form-control" type="text" placeholder="Ваш телефон" required="required" aria-required="true" name="telefon" />
<textarea name="postreview" class="form-control" placeholder="Ваш отзыв" required="required" aria-required="true" name="messagetext" rows="3"></textarea>

<div class="onlinezapis">
<input id="submit" class="btn" type="submit" name="submit" value="Отправить"  />
</div>

</form>	


<div id="rtopblock" style="text-align:center;font-size:16px;"></div>				
	
      </div>

    </div>
  </div>
</div> 



<!-- Modal -->
<div class="modal fade" id="modal_zapis" tabindex="-1" role="dialog" aria-labelledby="modal_zapisLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">

<form id="contact-form" action="" method="POST" name="contact-form">
<input type="hidden" id="selectuslugi" name="selectuslugi" value="" />
<div class="select-box-style">
<span class="select-box-style-selector"></span>
<select name="selectsalon" class="form-control ">
<option value="Салон на Академической">Салон на Академической</option>
<option value="Салон в Беляево">Салон в Беляево</option>
</select>
</div>
<input id="name" class="form-control" type="text" placeholder="Имя и фамилия" required="required" aria-required="true" name="recipientname" />
<input id="email" class="form-control" type="email" placeholder="Ваш email" required="required" aria-required="true" name="recipientemail" />
<input id="tel" class="form-control" type="text" placeholder="Ваш телефон" required="required" aria-required="true" name="telefon" />

<div class="onlinezapis">
<input id="submit" class="btn" type="submit" name="submit" value="Отправить"  />
</div>

</form>	


<div id="topblock" style="text-align:center;font-size:16px;"></div>				
	
      </div>

    </div>
  </div>
</div> 









<script src="<?php echo $static_url; ?>lib/jquery/jquery-2.2.1.min.js"></script>
<script src="<?php echo $static_url; ?>lib/bootstrap/3.3.6/js/bootstrap.js"></script>
<script src="<?php echo $static_url; ?>lib/magnific/jquery.magnific-popup.min.js"></script>

<script type="text/javascript">
$(document).delegate('#btnsubmitsubs', 'click', function() {
    $.ajax({
      url: "/fromsub.php",
      type: "POST",
      data: $('#homesubscrinput'),
      success: function(response) {
        //обработка успешной отправки
		
		$('#btnsubsform').html('<div class="subscfinish">СПАСИБО ЗА ВАШУ ПОДПИСКУ!</div>');
		$('#homesubscrinput').val('');
		
      },
      error: function(response) {
        //обработка ошибок при отправке
		$('#btnsubsform').after("<span>Ошибка отправки</span>");
     }
    });
});
</script> 

<script>
$('#modal_zapis').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) 
  var recipient = button.data('whatever') 

  var modal = $(this)
  modal.find('.modal-title').text(recipient)
  modal.find('.modal-body #selectuslugi').val(recipient)
})
</script>  
 <script type="text/javascript">
$('#contact-form').submit(function(e){
    e.preventDefault();
    $.ajax({
      url: "/froms.php",
      type: "POST",
      data: $('#contact-form').serialize(),
      success: function(response) {
        //обработка успешной отправки
		$('#contact-form').hide("500");
		$('#topblock').html("<span>Спасибо! Менеджер свяжется с Вами в ближайшее время по указанному телефону</span>");
		
      },
      error: function(response) {
        //обработка ошибок при отправке
		$('#topblock').html("<span>Ошибка отправки</span>");
     }
    });
});
</script>

<script type="text/javascript">
$(document).ready(function() {
	$('.rowourfoto').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>

 <script type="text/javascript">
$('#rcontact-form').submit(function(e){
    e.preventDefault();
    $.ajax({
      url: "/fromsr.php",
      type: "POST",
      data: $('#rcontact-form').serialize(),
      success: function(response) {
        //обработка успешной отправки
		$('#rcontact-form').hide("500");
		$('#rtopblock').html("<span>Спасибо за отзыв!</span>");
		
      },
      error: function(response) {
        //обработка ошибок при отправке
		$('#rtopblock').html("<span>Ошибка отправки</span>");
     }
    });
});
</script> 


<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>

<script type="text/javascript">

ymaps.ready(function () {
    var myMap = new ymaps.Map('map', {
            center: [55.683540, 37.579991],
            zoom: 15
        }, {
            searchControlProvider: 'yandex#search'
        }),
        myPlacemark = new ymaps.Placemark(myMap.getCenter(), {
            hintContent: 'Фабрика Грез',
            balloonContent: 'м.Академическая Ул. Новочеремушкинская, д. 16.'
        }, {
            // Опции.
            // Необходимо указать данный тип макета.
            iconLayout: 'default#image',
            // Своё изображение иконки метки.
            iconImageHref: '<?php echo $static_url; ?>theme/site/img/yamapicon.png',
            // Размеры метки.
            iconImageSize: [47, 63],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-20, -60]
        });

    myMap.geoObjects.add(myPlacemark);
	
    var myMap2 = new ymaps.Map('map2', {
            center: [55.638756, 37.538257],
            zoom: 15
        }, {
            searchControlProvider: 'yandex#search'
        }),
        myPlacemark = new ymaps.Placemark(myMap2.getCenter(), {
            hintContent: 'Фабрика Грез',
            balloonContent: 'м.Беляево Ул. Миклухо-Маклая, 40 корп. 1.'
        }, {
            // Опции.
            // Необходимо указать данный тип макета.
            iconLayout: 'default#image',
            // Своё изображение иконки метки.
            iconImageHref: '<?php echo $static_url; ?>theme/site/img/yamapicon.png',
            // Размеры метки.
            iconImageSize: [47, 63],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-20, -60]
        });

    myMap2.geoObjects.add(myPlacemark);	
	
});



</script>

</body>
</html>