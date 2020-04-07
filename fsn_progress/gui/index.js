function updateEllipsis() {
	var elem = $('#fsn_ellipsis')
	if (!elem.text()) {
		elem.text('.');
	}
	setTimeout(function() {
		if (elem.text() == '.') {
			elem.text('..');
		}
	}, 1000)
	setTimeout(function() {
		if (elem.text() == '..') {
			elem.text('...')
		}
	}, 2000)
	setTimeout(function() {
		if (elem.text() == '...') {
			elem.remove()
			$('#fsn_progressbar_title').append('<span id="fsn_ellipsis"></span>')
		}
	}, 3000)
	setTimeout(updateEllipsis, 10)
}
setTimeout(updateEllipsis, 500)

function updateProgress(updaate) {
	var newup = $('#progress').width() + updaate
	console.log('setting width to '+newup)
	$('#progress').css('width', newup+'px')
	setTimeout(function(){
		updateProgress(updaate)
	}, 1000)
}

$(function() {
  window.addEventListener('message', function(event) {
	if (event.data.type == 'progressBar') {
		document.body.style.display = event.data.enable ? "block" : "none";
		var timeout = event.data.timeout
		var title = event.data.title
		$('#fsn_title').text(title);
		var update = timeout / 100
		setTimeout(function() {
			updateProgress(update)
		}, 1000)
	}
  });
});