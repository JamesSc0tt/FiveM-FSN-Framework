local boat_spots = {
	[1] =  {x = -723.84869384766, y = -1327.9862060547, z = -0.47442156076431, h = 230.5207824707,  boat = {} }, 
	[2] =  {x = -730.05627441406, y = -1334.4948730469, z = -0.47442156076431, h = 230.5207824707,  boat = {} }, 
	[3] =  {x = -735.41149902344, y = -1341.6734619141, z = -0.47442156076431, h = 230.5207824707,  boat = {} }, 
	[4] =  {x = -740.75665283203, y = -1348.8312988281, z = -0.11605902016163, h = 230.5207824707,  boat = {} }, 
	[5] =  {x = -745.94604492188, y = -1355.8922119141, z = -0.47458252310753, h = 230.5207824707,  boat = {} }, 
}

local boats = {
		{name = "Dinghy 4 Seater", costs = 85000, rentalprice = 17000, description = {}, model = "dinghy"},
		{name = "SeaShark", costs = 15000, rentalprice = 3000, description = {}, model = "seashark"},
		{name = "SeaShark Yacht", costs = 18000, rentalprice = 32000, description = {}, model = "seashark3"},
		{name = "Speeder", costs = 105000, rentalprice = 21000, description = {}, model = "speeder"},
		{name = "Squalo", costs = 110000, rentalprice = 22000, description = {}, model = "squalo"},
		{name = "SunTrap", costs = 75000, rentalprice = 15000, description = {}, model = "suntrap"},
		{name = "Toro", costs = 150000, rentalprice = 30000, description = {}, model = "Toro"},
		{name = "Toro Yacht", costs = 155000, rentalprice = 31000, description = {}, model = "Toro2"},
		{name = "Tropic", costs = 175000, rentalprice = 35000, description = {}, model = "tropic"},
		{name = "Tropic Yacht", costs = 178000, rentalprice = 35600, description = {}, model = "tropic2"},
		{name = "Dinghy 2 Seater", costs = 90000, rentalprice = 18000, description = {}, model = "dinghy2"},
		{name = "Jetmax", costs = 140000, rentalprice = 28000, description = {}, model = "jetmax"},
		{name = "Marquis", costs = 250000, rentalprice = 100000, description = {}, model = "marquis"},
		
}

RegisterServerEvent('fsn_boatshop:floor:Request')
AddEventHandler('fsn_boatshop:floor:Request', function()
	--local i = 1
	for k, v in pairs(boat_spots) do
		if not v.boat.model then
			local boat = boats[math.random(1, #boats)]
			-- no vehicle is set, adding default value!
			v.boat = { model = boat.model, name = boat.name, buyprice = boat.costs, rentalprice = boat.rentalprice, commission = 15, color = {math.random(1, 159),math.random(1,159)}, object = false, updated = false }
			print(':fsn_boatstore: setting boat '..k..' to '..boat.model)
			--i = i+1
		end
	end
	
	TriggerClientEvent('fsn_boatshop:floor:Update', source, boat_spots)
end)

function WorksAtStore(id)
	return exports["fsn_jobs"]:isPlayerClockedInWhitelist(id, 4)
end
AddEventHandler('chatMessage', function(source, auth, msg)
	local split = Util.SplitString(msg, ' ')
	if WorksAtStore(source) then
		if split[1] == '/comm' then
			if tonumber(split[2]) and tonumber(split[2]) <= 30 and tonumber(split[2]) > 0 then
				TriggerClientEvent('fsn_boatshop:floor:commission', source, tonumber(split[2]))
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Usage: /comm {number: 0-30}' })
			end
		end
		if split[1] == '/color1' then
			if tonumber(split[2]) and tonumber(split[2]) <= 159 and tonumber(split[2]) > 0 then
				TriggerClientEvent('fsn_boatshop:floor:color:One', source, tonumber(split[2]))
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Usage: /color1 {number: 0-159}' })
			end
		end
		if split[1] == '/color2' then
			if tonumber(split[2]) and tonumber(split[2]) <= 159 and tonumber(split[2]) > 0 then
				TriggerClientEvent('fsn_boatshop:floor:color:Two', source, tonumber(split[2]))
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Usage: /color2 {number: 0-159}' })
			end
		end
		if split[1] == '/testdrive' then
			if split[2] then
				if split[2] == 'end' then
					TriggerClientEvent('fsn_boatshop:testdrive:end', source)
				end
			else
				TriggerClientEvent('fsn_boatshop:testdrive:start', source)
			end
		end
	end
end)

function getVehicleFromModel(mdl)
	for k, boat in pairs(boats) do
		if boat.model == mdl then
			return boat
		end
	end
end

RegisterServerEvent('fsn_boatshop:floor:color:One')
AddEventHandler('fsn_boatshop:floor:color:One', function(boatnum, col)
	boat_spots[boatnum]['boat']['color'][1] = col
	boat_spots[boatnum]['boat']['updated'] = false
	TriggerClientEvent('fsn_boatshop:floor:Updateboat', -1, boatnum, boat_spots[boatnum])
	print('Player('..source..') is updating '..boat_spots[boatnum]['boat']['model']..' color1 to '..col)
end)
RegisterServerEvent('fsn_boatshop:floor:color:Two')
AddEventHandler('fsn_boatshop:floor:color:Two', function(boatnum, col)
	boat_spots[boatnum]['boat']['color'][1] = col
	boat_spots[boatnum]['boat']['updated'] = false
	TriggerClientEvent('fsn_boatshop:floor:Updateboat', -1, boatnum, boat_spots[boatnum])
	print('Player('..source..') is updating '..boat_spots[boatnum]['boat']['model']..' color2 to '..col)
end)
RegisterServerEvent('fsn_boatshop:floor:commission')
AddEventHandler('fsn_boatshop:floor:commission', function(boatnum, amt)
	boat_spots[boatnum]['boat']['commission'] = amt
	boat_spots[boatnum]['boat']['updated'] = false
	TriggerClientEvent('fsn_boatshop:floor:Updateboat', -1, boatnum, boat_spots[boatnum])
	print('Player('..source..') is updating '..boat_spots[boatnum]['boat']['model']..' commission to '..amt)
end)
RegisterServerEvent('fsn_boatshop:floor:ChangeBoat')
AddEventHandler('fsn_boatshop:floor:ChangeBoat', function(boatnum, mdl)
	local newboat = getVehicleFromModel(mdl)
	boat_spots[boatnum]['boat']['model'] = newboat.model
	boat_spots[boatnum]['boat']['name'] = newboat.name
	boat_spots[boatnum]['boat']['buyprice'] = newboat.costs
	boat_spots[boatnum]['boat']['rentalprice'] = newboat.rentalprice
	boat_spots[boatnum]['boat']['updated'] = false
	TriggerClientEvent('fsn_boatshop:floor:Updateboat', -1, boatnum, boat_spots[boatnum])
	print('Player('..source..') is updating '..boat_spots[boatnum]['boat']['model']..' model to '..mdl)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You updated boat pos '..boatnum..' to '..mdl })
end)

