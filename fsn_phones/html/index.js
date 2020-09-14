/*
	Global javascript
*/
var currentPage = 'home';
var myNumber = '000-000-000';
var myEmail = 'myUsername@liveinvader.com';
var currentPhone = 'iphone';
var pages = ['home', 'adverts', 'call', 'contacts', 'email', 'fleeca', 'messages', 'pay', 'phone', 'twitter', 'whitelists', 'garage', 'darkweb'];

var debug = false
function log(msg) {
	if (debug) {
		console.log(msg)
	}
}

// datastore
var datastore = {};

// phone functions
function changePage(page, phone) { // simple function that disables the css from the previous page and enables it for the new one -- will also show/hide all the pages
	log('+-------------- changePage --------------+');
	log('+ changing page to '+page+' on '+phone)
	// hide all the pages
	for (i = 0; i < pages.length; i++) {
		$('#page-samsung-'+pages[i]).hide();
		$('#page-iphone-'+pages[i]).hide();
	}
	
	// show the page we need
	$('#page-'+phone+'-'+page).show();
	currentPage = page;
	if (window.getFunctionFromString('process'+page)) {
		window.getFunctionFromString('process'+page)();
	}
	// dynamically load the css for each page
	for (i = 0; i < document.styleSheets.length; i++) {
		//void(document.styleSheets.item(i).disabled=true);
		var path = document.styleSheets.item(i).href.replace('nui://fsn_phones/html/pages_css/', '');
		
		var filephone = path.split('/')[path.split('/').length-2];
		var file = path.split('/')[path.split('/').length-1];
		if (filephone == 'iphone' || filephone == 'samsung') {
			if (filephone != phone) {
				// this css is for the other phone, hide it
				void(document.styleSheets.item(i).disabled=true);
				log('(other phone) disabling css: '+path);
			} else {
				if (file != 'main.css' && file != page+'.css') {
					void(document.styleSheets.item(i).disabled=true);
					log('(other page) disabling css: '+path);
				} else {
					void(document.styleSheets.item(i).disabled=false);
					log('(main.css | this page) enabling css: '+path);
				}
			}
		}
	}
}
/*
function messageAreaActive() {
	$.post('http://fsn_phones/messageactive', JSON.stringify({}));
}

function messageAreaInActive() {
	$.post('http://fsn_phones/messageinactive', JSON.stringify({}));
}
*/

function formatMoney(amount, decimalCount = 2, decimal = ".", thousands = ",") {
  try {
    decimalCount = Math.abs(decimalCount);
    decimalCount = isNaN(decimalCount) ? 2 : decimalCount;

    const negativeSign = amount < 0 ? "-" : "";

    let i = parseInt(amount = Math.abs(Number(amount) || 0).toFixed(decimalCount)).toString();
    let j = (i.length > 3) ? i.length % 3 : 0;

    return negativeSign + (j ? i.substr(0, j) + thousands : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousands) + (decimalCount ? decimal + Math.abs(amount - i).toFixed(decimalCount).slice(2) : "");
  } catch (e) {
    console.log(e)
  }
};

