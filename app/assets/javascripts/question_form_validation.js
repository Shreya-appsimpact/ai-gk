$(document).ready(function(){
  $("#question_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'question[title]' : "required",
      'question[answer]' : "required"
    },
    messages: {
      'question[title]' : "Please enter title",
      'question[answer]' : "Please enter answer"
    }  
  });
});  
