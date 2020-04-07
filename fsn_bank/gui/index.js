var wallet = 0
var bank = 0

var amiatbank = false
$(function() {
	window.addEventListener('message', function(event){
		var item = event.data;
		if (item.type == 'displayATM') {
			if (item.bank) {
				amiatbank = true
			} else {
				amiatbank = false
			}
			if (item.enable) {
				$('#atm_main').show()
				$('#withdraw_screen').hide()
				$('#transfer_screen').hide()
				$('#group_screen').hide()
				$('#deposit_screen').hide()
				$('#options_screen').show()
				$('.withdraw_input').val(0)
				$('.deposit_input').val(0)
			} else {
				$('#atm_main').hide()
			}
		}
		if (item.type == 'update') {
			if (item.updateType == 'wallet&bank') {
				$('#replace_balance').text('')
				$('#replace_abalance').text('')
				$('#replace_balance').text('$'+item.wallet)
				$('#replace_abalance').text('$'+item.bank)
			}
		}
	})
})

var audioElement = false
document.body.onmouseup = function() {
	if ($('.main_button:hover').length != 0) {
		if (audioElement == false) {
			audioElement = document.createElement('audio');
			audioElement.setAttribute('src', 'atm_button_sound.mp3');
			
			//audioElement.addEventListener('ended', function() {
			//	this.play();
			//}, false);
		}
		audioElement.play();
	}
	if ($('#button_2:hover').length != 0) {
		if ($('#options_screen').is(":visible")) {
			$('#options_screen').hide()
			$('#withdraw_screen').show()
		}
	}
	if ($('#button_3:hover').length != 0) {
		if ($('#options_screen').is(":visible")) {
			$('#options_screen').hide()
			$('#transfer_screen').show()
		}
	}
	
	if ($('#button_4:hover').length != 0) {
		if ($('#withdraw_screen').is(":visible")) {
			$('#withdraw_screen').hide()
			$('#options_screen').show()
		}
		if ($('#deposit_screen').is(":visible")) {
			$('#deposit_screen').hide()
			$('#options_screen').show()
		}
		if ($('#transfer_screen').is(":visible")) {
			$('#transfer_screen').hide()
			$('#options_screen').show()
		}
	}
	
	if ($('#button_6:hover').length != 0) {
		if ($('#options_screen').is(":visible")) {
			$('#options_screen').hide()
			$('#deposit_screen').show()
		}
	}
	
	if ($('#button_7:hover').length != 0) {
		if ($('#options_screen').is(":visible")) {
			$('#options_screen').hide()
			$('#group_screen').show()
			return
		}
	}
	
	if ($('#button_8:hover').length != 0) {
		if ($('#options_screen').is(":visible")) {
			//$('#atm_main').hide()
			$.post('http://fsn_bank/toggleGUI', JSON.stringify({}))
		}
		if ($('#deposit_screen').is(":visible")) {
			if ($('.deposit_input').val() && Number($('.deposit_input').val())) {
				$.post('http://fsn_bank/depositMoney', JSON.stringify({
					deposit: Number($('.deposit_input').val()),
					atbank: amiatbank
				}))
			}			
		}
		if ($('#withdraw_screen').is(":visible")) {
			if ($('.withdraw_input').val() && Number($('.withdraw_input').val())) {
				$.post('http://fsn_bank/withdrawMoney', JSON.stringify({
					withdraw: Number($('.withdraw_input').val())
				}))
			}			
		}
		if ($('#transfer_screen').is(":visible")) {
			if ($('.transfer_input').val() && Number($('.transfer_input').val())) {
				if ($('#transfer_input_to').val() && Number($('#transfer_input_to').val())) {
					$.post('http://fsn_bank/transferMoney', JSON.stringify({
						transferAmount: Number($('.transfer_input').val()),
						transferTo: Number($('#transfer_input_to').val())
					}))
				}
			}			
		}
	}
	
	if ($('.main_button:hover').length != 0) {
		if ($('#group_screen').is(":visible")) {
			$('#group_screen').hide()
			$('#options_screen').show()
		}
	}
}