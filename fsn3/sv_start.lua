local framework_version  = '0.0.0';

local framework_name = ':FSN: Framework 3 ('..framework_version..')';

Citizen.CreateThread(function()
	SetGameType(framework_name);
	
	--[[
		Handle version checking 
	]]
	AddEventHandler("onResourceStart", function(resource)
		if resource == GetCurrentResourceName() then
			PerformHttpRequest("https://fsn.rocks/3/version", function(_, html, ...)
				if html ~= framework_version then
					print('^1----------------- ATTENTION ------------------')
					print('--^0 :FSN: Framework Update Available ('..html..')')
					print('^1----------------------------------------------')

					AddEventHandler('playerConnecting', function(playername, setKickReason)
						TriggerClientEvent('fsn3:versionissue', source, framework_name, html)
					end)
				end
			end)
		end
	end)

	--[[
		Handle resource starting
	]]-- 
	for dir in io.popen([[dir "./resources" /b /ad]]):lines() do
		local f=io.open('./resources/'..dir..'/fxmanifest.lua',"r")
		if f~=nil then
			io.close(f)
			if string.sub(dir, 1, 4) == 'fsn3' then
				ExecuteCommand('start '..dir)
			end
		else
			for subdir in io.popen('dir "./resources/'..dir..'" /b /a'):lines() do
				local f=io.open('./resources/'..dir..'/'..subdir..'/fxmanifest.lua',"r")
				if f~=nil then
					io.close(f)
					if string.sub(subdir, 1, 4) == 'fsn3' then
						ExecuteCommand('start '..subdir)
					end
				end
			end
		end
	end
end)