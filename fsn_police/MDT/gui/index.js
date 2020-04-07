$(function() {
    window.addEventListener('message', function(event) {
		if (event.data.displayMDT) {
			console.log('showing mdt')
			$('#mdt').show()
		} else {
			$('#mdt').hide()
		}
	})
})

$(document).keyup(function(e) {
     if (e.keyCode == 27 || e.keyCode == 112) { 
		$.post('http://fsn_police/closeMDT', JSON.stringify({}));
    }
});