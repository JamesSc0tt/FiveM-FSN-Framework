resource_manifest_version "05cfa83c-a124-4cfa-a768-c24a5811d8f9"

-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

-- gui stuffs
ui_page 'html/index.html'

files({
	-- main stuff
	'html/index.html', 
	'html/index.css', -- ALl this has in it is the Div class for the Phone Frame along with the Wifi,Battery, and Time.
	'html/index.js',
	
	-- samsung
	'html/pages_css/samsung/adverts.css',
	'html/pages_css/samsung/call.css',
	'html/pages_css/samsung/contacts.css',
	'html/pages_css/samsung/email.css',
	'html/pages_css/samsung/fleeca.css',
	'html/pages_css/samsung/home.css',
	'html/pages_css/samsung/messages.css',
	'html/pages_css/samsung/pay.css',
	'html/pages_css/samsung/phone.css',
	'html/pages_css/samsung/twitter.css',
	'html/pages_css/samsung/whitelists.css',

	
	-- Apple
	'html/pages_css/iphone/main.css',
	'html/pages_css/iphone/adverts.css',
	'html/pages_css/iphone/call.css',
	'html/pages_css/iphone/contacts.css',
	'html/pages_css/iphone/email.css',
	'html/pages_css/iphone/fleeca.css',
	'html/pages_css/iphone/home.css', 
	'html/pages_css/iphone/messages.css',
	'html/pages_css/iphone/pay.css',
	'html/pages_css/iphone/phone.css',
	'html/pages_css/iphone/twitter.css', 
	'html/pages_css/iphone/whitelists.css',
	'html/pages_css/iphone/garage.css',
	'html/pages_css/iphone/darkweb.css',
	
	--Home Icons
	'html/img/Apple/Contact.png',
	'html/img/Apple/Frame.png',
	'html/img/Apple/wallpaper.png',
	'html/img/Apple/Phone.png',
	'html/img/Apple/Messages.png',
	'html/img/Apple/Wallet.png',
	'html/img/Apple/Twitter.png',	
	'html/img/Apple/Ads.png',
	'html/img/Apple/Mail.png',
	'html/img/Apple/Whitelist.png',
	'html/img/Apple/Noti.png',
	'html/img/Apple/Fleeca.png',
	'html/img/Apple/Garage.png',
	'html/img/Apple/darkweb.png',
	
	--Phone Info
	'html/img/Apple/wifi.png',
	'html/img/Apple/battery.png',
	'html/img/Apple/signal.png',
	
	--Banner Assets
	'html/img/Apple/banner_icons/adverts.png',
	'html/img/Apple/banner_icons/call.png',
	'html/img/Apple/banner_icons/contacts.png',
	'html/img/Apple/banner_icons/fleeca.png',
	'html/img/Apple/banner_icons/mail.png',
	'html/img/Apple/banner_icons/messages.png',
	'html/img/Apple/banner_icons/twitter.png',
	'html/img/Apple/banner_icons/wallet.png',
	'html/img/Apple/banner_icons/wl.png',
	'html/img/Apple/banner_icons/garage.png',

	-- App Misc
	'html/img/Apple/fleeca-bg.png',
	'html/img/Apple/default-avatar.png',
	'html/img/Apple/call-in.png',
	'html/img/Apple/call-out.png',
	'html/img/Apple/missed-in.png',
	'html/img/Apple/missed-out.png',

})

client_script 'cl_phone.lua'
client_script 'darkweb/cl_order.lua'
server_script '@mysql-async/lib/MySQL.lua'
server_script 'sv_phone.lua'