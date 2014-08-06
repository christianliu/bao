
$(function() {
  $(".transport").hide();
  // toggle on button click
  $(".car_b").click(function(){ $(".car").slideToggle(); $(this).toggleClass('active'); });
  $(".bus_b").click(function(){ $(".bus").slideToggle(); $(this).toggleClass('active'); });
  $(".train_b").click(function(){ $(".train").slideToggle(); $(this).toggleClass('active'); });
  $(".plane_b").click(function(){ $(".plane").slideToggle(); $(this).toggleClass('active'); });
});
    
function oneCarParamPresent() {
  return $('#car_km').val() != "" || $('#car_people').val() != "" || $('#car_id').val() != "";
}

function oneCarParamAbsent() {
  return $('#car_km').val() == "" || $('#car_people').val() == "" || $('#car_id').val() == "";
}

$( document ).ready(function() {
  $('#trip-form').submit(function(e) {
    if (oneCarParamPresent() && oneCarParamAbsent()) {
      alert("Please fill out all the car attributes.");
      e.preventDefault(); 
    }
    
  });
});