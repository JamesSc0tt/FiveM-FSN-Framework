$(function() {
  window.addEventListener('message', function(event) {
	if (event.data.type == 'charMenu') {
		if (event.data.enable) {
			$('#init').show()
		} else {
			$('#init').hide()
		}
	}
	if (event.data.type == 'gui') {
		if (event.data.display) {
			if (event.data.display == 'money') {
				$('#money_replace').text(event.data.amount)
				$('.money').fadeIn()
				setTimeout(function(){$('.money').fadeOut()}, 3000)
			}
			if (event.data.display == 'bank') {
				$('#bank_replace').text(event.data.amount)
				$('.bank').fadeIn()
				setTimeout(function(){$('.bank').fadeOut()}, 3000)
			}
			if (event.data.display == 'both') {
				$('#money_replace').text(event.data.moneyAmount)
				$('.money').fadeIn()
				setTimeout(function(){$('.money').fadeOut(400)}, 3000)
				$('#bank_replace').text(event.data.bankAmount)
				$('.bank').fadeIn()
				setTimeout(function(){$('.bank').fadeOut(400)}, 3000)
			}
			if (event.data.display == 'bankChange') {
				$('#bank_replace').text(event.data.bankAmount)
				$('.bank').fadeIn()
				setTimeout(function(){$('.bank').fadeOut(400)}, 3000)
				if (event.data.changeAmount > 0) {
					$('#bank_change_plus').text(event.data.changeAmount)
					$('.bankPlus').fadeIn()
					setTimeout(function(){$('.bankPlus').fadeOut(400)}, 3000)
				} else {
					$('#bank_change_minus').text(event.data.changeAmount)
					$('.bankMinus').fadeIn()
					setTimeout(function(){$('.bankMinus').fadeOut(400)}, 3000)
				}
			}
			if (event.data.display == 'moneyChange') {
				$('#money_replace').text(event.data.moneyAmount)
				$('.money').fadeIn()
				setTimeout(function(){$('.money').fadeOut(400)}, 3000)
				if (event.data.changeAmount > 0) {
					$('#money_change_plus').text(event.data.changeAmount)
					$('.moneyPlus').fadeIn()
					setTimeout(function(){$('.moneyPlus').fadeOut(400)}, 3000)
				} else {
					$('#money_change_minus').text(event.data.changeAmount)
					$('.moneyMinus').fadeIn()
					setTimeout(function(){$('.moneyMinus').fadeOut(400)}, 3000)
				}
			}
		}
	}
	if (event.data.type == 'characterInfo') {
		if (event.data.char1_id != 'nothing') {
			$('.char1-create').hide()
			$('.char1-details').show()
			
			$('#char1_id').html('<b>Character ID:</b> ')
			$('#char1_fname').html('<b>First Name:</b> ')
			$('#char1_lname').html('<b>Last Name:</b> ')
			$('#char1_dob').html('<b>DoB:</b> ')
			
			$('#char1_id').append('<span id="char_1_id">'+event.data.char1_id+'</span>')
			$('#char1_fname').append('<span>'+event.data.char1_fname+'</span>')
			$('#char1_lname').append('<span>'+event.data.char1_lname+'</span>')
			$('#char1_dob').append('<span>'+event.data.char1_dob+'</span>')
		}
		if (event.data.char2_id != 'nothing') {
			$('.char2-create').hide()
			$('.char2-details').show()
			
			$('#char2_id').html('<b>Character ID:</b> ')
			$('#char2_fname').html('<b>First Name:</b> ')
			$('#char2_lname').html('<b>Last Name:</b> ')
			$('#char2_dob').html('<b>DoB:</b> ')
			
			$('#char2_id').append('<span id="char_2_id">'+event.data.char2_id+'</span>')
			$('#char2_fname').append('<span>'+event.data.char2_fname+'</span>')
			$('#char2_lname').append('<span>'+event.data.char2_lname+'</span>')
			$('#char2_dob').append('<span>'+event.data.char2_dob+'</span>')
		}
		
		if (event.data.char3_id != 'nothing') {
			$('.char3-create').hide()
			$('.char3-details').show()
			
			$('#char3_id').html('<b>Character ID:</b> ')
			$('#char3_fname').html('<b>First Name:</b> ')
			$('#char3_lname').html('<b>Last Name:</b> ')
			$('#char3_dob').html('<b>DoB:</b> ')
			
			$('#char3_id').append('<span id="char_3_id">'+event.data.char3_id+'</span>')
			$('#char3_fname').append('<span>'+event.data.char3_fname+'</span>')
			$('#char3_lname').append('<span>'+event.data.char3_lname+'</span>')
			$('#char3_dob').append('<span>'+event.data.char3_dob+'</span>')
		}
		$('#loading').slideUp()
		setTimeout(function(){$('#charactermenu').slideDown()},500)
	}
  });
});