function updateContact() {
	var name = $('#editcontact_name').val()
	var pn = $('#editcontact_number').val()
	
	$.post('http://fsn_phones/updateAddContact', JSON.stringify({
		'pn':pn,
		'name':name
	}));
	changePage('home', currentPhone);
}
function deleteContact() {
	var pn = $('#editcontact_number').val()
	$.post('http://fsn_phones/removeContact', JSON.stringify({
		'pn':pn
	}));
	changePage('home', currentPhone);
}
function textContact(pn) {
	changePage('messages', currentPhone);
	if (datastore['messages'][pn]) {
		viewMessages(pn)
	} else {
		$('.writemessage').toggle();
		$('.msgplusbutton').toggle();
		$('#dialog_number').val(pn);
	}
}
function callContact(pn) {
	$.post('http://fsn_phones/callContact', JSON.stringify({
		'pn':pn
	}));
}
function viewContact(pn) {
	changePage('contacts', currentPhone)
	if ($('#editcontact_error')) { $('#editcontact_error').remove() }
	$('#viewcontact_delete').hide()
	if (pn) {
		var ctc = datastore['contacts'][pn]
		$('#app-section-view-contacts').hide()
		if (ctc) {
			$('#editcontact_name').val(ctc.name)
			$('#editcontact_number').val(pn)
		} else {
			$('#app-section-add-contact').prepend('<div id="editcontact_error" style="color:red;margin-bottom: 10px;text-align:center;"><b>This contact was not found!</b><br>You can add them now.</div>');
			$('#editcontact_name').val('')
			$('#editcontact_number').val(pn)	
		}
		$('#viewcontact_delete').show()
		$('#app-section-add-contact').show()
	} else {
		$('#app-section-view-contacts').hide()
		$('#editcontact_name').val('')
		$('#editcontact_number').val('')	
		$('#app-section-add-contact').show()
	}
}

var viewingMessage = 0
function viewMessages(pn) {
	var messages = datastore['messages'][pn]['texts']
	viewingMessage = pn //.replace('-', '')
	$('#insertMessages').html();
	$('#view-message').show();
	$('#view-messages').hide();
	var frm = pn
	if (datastore['messages'][pn].contact) {
		frm = datastore['messages'][pn].contact
	}
	var msgHtml = '<div style="width:100%;background-color:white;padding-top:5px;padding-bottom:5px;text-align:center;font-weight:bold;font-size:16px">'+frm+'</div>'
	for (var key in messages){
		var msg = messages[key];
		if (msg.from) {
			msgHtml = msgHtml+
			'<div class="messagebox">'+
				'<div class="message-from">'+
					msg.text+
				'</div>'+
			'</div>'
		} else {
			msgHtml = msgHtml+
			'<div class="messagebox">'+
				'<div class="message-to">'+
					msg.text+
				'</div>'+
			'</div>'
		}
	}
	$('#insertMessages').html(msgHtml);
}

function WLUser(id) {
	var usr = $('#charid-'+id).val()
	var lvl = $('#lvl-'+id).val()
	var wl = id+1 // always plus one for lua communication
	console.log('whitelisting '+usr+' as '+lvl+' in '+datastore['whitelists'][id].title+' ('+id+')')
	$.post('http://fsn_phones/whitelistUser', JSON.stringify({
		'charid': parseInt(usr),
		'lvl': parseInt(lvl),
		'wl': wl
	}));
}

function Click(x, y) {
    var element = $(document.elementFromPoint(x, y));
    element.focus().click();
}

$(function () {
	hoveredElement = null;
	window.addEventListener('message', function (event) {
		if (event.data.type == 'notification') {
			log('adding notification from lua')
			addNotification(event.data.icon, event.data.app, event.data.html)
		}
		if (event.data.type == 'update') {
			// datastore stuff
			datastore['messages'] = event.data.messages;
			datastore['tweets'] = event.data.tweets;
			datastore['whitelists'] = event.data.whitelists;
			datastore['adverts'] = event.data.adverts;
			datastore['emails'] = event.data.emails;
			datastore['contacts'] = event.data.contacts;
			datastore['balance'] = event.data.balance;
			datastore['transactions'] = event.data.transactions;
			datastore['vehicles'] = event.data.vehicles;
			datastore['calls'] = event.data.calls;
			datastore['vpn1'] = event.data.vpn1;
			datastore['vpn2'] = event.data.vpn2;
		}
		if (event.data.type == 'status') {
			if (event.data.display) {
				if (event.data.phoneType == 'iphone') {
					$('#phone-iphone').show();
					changePage('home', 'iphone');
					currentPhone = 'iphone';
				} else {
					$('#phone-samsung').show();
					changePage('home', 'samsung');
					currentPhone = 'samsung';
				}
				
				// number/email/twitter stuffs
				myNumber = event.data.phonenumber;
				myEmail = event.data.username;
			} else {
				$('#phone-iphone').hide();
				$('#phone-samsung').hide();
			}
			return;
		}
	});
	
});

