var canUse = true
window.addEventListener("message", function (event) {
	if (event.data.actionbar) {
		if (event.data.display) {
			for (i = 1; i < 6; i++) {
				var ni = i - 1
				if (event.data.items[ni].index) {
					$('#actionbaritem-'+ni).attr("src","img/items/"+event.data.items[ni].index+".png")
					if (event.data.items[ni].inuse) {
						$('#actionbaritem-'+ni).addClass('inuse');
					} else {
						$('#actionbaritem-'+ni).removeClass('inuse');
					}
					$('#actionbaritem-'+ni).show()
				} else {
					$('#actionbaritem-'+ni).hide()
				}
			}
			$('.actionbar').show()
		} else {
			$('.actionbar').hide()
		}
	}
	if (event.data.action == 'display') {
		if (event.data.val) {
			$('.ui').show()
			$('#playerInventory').html('')
			$('#otherInventory').html('')
			if (canUse) {
				$('.overlay').hide()	
			} else {
				$('.overlay').show()	
			}
		} else {
			$('.ui').hide()
			$('.overlay').hide()
		}
	}
	if (event.data.action == 'update') {
		if (event.data.inuse) {
			canUse = false
		} else {
			canUse = true
		}
		if ($('.ui').is(":visible")) {
			if (canUse) {
				$('.overlay').hide()	
			} else {
				$('.overlay').show()	
			}
		}
		updateInv('playerInventory', event.data.first)
		updateInv('otherInventory', event.data.second)
	}
	if (event.data.action == 'log') {
		var d = new Date();
		$('.console').prepend('<div class="console_entry">[LUA]['+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds()+'] '+event.data.string+'</div>')
	}
	if (event.data.action == 'data') {
		log('got item data from luas')
		var html = '<h1>'+event.data.name+'</h1>'+
			'<img src="img/items/'+event.data.index+'.png"/>'+
			event.data.html
		$('#iteminfo').html(html)
	}
})

function log(string) {
	var d = new Date();
	$('.console').prepend('<div class="console_entry">[JS]['+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds()+'] '+string+'</div>')
}

$(document).ready(function () {
    $("#count").focus(function () {
        $(this).val("")
    }).blur(function () {
        if ($(this).val() == "") {
            $(this).val("1")
		}
		if ($(this).val() <= 0) {
            $(this).val("1")
		}
		if ($(this).val() > 999999) {
            $(this).val("999999")
        }
	});
});

function updateInv(div, data) {
	log('got update from lua') 
	$('#'+div).html('')
	var updateString = ''
	if (data.length > 0) {
		for (var key in data){
			var item = data[key]
			var hotkey = Number(key)+1
			if (hotkey < 6) {
				hotkey = '<div class="item-num"><span>'+
							hotkey+
						'</span></div>'
			} else { hotkey = '' }
			if (item.name) {
				var busy = ''
				if (item.inuse) {
					busy = 'inuse';
				}
				updateString = updateString+
					'<div class="slot '+busy+'" data-inventory="'+div+'" data-slotid="'+key+'">'+
						'<div class="item" data-inventory="'+div+'" data-slotid="'+key+'" onclick="viewData(\''+div+'/'+key+'\')">'+
							'<div class="item-icon">'+
								'<img src="img/items/'+item.index+'.png"/>'+
								'<div class="item-amt">'+
									item.amt+
								'</div>'+
								hotkey+
							'</div>'+
							'<div class="item-name">'+
								item.name+
							'</div>'+
						'</div>'+
					'</div>'
			} else {
				updateString = updateString +'<div class="slot" data-inventory="'+div+'" data-slotid="'+key+'"></div>'
			}
		}
		$('#'+div).html(updateString)
	}
	init()
}

function viewData(obj) {
	obj = obj.split("/")
	obj[1] = parseInt(obj[1])
	$.post('http://fsn_inventory/viewData', JSON.stringify({
		inv: obj[0],
		slot: obj[1]
	}))
	log('asking lua for info on slot('+obj[1]+') in inv('+obj[0]+')')
}

function init() {
	// this function will make the stuff drag/droppable
	$('.item').each(function(i, obj) {
		$(obj).draggable({
			helper: 'clone',
			appendTo: 'body',
			zIndex: 99999,
			revert: 'invalid',
			start: function (event, ui) {
				$(this).css('background-image', 'none');
			},
			stop: function () {
				itemData = $(this).data("item");
				
				if (itemData !== undefined && itemData.name !== undefined) {
					$(this).css('background-image', 'url(\'img/items/' + itemData.name + '.png\'');
					$("#drop").removeClass("disabled");
					$("#use").removeClass("disabled");
					$("#give").removeClass("disabled");
				}
			}
		});
	});
	$('.slot').droppable({
		drop: function (event, ui) {
			hoverClass: 'hoverControl',
			updateSlot(parseInt($("#count").val()), $(this).data("inventory"), $(this).data("slotid"), ui.draggable.data("inventory"), ui.draggable.data("slotid"))	
		}
	});
	$('#drop').droppable({
		drop: function (event, ui) {
			hoverClass: 'hoverControl',
			dropSlot(parseInt($("#count").val()), ui.draggable.data("inventory"), ui.draggable.data("slotid"))	
		}
	});
	$('#use').droppable({
		drop: function (event, ui) {
			hoverClass: 'hoverControl',
			useSlot(parseInt($("#count").val()), ui.draggable.data("inventory"), ui.draggable.data("slotid"))	
		}
	});
}

function useSlot(amt, fromInv, fromSlot) {
	log('sending: use '+amt+' from '+fromSlot+'/'+fromInv)
	$.post('http://fsn_inventory/useSlot', JSON.stringify({
		amt: amt,
		fromInv: fromInv,
		fromSlot: fromSlot+1
	}));
}

function dropSlot(amt, fromInv, fromSlot) {
	log('sending: drop '+amt+' from '+fromSlot+'/'+fromInv)
	$.post('http://fsn_inventory/dropSlot', JSON.stringify({
		amt: amt,
		fromInv: fromInv,
		fromSlot: fromSlot+1
	}));
}

function updateSlot(amt, toInv, toSlot, fromInv, fromSlot) {
	log('sending: move '+amt+' from '+fromSlot+'/'+fromInv+' to '+toSlot+'/'+toInv)
	$.post('http://fsn_inventory/dragToSlot', JSON.stringify({
		amt: amt,
		fromInv: fromInv,
		fromSlot: fromSlot+1,
		toInv: toInv,
		toSlot: toSlot+1
	}));
}

document.onkeydown = function(evt) {
    evt = evt || window.event;
    if (evt.keyCode == 27 || evt.keyCode == 112 || evt.keyCode == 9) {
        $.post('http://fsn_inventory/closeGUI', JSON.stringify({}))
	}
};