const numberWithCommas = (x) => {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

document.body.onmouseup = function() {
	if ($('#charCreate:hover').length != 0) {
		$('#motd').slideUp();
		setTimeout(function(){$('#charactermenu').slideUp()}, 500);
		setTimeout(function(){$('#charactercreation').slideDown()}, 600)
	}
	if ($('.createbackbutton:hover').length != 0) {
		if ($('#charactercreation').is(":visible")) {
			$('#charactercreation').slideUp();
			setTimeout(function(){$('#motd').slideDown()}, 500);
			setTimeout(function(){$('#charactermenu').slideDown()}, 600)
		}
	}
	if ($('.createcreatebutton:hover').length != 0) {
		if ($('#create-fname').val() && $('#create-lname').val() && $('#create-dob').val()) {
			// currently character description isn't required, this can be changed if you want to start forcing it
			$.post('http://fsn_main/createCharacter', JSON.stringify({
				char_fname: $('#create-fname').val(),
				char_lname: $('#create-lname').val(),
				char_dob: $('#create-dob').val(),
				char_desc: $('#create-desc').val()
			}))
			$('#charactercreation').slideUp();
			setTimeout(function(){$('#loading').slideDown()}, 500);
			setTimeout(function(){$('#loading').slideUp()}, 750);
			setTimeout(function(){$('#motd').slideDown()}, 750);
		}
	}
	if ($('#select_1:hover').length != 0) {
		var char_id = $('#char_1_id').text()
		$('#motd').slideUp();
		setTimeout(function(){$('#charactermenu').slideUp();}, 500);
		$('#loading_text').text('Spawning character '+char_id+'...')
		setTimeout(function(){$('#loading').slideDown()}, 600);
		$.post('http://fsn_main/spawnCharacter', JSON.stringify({
			character_id: char_id
		}))
	}
	if ($('#select_2:hover').length != 0) {
		var char_id = $('#char_2_id').text()
		$('#motd').slideUp();
		setTimeout(function(){$('#charactermenu').slideUp();}, 500);
		$('#loading_text').text('Spawning character '+char_id+'...')
		setTimeout(function(){$('#loading').slideDown()}, 600);
		$.post('http://fsn_main/spawnCharacter', JSON.stringify({
			character_id: char_id
		}))	
	}
	if ($('#select_3:hover').length != 0) {
		var char_id = $('#char_3_id').text()
		$('#motd').slideUp();
		setTimeout(function(){$('#charactermenu').slideUp();}, 500);
		$('#loading_text').text('Spawning character '+char_id+'...')
		setTimeout(function(){$('#loading').slideDown()}, 600);
		$.post('http://fsn_main/spawnCharacter', JSON.stringify({
			character_id: char_id
		}))
	}
}

$(document).keyup(function(e) {
     if (e.keyCode == 27) { //escape key
        if ($('#charactercreation').is(":visible")) {
			$('#charactercreation').slideUp();
			setTimeout(function(){$('#motd').slideDown()}, 500);
			setTimeout(function(){$('#charactermenu').slideDown()}, 600)
		}
    }
});