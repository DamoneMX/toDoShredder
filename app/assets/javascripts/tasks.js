//Write this as coffescript
$(document).ready(function() {
  $.each( $(".tooltips"), function( key, value ) {
    $(value).tooltip();
  });
});


