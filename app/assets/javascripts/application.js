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


    // } else if ( <%= User.find_by(email: user_email).to_json %> != nil) {
    // 	<%= User.find_by(email: user_email).update_attributes()to_json %> = user_name;
    // 	reponse = "Welcome back, " + user_name + "!";
    // 	showLink();
    // // New User
    // } else {
    // 	User.create(email: user_email, name: user_name);
    // 	response = "Hello, " + user_name + "!";
    // 	showLink();
    // }
	

function verifyEmail(){
	var user_name = $("#user_name").val();
	var user_email = $("#user_email").val();
	var response = "";
	
	// variables to check email validity 
	var atpos = user_email.indexOf("@");
    var dotpos = user_email.lastIndexOf(".");

	// Verify name field isn't blank
	if(user_name == null || user_name == "") {
		response = "Please tell us your name.";
	// Verify email valid
	} else if(atpos< 1 || dotpos<atpos+2 || dotpos+2>=user_email.length) {
        response = "Please enter your valid email address.";
    // Old User
    } else {
		response = "Go!";
	}

	$("#user_response").text(response);
}

// EVENT/SHOW page
$(document).ready(function() {
	$("#user_name").keyup(verifyEmail);
	$("#user_email").keyup(verifyEmail);
});


// TRIP/NEW page
$(document).ready(function() {
	// hide form fields
	$(".transport").hide();
	
	// toggle on button click
	$(".car_b").click(function(){
		$(".car").slideToggle();
	});
	$(".bus_b").click(function(){
		$(".bus").slideToggle();
	});
	$(".train_b").click(function(){
		$(".train").slideToggle();
	});
	$(".plane_b").click(function(){
		$(".plane").slideToggle();
	});
});