/*
$(document).ready(function() {  
  document.body.addEventListener("mousemove", function(event) {
        var cursor = document.getElementById("cursor");
        var x = event.screenX;
        var y = event.screenY;
        cursor.style.left = `${x}px`;
        cursor.style.top = `${y}px`;
  });
});
*/
var oldY = 0
var buffer = 100
document.body.onmouseup = function() {
	var newY = event.clientY
	if (oldY > newY) {
		var diff = oldY - newY
		if ( diff > buffer) {
			if (currentPage == 'home') {
				$.post('http://fsn_phones/closePhone', JSON.stringify({}));
			} else {
				changePage('home', currentPhone);
				//messageAreaInActive()
			}
		}
	}
	oldY = 0
}
document.body.onmousedown = function() {
	oldY = event.clientY
}

document.onkeydown = function(evt) {
    evt = evt || window.event;
    if (evt.keyCode == 27) {
        if (currentPage == 'home') {
		$.post('http://fsn_phones/closePhone', JSON.stringify({}));
		} else {
			changePage('home', currentPhone);
			//messageAreaInActive()
		}
	}
};

window.getFunctionFromString = function(string) {
    var scope = window;
    var scopeSplit = string.split('.');
    for (i = 0; i < scopeSplit.length - 1; i++) {
        scope = scope[scopeSplit[i]];
        if (scope == undefined) return;
    }
    return scope[scopeSplit[scopeSplit.length - 1]];
}

// functions that will run when the user selects a page, process+pagename
function processmessages() {
	$('#insertTexts').html('');
	var insertString = ''
	for (var key in datastore['messages']){
		var msg = datastore['messages'][key]
		var frm = key
		if (msg.contact) {
			frm = msg.contact
		}
		insertString = insertString+
		'<div class="message" onclick="viewMessages(\''+key+'\')">'+
			'<div class="message-title-area">'+
				frm+' <span class="message-title-date">- Today at 15:09</span>'+
			'</div>'+
			'<div class="message-text-area">'+
				msg.preview+
			'</div>'+
		'</div>'
	}
	$('#insertTexts').html(insertString);
	$('#view-message').hide();
	$('#view-messages').show();
}

function processtwitter() {
	$('#insertTweets').html('');
	var insertString = ''
	for (var key in datastore['tweets']){
		var tweet = datastore['tweets'][key]
		var div = ''
		if (tweet.mention) {
			div = '<div class="tweet mention">'
		} else {
			div = '<div class="tweet">'
		}
		insertString = insertString+
			div+
			'<div class="tweet-title-area">'+
				'@'+tweet.username+' <span class="tweet-title-date">- Today at 15:09</span>'+
			'</div>'+
			'<div class="tweet-text-area">'+
				tweet.tweet+
			'</div>'+
		'</div>'
	}
	$('#insertTweets').html(insertString);
}

function processadverts() {
	$('#insertAdverts').html('');
	var insertString = ''
	for (var key in datastore['adverts']){
		var advert = datastore['adverts'][key]
		insertString = insertString+
		'<div class="advert">'+
			'<div class="advert-text">'+
				advert.advert+
			'</div>'+
			'<div class="advert-author">'+
				advert.name+' - '+advert.number+
			'</div>'+
		'</div>'
	}
	$('#insertAdverts').html(insertString);	
}

function processemail() {
	$('#insertEmails').html('');
	var insertString = ''
	for (var key in datastore['emails']){
		var email = datastore['emails'][key]
		if (email.image) {
			img = '<div class="email-image" style="background-image:url(\''+email.image+'\')"></div>'
		} else {
			img = ''
		}
		insertString = insertString+
			'<div class="email">'+
				'<div class="email-title">'+
					email.subject+
				'</div>'+
				img+
				'<div class="email-content">'+
					email.body+
				'</div>'+
			'</div>'
	}
	$('#insertEmails').html(insertString);	
}

