// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
	
// EVENT/SHOW page
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
    	$("#email_input_response").html('<input class="button" name="commit" type="submit" value="Enter information >>">');
	}

}

$(document).ready(function() {
	$(".next").hide();
	$("#user_name").keyup(verifyEmail);
	$("#user_email").keyup(verifyEmail);
});