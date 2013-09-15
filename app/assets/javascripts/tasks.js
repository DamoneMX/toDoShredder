//Write this as coffescript
$(document).ready(function() {
  $.each( $(".tooltips"), function( key, value ) {
    $(value).tooltip();
  });
  
  $('.delete-post')
  .bind('ajax:success', function(evt, data, status, xhr){
  	console.log(eval(data));
  });
});


function showModal(){
	$("#shredder").click();
	$('#myModal').modal();
}

