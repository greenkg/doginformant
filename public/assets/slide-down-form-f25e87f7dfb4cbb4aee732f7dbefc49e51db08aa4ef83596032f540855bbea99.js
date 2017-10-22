$(document).on('turbolinks:load', function(){

  $("#form-slider").click(function(e){
    e.preventDefault();
    $("#breed-selector").slideToggle();
  });

});

