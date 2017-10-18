//= require_self
//= require_tree .

document.addEventListener("turbolinks:load", function(){

  $("#selector-button").click(function(){
    $("#breed-selector").slideDown();
  });

})
