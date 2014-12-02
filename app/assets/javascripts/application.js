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
//= require_tree .

$(window).ready(function() {

  $("#hangry").hide();
  $("#loader").hide();

  navigator.geolocation.getCurrentPosition(
    function (position) {
      var longitude = position.coords.longitude;
      var latitude = position.coords.latitude;

      $("#longitude").val(longitude);
      $("#latitude").val(latitude);
      $("#hangry").show("fast");

    },
    function (error) {
      alert("No!" + error);
    }
  );

  $("#facebook-login").on("click", function(event){

    $loader = $("#loader")
    $(event.target).replaceWith($loader);
    $loader.show();
  })


});
