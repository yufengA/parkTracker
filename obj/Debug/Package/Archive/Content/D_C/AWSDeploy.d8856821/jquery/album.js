var photoIDs = new Array();
$(document).ready(function() {
	var index = null;
	var currentID = '#' + index;

	$(".photoIDs").each(function() {
		photoIDs.push($(this).val());
	});
	$('img').hover(function() {
		$(this).css({
			cursor : 'pointer'
		});
	});

	$('.quitView').live('click', function() {
		$.unblockUI({
			fadeOut : 500
		});
	});

	$('.previous').live('click', function() {
		if (index > 0) {
			index = index - 1;
			currentID = '#' + index;
			$('#imgView img').attr("src", $(currentID).attr("src"));
			getCurrentComment(index);
			$('#imgView h4').text(index + 1);
		} else
			alert("This is the first photo");
	});

	$('.next').live('click', function() {
		if (index < $("#photos img").length - 1) {
			index = index + 1;
			currentID = '#' + index;
			$('#imgView img').attr("src", $(currentID).attr("src"));
			getCurrentComment(index);
			$('#imgView h4').text(index + 1);
		} else
			alert("This is the last photo");
	});
	$("#photos img").each(function(i) {

		$(this).click(function() {
			$('#imgView img').attr("src", $(this).attr("src"));
			index = i;
			currentID = '#' + index;
			$('#imgView h4').text(index + 1);
			block();
			getCurrentComment(index);
		});
	});

});

function getCurrentComment(i) {
	$("#comment_area").empty();
	$.ajax({
		url : "getPhotoComments.htm?photoID=" + photoIDs[i],
		cache : false,
		dataType : "xml",
		success : function(msg) {
			$(msg).find("comment").each(
					function() {
						$("#comment_area").append(
								"<div style='clear:both;'><blockquote><p><font color='white'>"
										+ $(this).find("content").text()
										+ ":</font></p><small>"
										+ $(this).find("customer").text() + " "
										+ $(this).find("date").text()
										+ "</small></blockquote></div>");

					});
		}
	});
}

function block() {
	$.blockUI({
		message : $('#imgView'),
		css : {
			border : 'none',
			'width' : '1000px',
			marginLeft : $(window).width() * -0.15,
			top: '100px',
			'background-color' : 'black',
			opacity : 1,
			color : 'black',
			cursor : 'default'
		},
		overlayCSS : {

			cursor : 'default'
		}
	});
}