function processwhitelists() {
	$('#insertWhitelists').html('');
	var insertString = ''
	for (var key in datastore['whitelists']){
		var wl = datastore['whitelists'][key]
		var staff = ''
		for (var k in datastore['whitelists'][key].access){
			var st = datastore['whitelists'][key].access[k]
			staff = staff+'<tr>'+
				'<td>'+st.charid+'</td>'+
				'<td>'+st.level+'</td>'+
			'</tr>'
		}
		insertString = insertString+
		'<div class="whitelist">'+
			'<div class="whitelist-title">'+
				wl.title+
			'</div>'+
			
			'<div class="whitelist-info">'+
				'<p>Whitelist Information:</p>'+
				'<table class="wl-table">'+
					'<thead>'+
						'<tr>'+
							'<th></th>'+
							'<th></th>'+
						'</tr>'+
					'</thead>'+
					'<tbody>'+
						'<tr>'+
							'<td>Money</td>'+
							'<td>'+wl.bank+'</td>'+
						'</tr>'+
						'<tr>'+
							'<td>Owner</td>'+
							'<td>'+wl.owner+'</td>'+
						'</tr>'+
					'</tbody>'+
				'</table>'+
				'<p>Manage:</p>'+
				'<div style="width:92%;">'+
					'<input type="text"></input><button>Deposit</button>'+
					'<input type="text"></input><button>Withdraw</button>'+
					'<input id="charid-'+key+'" type="text" style="width:50%;" placeholder="CharID"></input><input type="text" id="lvl-'+key+'" style="width:25%;" placeholder="Lvl"></input><button onclick="WLUser('+key+')">Whitelist</button>'+
				'</div>'+
				'<p>Staff:</p>'+
				'<table class="wl-table">'+
					'<thead>'+
						'<tr>'+
							'<th>CharacterID</th>'+
							'<th>Level</th>'+
						'</tr>'+
					'</thead>'+
					'<tbody>'+
						staff+
					'</tbody>'+
				'</table>'+
				'<button style="margin:5px;width:90%;height:30px;border-radius:5px;color:white;background-color: #303030;font-weight:bold;border:0px;" onclick="clockInWhitelist('+wl.id+')">Clock In/Out</button>'+
			'</div>'+
		'</div>'
	}
	$('#insertWhitelists').html(insertString);
}

function processcontacts() {
	$('#app-section-add-contact').hide()
	$('#app-section-view-contacts').show()
	$('#myNumber').html('<span>T:</span> '+myNumber)
	$('#myEmail').html('<span>E:</span> '+myEmail+'@liveinvader.com')
	
	$('#insertContacts').html('');
	var insertString = ''
	for (var key in datastore['contacts']){
		var ctc = datastore['contacts'][key]
		insertString = insertString+
			'<div class="contact">'+
				'<div class="contact-picture">'+
					'<img class="'+ctc.status+'" src="img/Apple/default-avatar.png">'+
				'</div>'+
				'<div class="contact-name">'+
					'<h1>'+ctc.name+'</h1>'+
					'<p>'+key+'</p>'+
				'</div>'+
				'<div class="contact-manage">'+
					'<div class="contact-manage-icon" onclick="textContact(\''+key+'\');">'+
						'<img src="img/Apple/Messages.png">'+
					'</div>'+
					'<div class="contact-manage-icon" onclick="callContact(\''+key+'\');">'+
						'<img src="img/Apple/Phone.png">'+	
					'</div>'+
					'<div class="contact-manage-icon" onclick="viewContact(\''+key+'\');">'+
						'<img src="img/Apple/Contact.png">'+
					'</div>'+
				'</div>'+
			'</div>'
	}
	$('#insertContacts').html(insertString);	
}

