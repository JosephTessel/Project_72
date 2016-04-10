
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//

// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .


$( "#review-title").on('click touch', function(){update_reviews(this);});
$(function(){ $(document).foundation(); });



function update_reviews(data){
  //alert("hi");
  //console.log("reached update function");
  $.ajax({
    type: "POST",
    url: "../messages/get_data",
    data: {
        message_id: "hello"
          },
    dataType: "json",
    success: function(data){console.log(data);},
    error: function(data){console.log(data);}
  });
}
//
// app.service('modal', [function() {
//     var modal = this;
//     modal.settings = {};
//     // Create the DOM elements for the modal
//     // The overlay fades out background content
//     modal.overlay = $('<div id="overlay"></div>');
//     // Create the #modal container, which houses the #content container and the #close button
//     modal.modal = $('<div id="modal"></div>');
//     modal.content = $('<div id="content"></div>');
//     modal.closeBtn = $('<div id="close"><i class="fa fa-times"></div>');
// credit where credit's due; http://thecodeplayer.com/walkthrough/ripple-click-effect-google-material-design

var element, circle, d, x, y;
$("button ").click(function(e){

	element = $(this);

	if(element.find(".circle").length == 0)
		element.prepend("<span class='circle'></span>");

	circle = element.find(".circle");
	circle.removeClass("animate");

	if(!circle.height() && !circle.width())
  {
		d = Math.max(element.outerWidth(), element.outerHeight());
		circle.css({height: d, width: d});
	}

	x = e.pageX - element.offset().left - circle.width()/2;
	y = e.pageY - element.offset().top - circle.height()/2;

	circle.css({top: y+'px', left: x+'px'}).addClass("animate");
})


$(function(){
 var shrinkHeader = 300;
  $(window).scroll(function() {
    var scroll = getCurrentScroll();
      if ( scroll >= shrinktopbar ) {
           $('.topbar').addClass('shrink');
        }
        else {
            $('.topbar').removeClass('shrink');
        }
  });
function getCurrentScroll() {
    return window.pageYOffset || document.documentElement.scrollTop;
    }
});
