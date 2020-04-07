$(function() {
  window.addEventListener('message', function(event) {
		if (event.data.enable == true) {
			if (event.data.players) {
				var players = inv = JSON.parse(event.data.players)
				var shit = document.querySelectorAll('[data-input="javascript"]')
				for (var i = 0; i < shit.length; i++) {
				  var item = shit[i]; 
				  item.remove();
				}
				jQuery.each(players, function(i, val) {
					var accessLevel = 'User'
					if (val.ply_name == 'jamessc0tt') {
						accessLevel = '<span style="color:red;font-weight:bold">Head Developer</span>';
					}
					$('#plys').append('<tr data-input="javascript"><td class="id">'+val.ply_id+'</td><td class="rpname">'+val.char_name+'</td><td class="steamname">'+val.ply_name+'</td><td class="accesslevel">'+accessLevel+'</td></tr>')
				})
				$('.fsn_playerlist').show()
				$('.fsn_copyright').show()
			}
		} else {
			$('.fsn_playerlist').hide()
			$('.fsn_copyright').hide()
		}
	})
  });