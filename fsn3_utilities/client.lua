local UTIL = {}

RegisterNetEvent('fsn:object:util')
AddEventHandler('fsn:object:util', function(callback)
	UTIL.CAM = CAM
	callback(UTIL)
end)

UTIL.functions = {}
UTIL.functions.data = {}
UTIL.functions.data.servercallback = {}
UTIL.functions.servercallback = function(name, request, source, callback, ...)
	if UTIL.functions.data.servercallback[name] then
		
	else
		UTIL.functions.debug('Callback '..name..' does not exist!')
	end
end

UTIL.functions.debug = function(str)
	local debug_mode = true
	if debug_mode then
		print(str)
	end
end