function processfleeca() {
	$('#insertTransactions').html('');
	var bal = formatMoney(datastore['balance']);
	$('#fleeca_balance').html('$'+bal);
	
	var insertString = ''
	for (var key in datastore['transactions']){
		var trans = datastore['transactions'][key]
		insertString = insertString+
			'<div class="transaction">'+
				'<div class="transaction-info">'+
					'<div class="transaction-title">'+trans.title+'</div>'+
					'<div class="transaction-type">'+trans.trantype+'</div>'+
				'</div>'+
				'<div class="transaction-amt '+trans.systype+'">$'+trans.tranamt+'</div>'+
			'</div>'
	}
	$('#insertTransactions').html(insertString);	
}

function processphone() {
	var insertString = ''
	$('#insertCalls').html('')
	for (var key in datastore['calls']){
		var call = datastore['calls'][key]
		var img = ''
		if (call.incoming) {
			if (call.missed) {
				img = '<img src="img/Apple/missed-in.png">'
			} else {
				img = '<img src="img/Apple/call-in.png">'
			}
		} else {
			if (call.missed) {
				img = '<img src="img/Apple/missed-out.png">'
			} else {
				img = '<img src="img/Apple/call-out.png">'
			}
		}
		insertString = insertString+
			'<div class="call">'+
				'<div class="call-icon">'+
					img+
				'</div>'+
				'<div class="call-name">'+
					'<h1>'+call.from+'</h1>'+
					'<p>'+call.number+'</h1>'+
				'</div>'+
				'<div class="call-manage">'+
					'<div class="call-manage-icon" onclick="textContact(\''+call.number+'\');">'+
						'<img src="img/Apple/Messages.png">'+
					'</div>'+
					'<div class="call-manage-icon" onclick="callContact(\''+call.number+'\');">'+
						'<img src="img/Apple/Phone.png">'+
					'</div>'+
					'<div class="call-manage-icon" onclick="viewContact(\''+call.number+'\');">'+
						'<img src="img/Apple/Contact.png">'+
					'</div>'+
				'</div>'+
			'</div>'
	}
	$('#insertCalls').html(insertString);	
}

function processgarage() {
	if (datastore.vehicles.length > 0) {
		$('#garageApp-error').hide()
		$('#insertVehicles').show()
		
		$('#insertVehicles').html('');		
		var insertString = ''
		for (var key in datastore['vehicles']){
			var veh = datastore['vehicles'][key]
			var finance = ''
			veh.finance = JSON.parse(veh.veh_finance)
			//if (veh.veh_finance.timeleft > 0) {
				if (veh.finance.outright == false) {
					finance = '<p><b>Payment Information</b></p>'+
					'<table class="wl-table">'+
						'<thead>'+
							'<tr>'+
								'<th>Time Left</th>'+
								'<th>Amount Left</th>'+
								'<th>Status</th>'+
							'</tr>'+
						'</thead>'+
						'<tbody>'+
							'<td>'+veh.finance.loanprice+'</td>'+
							'<td>'+veh.finance.priceleft+'</td>'+
							'<td><span class = "notpaid">NOT PAID</span></td>'+
						'</tbody>'+
					'</table>'
				} else {
					finance = '<p><b>Payment Information</b></p>'+
					'<table class="wl-table">'+
						'<thead>'+
							'<tr>'+
								'<th>Status</th>'+
							'</tr>'+
						'</thead>'+
						'<tbody>'+
							'<td><span class = "paid">PAID OFF</span></td>'+
						'</tbody>'+
					'</table>'
				}
			//} //else {
				//finance = 'No finance information available for this vehicle.'
			//}
			insertString = insertString+
				'<div class="vehicle">'+
					'<h1>'+veh.veh_displayname+'</h1>'+
					'<div class="vehicle-info">'+
						'<p><b>Type</b>: '+veh.veh_type+'</p>'+
						'<p><b>Plate</b>: '+veh.veh_plate+'</p>'+
					'</div>'+
					'<div class="vehicle-info">'+
						'<p><b>Garage Status</b>: '+veh.veh_status+'</p>'+
						'<p><b>Stored At</b>: '+veh.veh_garage+'</p>'+
					'</div>'+
					'<div class="vehicle-info">'+
						finance+
					'</div>'+
					'<button style="margin:5px;margin-top:20px;width:90%;height:30px;border-radius:5px;color:white;background-color: #303030;font-weight:bold;border:0px;">Restore Vehicle</button>'+
				'</div>'
		}
		$('#insertVehicles').html(insertString);
	} else {
		$('#garageApp-error').show()
		$('#insertVehicles').hide()
	}
}

