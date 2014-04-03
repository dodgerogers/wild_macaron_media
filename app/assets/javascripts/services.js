$(function(){
	var serviceDiv = $("#service-features");
	var dropDown = $("#services-dropdown");
	var mainCarousel = $("#wmm-carousel");
	
	serviceDiv.on("click", "a", function(){
		var slide = $(this).data("slide");
		
		// Go to the selected slide and toggle the active class
		mainCarousel.carousel(slide);
		serviceDiv.find("a").removeClass("active");
		$(this).toggleClass("active");
		
		// If the gallery is hidden, we will fadeIn and scroll so it's in the middle of that page
		if (dropDown.is(":hidden")) {
			$("#hide-gallery").fadeIn();
			dropDown.fadeIn();
			$("body, html").animate({
				scrollTop: $("#wmm-carousel").offset().top - ( $(window).height() / 4 )
			}, 500);
		}
	});
	
	// On click we'll hide the gallery
	// Remove all active classes from the slide buttons
	// Hide #hide-gallery button
	$("#hide-gallery").click(function(event){
		event.preventDefault();
		dropDown.fadeToggle(function(){
			serviceDiv.find("a").removeClass("active");
		});
		$(this).fadeToggle();
		
	});
});