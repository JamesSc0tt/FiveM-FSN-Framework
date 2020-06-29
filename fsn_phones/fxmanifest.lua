--[[/   :FIVEM MANIFEST SHIT:	\]]--
fx_version 'bodacious'
games { 'gta5' }
--[[/   :FIVEM MANIFEST SHIT:	\]]--

--[[/	:Globals:	\]]--
client_scripts { 
    '@fsn_main/cl_utils.lua',
    '@fsn_main/server_settings/sh_settings.lua'
}
server_scripts { 
    '@fsn_main/sv_utils.lua',
    '@fsn_main/server_settings/sh_settings.lua',
    '@mysql-async/lib/MySQL.lua'
}
--[[/	:Globals:	\]]--

-- gui stuffs
ui_page 'html/index.html'

files {
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

	'html/img/cursor.png',

}

client_scripts { 
	'cl_phone.lua',
	'darkweb/cl_order.lua',
}

server_scripts { 
	'sv_phone.lua',
}

exports {
	'isPhoneActive'
}