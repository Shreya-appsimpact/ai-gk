$(document).ready(function(){
  $("#category_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'category[name]' : "required"
    },
    messages: {
      'category[title]' : "Please enter name"
    }  
  });
});  
