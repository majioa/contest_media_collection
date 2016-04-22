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
//= require twitter/bootstrap
//= require_tree .
//
//= require blueimp-gallery
//= require blueimp-gallery-fullscreen
//= require blueimp-gallery-indicator
//= require blueimp-gallery-video
//= require blueimp-gallery-youtube
//= require jquery.blueimp-gallery
//= require bootstrap-image-gallery
//


$(document).ready(function() {
   function asyncEvent() {
      var dfd = jQuery.Deferred();

      // Resolve after a random interval
      setTimeout(function() {
         dfd.resolve( "update" );
      }, Math.floor( 1000 ));

      return dfd.promise();
   }

   $('#links a.item').popover({html: true});

   $('#links a.item').mouseenter( function() {
      tmpl = $('.template');
      in_link = $(this).attr('data-in');
      out_link = $(this).attr('data-out');
      tmpl.children('form').attr('action', in_link);
      tmpl.children('a').attr('href', out_link);
      $(this).attr('data-content', tmpl.html());
      $(this).popover('show');
   });

   queue = [];

   $('#links a.item').mouseleave( function() {
      queue.push($(this));
      $.when( asyncEvent() ).then( function( status ) {
         alink = queue.shift();
         alink.popover('hide');
      });
   });
});
