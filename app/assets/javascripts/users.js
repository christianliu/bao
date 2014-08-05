function verifyEmail(){
  var user_name = $("#user_name").val();
  var user_email = $("#user_email").val();
  
  // variables to check email validity 
  var atpos = user_email.indexOf("@");
    var dotpos = user_email.lastIndexOf(".");

  // Verify name field isn't blank
  if(user_name == null || user_name == "") {
    $("#email_input_response").html('Please tell us your name.');
  // Verify email valid
  } else if(atpos< 1 || dotpos<atpos+2 || dotpos+2>=user_email.length) {
        $("#email_input_response").html('Please enter your valid email address.');
    // Old User
    } else {
      $("#email_input_response").html('<input class="button" name="commit" type="submit" value="Get Started >>">');
  }
}

$(document).ready(function() {
  $(".next").hide();
  $("#user_name").bind("keyup paste click", verifyEmail);
  $("#user_email").bind("keyup paste click", verifyEmail);
});