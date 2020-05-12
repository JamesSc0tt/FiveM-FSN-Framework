local current_version = '2.1.4'
local current_release = false

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        PerformHttpRequest("https://fsn.rocks/api/public/version", function(_, html, ...)
	        current_release = current_version
	        if html == current_version then
	        	-- is up to date woo!
	        else
	            PerformHttpRequest("https://fsn.rocks/api/public/changelog", function(_, changelog, ...)
	            	changelog = json.decode(changelog)
	            	print('')
	            	print('^1----------------- ATTENTION ------------------')
	            	print('--^0 :FSN: Framework Update Available ('..html..')')
	            	print('^1--^0')
	            	print('^1--^0 Change log:')
	            	for k,v in pairs(changelog) do
	            		print('^1--^3 > ^0'..v)
	            	end
	            	print('^1----------------------------------------------')
	            	print('^0')
	        	end)
	        end
	    end, 'GET', '', {})
    end
end)


AddEventHandler('playerConnecting', function(playername, setKickReason)
	if current_release then
		TriggerClientEvent('fsn_main:version', source, current_version, current_release)
	else
		print('^1ERROR:^0 Cannot send versiondata to '..playername..', check for lua errors.')
	end
end)