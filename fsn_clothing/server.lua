RegisterServerEvent("clothes:firstspawn")
AddEventHandler("clothes:firstspawn",function()
	print('source has no clothes, sending some')
	local source = source
	local default_models = {1413662315,-781039234,1077785853,2021631368,1423699487,1068876755,2120901815,-106498753,131961260,-1806291497,1641152947,115168927,330231874,-1444213182,1809430156,1822107721,2064532783,-573920724,-782401935,808859815,-1106743555,-1606864033,1004114196,532905404,1699403886,-1656894598,1674107025,-88831029,-1244692252,951767867,1388848350,1090617681,379310561,-569505431,-1332260293,-840346158}
	local models = {}
	local identifier = 1
	models[identifier] = {
		model = default_models[math.random(1,tonumber(#default_models))],
		new = true,
		clothing = {drawables = {0,0,0,0,0,0,0,0,0,0,0,0},textures = {2,0,1,1,0,0,0,0,0,0,0,0},palette = {0,0,0,0,0,0,0,0,0,0,0,0}},
		props = {drawables = {-1,-1,-1,-1,-1,-1,-1,-1}, textures = {-1,-1,-1,-1,-1,-1,-1,-1}},
		overlays = {drawables = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}, opacity = {1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0}, colours = {{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0}}},
	}
	TriggerClientEvent("clothes:spawn", source, models[identifier])
end)

RegisterServerEvent('fsn_clothing:requestDefault')
AddEventHandler('fsn_clothing:requestDefault', function()
	
	TriggerClientEvent('fsn_clothing:change', source, data)
end)

RegisterServerEvent('fsn_clothing:save')
AddEventHandler('fsn_clothing:save', function(data)
	
end)