<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<style type="text/css">


	</style>
<div id="scroll-top-end" style="position: fixed; bottom: 80px; right: 80px;">
	<div class=""><a class="btn btn-default" href="#scroll-top"><span class="glyphicon glyphicon-triangle-top"></span></a></div>
	<div><a class="btn btn-default" href="#scroll-end"><span class="glyphicon glyphicon-triangle-bottom"></span></a></div>
</div>
<script>
		$(document).ready(function(){
			  // Add smooth scrolling to all links
			  $("a").on('click', function(event) {

			    // Make sure this.hash has a value before overriding default behavior
			    if (this.hash !== "") {
			      // Prevent default anchor click behavior
			      event.preventDefault();

			      // Store hash
			      var hash = this.hash;

			      // Using jQuery's animate() method to add smooth page scroll
			      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
			      $('html, body').animate({
			        scrollTop: $(hash).offset().top
			      }, 100, function(){
			   
			        // Add hash (#) to URL when done scrolling (default click behavior)
			        window.location.hash = hash;
			      });
			    } // End if
			  });
			}); 
</script>	