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