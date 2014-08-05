
$(function() {
  $(".transport").hide();
  // toggle on button click
  $(".car_b").click(function(){ $(".car").slideToggle(); $(this).toggleClass('active'); });
  $(".bus_b").click(function(){ $(".bus").slideToggle(); $(this).toggleClass('active'); });
  $(".train_b").click(function(){ $(".train").slideToggle(); $(this).toggleClass('active'); });
  $(".plane_b").click(function(){ $(".plane").slideToggle(); $(this).toggleClass('active'); });
});
    