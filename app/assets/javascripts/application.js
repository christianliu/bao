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

function verifyEmail() {
	var user_name = document.getElementById("user_name");
	var user_email = document.getElementById("user_email");
	var response = "";
	
	var atpos = user_email.indexOf("@");
    var dotpos = user_email.lastIndexOf(".");
	
	// Verify name field isn't blank
	if (user_name == nil || user_name == "") {
		response = "Please tell us your name.";
	// Verify email valid
	} else {
		response = "Go!";
	}

	// if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=user_email.length) {
 //        response = "Please check your email address.";
 //    // Old User
 //    } else if ( <%= User.find_by(email: user_email).to_json %> != nil) {
 //    	<%= User.find_by(email: user_email).update_attributes()to_json %> = user_name;
 //    	reponse = "Welcome back, " + user_name + "!";
 //    	showLink();
 //    // New User
 //    } else {
 //    	User.create(email: user_email, name: user_name);
 //    	response = "Hello, " + user_name + "!";
 //    	showLink();
 //    }
	
	user_response.innerHTML = response;
}