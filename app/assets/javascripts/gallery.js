$(function(){
	var carousel = $("#wmm-carousel");
	carousel.on('slide.bs.carousel', function () {

		// Contains all kinds of data and methods related to the carousel
		var carouselData = $(this).data('bs.carousel');
		var currentIndex = carouselData.getActiveIndex();
		var total = carouselData.$items.length;
		var div = $("#service-features");
	
		// Highlight the current slide link if the carousel is visible
		if (carousel.is(":visible")) {
			div.find("a").removeClass("active");
			div.find($("a[data-slide=" + currentIndex + "]")).addClass("active");
		}	
	});
});