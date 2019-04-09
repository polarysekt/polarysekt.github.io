// dl-menu options
$(function() {
    $( '#dl-menu' ).dlmenu({
      animationClasses : { classin : 'dl-animate-in', classout : 'dl-animate-out' }
    });
  });
  
  $(".close-menu").click(function () {
    $(".menu").toggleClass("disabled");
    $(".links").toggleClass("enabled");
  });
