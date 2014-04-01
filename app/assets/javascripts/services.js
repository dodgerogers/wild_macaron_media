$(function(){
	$("#services").on("click", "a", function(){
		var slide = $(this).data("slide");
		$("#wmm-carousel").carousel(slide);
		if ($("#services-dropdown").is(":hidden")) {
			$("#services-dropdown").fadeIn();
			$("body, html").animate({
				scrollTop: $("#wmm-carousel").offset().top - ( $(window).height() / 4 )
			}, 500);
		}
	});
});