function processdarkweb() {
	if (datastore.vpn1 || datastore.vpn2) {
		// generate pages
		$('#darkweb-error').hide()
		$('#darkweb-menu').hide()
		$('#darkweb-acl').show()
		
		$('#darkweb-page2').hide()
		$('#darkweb-page1').show()
		
		if (datastore.vpn2) {
			$('#darkweb-menu').show()
			
		}
	} else {
		// no vpn == no access
		$('#darkweb-acl').hide()
		$('#darkweb-error').show()
	}
}

/*
	james' notes
	
	for ( i=0; i<document.styleSheets.length; i++) {
		void(document.styleSheets.item(i).disabled=true);
	}

*/

/*
	Notification things
*/
var notiID = 0
var notiEN = true
function toggleNotification() {
	if (notiEN) {
		addNotification('img/Apple/Noti.png', 'Phone', 'Notifications: <b>disabled</b>')
		notiEN = false
	} else {
		notiEN = true
		addNotification('img/Apple/Noti.png', 'Phone', 'Notifications: <b>enabled</b>')
	}
}
function removeNotification(id) {
	$('#'+id).fadeOut()
}
function addNotification(icon, app, html) {
	if (notiEN) {
		notiID = notiID+1
		var myID = 'notification-display-'+notiID
		var html = '<div class="notification-'+currentPhone+'" id="'+myID+'" style="display:none;">'+
			'<div class="notification-'+currentPhone+'-title-area">'+
				'<div class="notification-'+currentPhone+'-title-icon">'+
					'<img src="'+icon+'">'+
				'</div>'+
				'<div class="notification-'+currentPhone+'-title-text">'+
					'<p>'+app+'</p>'+
				'</div>'+
				'<div class="notification-'+currentPhone+'-title-time"><p>now</p></div>'+
			'</div>'+
			'<div class="notification-'+currentPhone+'-info">'+
				'<p>'+html+'</p>'+
			'</div>'+
		'</div>'
		$('#insertNotifications').append(html)
		$('#'+myID).fadeIn('fast')
		setTimeout(function(){removeNotification(myID)}, 5000);
	}
}

/*
	Usage things
*/

function sendText(number, msg) {
	if (number == false) {
		number = viewingMessage
	}
	$.post('http://fsn_phones/sendToServer', JSON.stringify({
		'message': {
			'to': number,
			'body': msg
		},
	}));
}

function sendTweet() {
	var twt = $('#tweet_textarea').val()
	$.post('http://fsn_phones/sendToServer', JSON.stringify({
		'tweet': twt
	}));
	changePage('home', currentPhone)
	$('#tweet_textarea').val('')
}

function addAdvert() {
	var ad = $('#advert_textarea').val()
	$.post('http://fsn_phones/sendToServer', JSON.stringify({
		'advert': ad
	}));
	changePage('home', currentPhone)
	$('#advert_textarea').val('')
}

function clockInWhitelist(id) {
	log('toggling wl '+id)
	$.post('http://fsn_phones/toggleWhitelist', JSON.stringify({
		'id': id
	}));
}
