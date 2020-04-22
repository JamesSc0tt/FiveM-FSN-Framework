-- External logging system shit	
function fsn_AddLog(src,Category,Description)
	local SteamID = 'notset'
	if src then
		SteamID = GetPlayerIdentifiers(src)[1]
	else
		SteamID = GetPlayerIdentifiers(source)[1]
	end
	
	PerformHttpRequest('http://nocf.fsn.rocks/add-log.php?key=LF20&cat='..Category..'&steamid='..SteamID..'&info='..Description)
	--PerformHttpRequest('http://logs.fsn.life/logs.php?action=create-log&secret=FusIoN2019SecreTwas0d8h&category=' .. Category .. '&desc=' .. Description), function(statusCode, response, headers) end)
end

RegisterServerEvent('fsn_main:logging:addLog')
AddEventHandler('fsn_main:logging:addLog', function(src, Category, Description)
	--print(':fsn_main: #'..src..' Adding log: '..Description)
	Description = string.gsub(Description, " ", "%%20")
    fsn_AddLog(src,Category, Description)
end)