-- New Util shit to pass the functions easier and similar to how ESX does it
FSN 					= {}
local current_players 	= {}
local moneystore		= {}

AddEventHandler('fsn:getFsnObject', function(cb)
	cb(FSN)
end)

AddEventHandler('fsn_main:updateCharacters', function(charTbl)
	current_players = charTbl
end)

AddEventHandler('fsn_main:updateMoneyStore', function(moneyTbl)
	moneystore = moneyTbl
end)

AddEventHandler('playerDropped', function()

	local playerId = source

	for j = 1, #current_players do
		if current_players[j].ply_id == playerId then
			current_players[j] = nil
		end
	end

end)

FSN.GetPlayerFromId = function(playerId)

	for i = 1, #current_players do
		if current_players[i].ply_id == playerId then
			return current_players[i]
		end
	end

	return nil

end



-- Old Util shit that I will eventually move over in all the scripts
Util = {}

function Util.SplitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function Util.GetSteamID(src)
	-- drop the player if the first identifier is not a steamid 
	if not string.find(GetPlayerIdentifiers(src)[1], 'steam') then
		DropPlayer(src, 'ERR: Steam does not seem to be running')
	end
	return GetPlayerIdentifiers(src)[1]
end

function Util.MakeString(length)
	if length < 1 then return nil end
	local string = ""
	for i = 1, length do
		string = string .. math.random(32, 126)
	end
	return string
end