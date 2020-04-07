local car_spots = {
	[1] =  { x = -38.25, y = -1104.18, z = 26.43, h = 14.46,  car = {} }, 
	[2] =  { x = -36.36, y = -1097.3, z = 26.43, h = 109.4,  car = {} }, 
	[3] =  { x = -43.11, y = -1095.02, z = 26.43, h = 67.77,  car = {} }, 
	[4] =  { x = -50.45, y = -1092.66, z = 26.43, h = 116.33,  car = {} }, 
	[5] =  { x = -56.24, y = -1094.33, z = 26.43, h = 157.08,  car = {} }, 
	[6] =  { x = -49.73, y = -1098.63, z = 26.43, h = 240.99,  car = {} }, 
	[7] =  { x = -45.58, y = -1101.4, z = 26.43, h = 287.3,  car = {} }, 
}

local vehicles = {
	{ -- compacts
		{name = "Blista", costs = 5200, description = {}, model = "blista"},
		{name = "Blista Compact", costs = 5500, description = {}, model = "blista2"},
		{name = "Brioso R/A", costs = 8000, description = {}, model = "brioso"},
		{name = "Dilettante", costs = 5000, description = {}, model = "Dilettante"},
		{name = "Issi 2 Convertible", costs = 10000, description = {}, model = "issi2"},
		{name = "Panto", costs = 8000, description = {}, model = "panto"},
		{name = "Prairie", costs = 20000, description = {}, model = "prairie"},
		{name = "Rhapsody", costs = 4000, description = {}, model = "rhapsody"},
	},
	{ -- coupes
		{name = "Cognoscenti Cabrio", costs = 125000, description = {}, model = "cogcabrio"},
		{name = "Exemplar", costs = 115000, description = {}, model = "exemplar"},
		{name = "Felon", costs = 105000, description = {}, model = "felon"},
		{name = "Felon 2", costs = 115000, description = {}, model = "felon2"},
		{name = "F620", costs = 100000, description = {}, model = "f620"},
		{name = "Jackal", costs = 90000, description = {}, model = "jackal"},
		{name = "Oracle", costs = 40000, description = {}, model = "oracle"},
		{name = "Oracle 2", costs = 50000, description = {}, model = "oracle2"},
		{name = "Sentinel", costs = 60000, description = {}, model = "sentinel"},
		{name = "Sentinel XS", costs = 65000, description = {}, model = "sentinel2"},
		{name = "Windsor", costs = 130000, description = {}, model = "windsor"},
		{name = "Windsor Convertible", costs = 145000, description = {}, model = "windsor2"},
		{name = "Zion", costs = 40000, description = {}, model = "zion"},
		{name = "Zion 2 ST", costs = 65000, description = {}, model = "zion2"},
		{name = "Futo", costs = 30000, description = {}, model = "futo"},
	},
	{ -- sports
		{name = "Alpha", costs = 40000, description = {}, model = "alpha"},
		{name = "Bestia GTS", costs = 135000, description = {}, model = "bestiagts"},
		{name = "Buffalo", costs = 50000, description = {}, model = "buffalo"},
		{name = "Buffalo S", costs = 60000, description = {}, model = "buffalo2"},
		{name = "Carbonizzare", costs = 240000, description = {}, model = "carbonizzare"},
		{name = "Comet", costs = 175000, description = {}, model = "comet2"},
		{name = "Comet SR", costs = 175000, description = {}, model = "comet5"},
		{name = "Comet Retro", costs = 185000, description = {}, model = "comet3"},
		{name = "Coquette", costs = 175000, description = {}, model = "coquette"},
		{name = "Drift Tampa", costs = 695000, description = {}, model = "tampa2"},
		{name = "Elegy", costs = 130000, description = {}, model = "elegy2"},
		{name = "Elegy Sport", costs = 165000, description = {}, model = "elegy"},
		{name = "Feltzer", costs = 155000, description = {}, model = "feltzer2"},
		{name = "Flash GT", costs = 175000, description = {}, model = "flashgt"},
		{name = "Furore GT", costs = 145000, description = {}, model = "furoregt"},
		{name = "Fusilade", costs = 69000, description = {}, model = "fusilade"},
		{name = "Itali GTO", costs = 795000, description = {}, model = "italigto"},
		{name = "Jester", costs = 200000, description = {}, model = "jester"},
		{name = "Jester(Racecar)", costs = 275000, description = {}, model = "jester2"},
		{name = "Kuruma", costs = 135000, description = {}, model = "kuruma"},
		{name = "Lynx", costs = 155000, description = {}, model = "lynx"},
		{name = "Massacro", costs = 140000, description = {}, model = "massacro"},
		{name = "Massacro 2 Sports", costs = 155000, description = {}, model = "massacro2"},
		{name = "Neon", costs = 145000, description = {}, model = "neon"},
		{name = "NineF", costs = 140000, description = {}, model = "ninef"},
		{name = "NineF Convertible", costs = 145000, description = {}, model = "ninef2"},
		{name = "Omnis", costs = 145000, description = {}, model = "omnis"},
		{name = "Penumbra", costs = 50000, description = {}, model = "penumbra"},
		{name = "Rapid GT", costs = 155000, description = {}, model = "rapidgt"},
		{name = "Rapid GT Convertible", costs = 175000, description = {}, model = "rapidgt2"},
		{name = "Raiden", costs = 165000, description = {}, model = "raiden"},
		{name = "Retinue", costs = 25000, description = {}, model = "retinue"},
		{name = "Revolter", costs = 135000, description = {}, model = "revolter"},
		{name = "Ruston", costs = 155000, description = {}, model = "ruston"},
		{name = "Seven-70", costs = 175000, description = {}, model = "seven70"},
		{name = "Sentinel Sport", costs = 150000, description = {}, model = "sentinel3"},
		{name = "Schlagen", costs = 210000, description = {}, model = "schlagen"},
		{name = "Specter", costs = 180000, description = {}, model = "specter"},
		{name = "Surano", costs = 135000, description = {}, model = "surano"},
		{name = "Tropos", costs = 145000, description = {}, model = "tropos"},
		{name = "Verlierer", costs = 110000, description = {}, model = "verlierer2"},
	},
	{ -- sports classics
		{name = "B Type", costs = 50000, description = {}, model = "btype"},
		{name = "Roseavelt", costs = 120000, description = {}, model = "btype2"},
		{name = "B Type 3", costs = 125000, description = {}, model = "btype3"},
		{name = "Casco", costs = 120000, description = {}, model = "casco"},
		{name = "Coquette Classic", costs = 125000, description = {}, model = "coquette2"},
		{name = "Coquette", costs = 125000, description = {}, model = "coquette3"},
		{name = "Hermes", costs = 99000, description = {}, model = "hermes"},
		{name = "JB 700", costs = 130000, description = {}, model = "jb700"},
		{name = "Mamba Sports", costs = 135000, description = {}, model = "mamba"},
		{name = "Pigalle", costs = 55000, description = {}, model = "pigalle"},
		{name = "RapidGT Retro", costs = 120000, description = {}, model = "rapidgt3"},
		{name = "Stinger", costs = 105000, description = {}, model = "stinger"},
		{name = "Stinger GT", costs = 105000, description = {}, model = "stingergt"},
		{name = "Feltzer Classic", costs = 135000, description = {}, model = "feltzer3"},
		{name = "Tornado Custom", costs = 145000, description = {}, model = "tornado5"},
		{name = "Tornado Rat Rod", costs = 145000, description = {}, model = "tornado6"},
		{name = "Z-Type", costs = 125000, description = {}, model = "ztype"},
		{name = "z190", costs = 45000, description = {}, model = "z190"},
	},
	{ -- super
		{name = "Adder", costs = 6000000, description = {}, model = "adder"},
		{name = "Banshee 900R", costs = 5500000, description = {}, model = "banshee2"},
		{name = "Bullet", costs = 11000000, description = {}, model = "bullet"},
		{name = "Cheetah", costs = 5000000, description = {}, model = "cheetah"},
		{name = "Entity XF", costs = 5950000, description = {}, model = "entityxf"},
		{name = "Sheava", costs = 1495000, description = {}, model = "sheava"},
		{name = "Banshee", costs = 200000, description = {}, model = "banshee"},
		{name = "FMJ", costs = 6350000, description = {}, model = "fmj"},
		{name = "Infernus", costs = 4400000, description = {}, model = "infernus"},
		{name = "Osiris", costs = 7000000, description = {}, model = "osiris"},
		{name = "Pariah", costs = 750000, description = {}, model = "pariah"},
		{name = "Pfister 811", costs = 750000, description = {}, model = "pfister811"},
		{name = "Reaper", costs = 1100000, description = {}, model = "reaper"},
		{name = "SC1", costs = 2500000, description = {}, model = "sc1"},
		{name = "Sultan RS", costs = 325000, description = {}, model = "sultanrs"},
		{name = "T20", costs = 6700000, description = {}, model = "t20"},
		{name = "Turismo R", costs = 7500000, description = {}, model = "turismor"},
		{name = "Tempesta", costs = 5500000, description = {}, model = "tempesta"},
		{name = "Tyrus", costs = 1550000, description = {}, model = "tyrus"},
		{name = "Vacca", costs = 1400000, description = {}, model = "vacca"},
		{name = "Voltic", costs = 1005000, description = {}, model = "voltic"},
		{name = "X80 Proto", costs = 15000000, description = {}, model = "prototipo"},
		{name = "Zentorno", costs = 7725000, description = {}, model = "zentorno"},
	},
	{ -- muscle
		{name = "Blade", costs = 16000, description = {}, model = "blade"},
		{name = "Buccaneer", costs = 70000, description = {}, model = "buccaneer"},
		{name = "Chino", costs = 65000, description = {}, model = "chino"},
		{name = "Chino Custom", costs = 69000, description = {}, model = "chino2"},
		{name = "Deviant", costs = 100000, description = {}, model = "deviant"},
		{name = "Dominator", costs = 100000, description = {}, model = "dominator"},
		{name = "Dominator GTX", costs = 130000, description = {}, model = "dominator3"},
		{name = "Dukes", costs = 70000, description = {}, model = "dukes"},
		{name = "Ellie", costs = 85000, description = {}, model = "ellie"},
		{name = "Gauntlet", costs = 110000, description = {}, model = "gauntlet"},
		{name = "Gauntlet 2", costs = 125000, description = {}, model = "gauntlet2"},
		{name = "Hotknife", costs = 90000, description = {}, model = "hotknife"},
		{name = "Faction", costs = 55000, description = {}, model = "faction"},
		{name = "Nightshade", costs = 130000, description = {}, model = "nightshade"},
		{name = "Picador", costs = 19000, description = {}, model = "picador"}, 
		{name = "Rat Loader 2", costs = 40000, description = {}, model = "RatLoader2"},
		{name = "Ruiner", costs = 19000, description = {}, model = "ruiner"},
		{name = "Sabre GT", costs = 80000, description = {}, model = "sabregt"},
		{name = "Tulip", costs = 45000, description = {}, model = "tulip"},
		{name = "Tampa", costs = 25000, description = {}, model = "tampa"},
		{name = "Virgo", costs = 35000, description = {}, model = "virgo"},
		{name = "Vigero", costs = 33000, description = {}, model = "vigero"},
		{name = "Voodoo", costs = 63000, description = {}, model = "voodoo"},
		{name = "Voodoo Custom", costs = 67000, description = {}, model = "voodoo2"},
		{name = "Yosemite", costs = 135000, description = {}, model = "yosemite"},
	},
	{ -- off-road
		{name = "Bifta", costs = 45000, description = {}, model = "bifta"},
		{name = "Blazer", costs = 20000, description = {}, model = "blazer"},
		{name = "Blazer 3 (R)", costs = 25000, description = {}, model = "blazer3"},
		{name = "Brawler", costs = 50000, description = {}, model = "brawler"},
		{name = "Dubsta 6x6", costs = 105000, description = {}, model = "dubsta3"},
		{name = "Contender.", costs = 115000, description = {}, model = "contender"},
		{name = "Dune Buggy (R)", costs = 25000, description = {}, model = "dune"},
		{name = "Guardian", costs = 105000, description = {}, model = "guardian"},
		{name = "Kalahari", costs = 20000, description = {}, model = "Kalahari"},
		{name = "Rebel", costs = 28000, description = {}, model = "rebel2"},
		{name = "Sandking", costs = 68000, description = {}, model = "sandking"},
		{name = "Sadler", costs = 30000, description = {}, model = "sadler"},
		{name = "Trophy Truck (R)", costs =	 550000, description = {}, model = "trophytruck"},
		{name = "Merryweather Mesa", costs = 95000, description = {}, model = "mesa3"},
	},
	{ -- suvs
		{name = "Baller", costs = 65000, description = {}, model = "baller"},
		{name = "Baller LE", costs = 95000, description = {}, model = "baller3"},
		{name = "Baller LE LWB", costs = 110000, description = {}, model = "baller4"},
		{name = "BeeJay", costs = 25000, description = {}, model = "BJXL"},
		{name = "Cavalcade", costs = 50000, description = {}, model = "cavalcade"},
		{name = "Cavalcade 2", costs = 60000, description = {}, model = "cavalcade2"},
		{name = "Dubsta", costs = 315000, description = {}, model = "dubsta"},
		{name = "FQ2", costs = 9000, description = {}, model = "fq2"},
		{name = "Granger", costs = 25000, description = {}, model = "granger"},
		{name = "Huntley S", costs = 125000, description = {}, model = "huntley"},
		{name = "Landstalker", costs = 50000, description = {}, model = "landstalker"},
		{name = "Patriot", costs = 25000, description = {}, model = "patriot"},
		{name = "Patriot Stretch", costs = 60000, description = {}, model = "patriot2"},
		{name = "Radius", costs = 30000, description = {}, model = "radi"},
		{name = "Rocoto", costs = 55000, description = {}, model = "rocoto"},
		{name = "Seminole", costs = 40000, description = {}, model = "seminole"},
		{name = "XLS", costs = 105000, description = {}, model = "xls"},
	},
	{ -- vans
		{name = "Bison", costs = 30000, description = {}, model = "bison"},
		{name = "Bobcat XL", costs = 23000, description = {}, model = "bobcatxl"},
		{name = "Brute Camper", costs = 30000, description = {}, model = "camper"},
		{name = "Gang Burrito", costs = 45000, description = {}, model = "gburrito"},
		{name = "Gang Burrito 2", costs = 50000, description = {}, model = "gburrito2"},
		{name = "Journey", costs = 25000, description = {}, model = "journey"},
		{name = "Minivan", costs = 10000, description = {}, model = "minivan"},
		{name = "Minivan Custom", costs = 15000, description = {}, model = "minivan2"},
		{name = "Paradise", costs = 15000, description = {}, model = "paradise"},
		{name = "Rumpo", costs = 12000, description = {}, model = "rumpo"},
		{name = "Rumpo Custom", costs = 115000, description = {}, model = "rumpo3"},
		{name = "Slamvan", costs = 50000, description = {}, model = "slamvan"},
		{name = "Lost Slamvan", costs = 65000, description = {}, model = "slamvan2"},
		{name = "Slamvan Custom", costs = 95000, description = {}, model = "slamvan3"},
		{name = "Surfer", costs = 5000, description = {}, model = "surfer"},
		{name = "Youga", costs = 11000, description = {}, model = "youga"},
	},
	{ -- sedans
		{name = "Asea", costs = 25000, description = {}, model = "asea"},
		{name = "Asterope", costs = 30000, description = {}, model = "asterope"},
		{name = "Cognoscenti", costs = 125000, description = {}, model = "cognoscenti"},
		{name = "Cognoscenti 55", costs = 110000, description = {}, model = "cog55"},
		{name = "Faction Custom DONK", costs = 85000, description = {}, model = "faction3"},
		{name = "Fugitive", costs = 24000, description = {}, model = "fugitive"},
		{name = "Glendale", costs = 8000, description = {}, model = "glendale"},
		{name = "Ingot", costs = 10000, description = {}, model = "ingot"},
		{name = "Intruder", costs = 15000, description = {}, model = "intruder"},
		{name = "Premier", costs = 10000, description = {}, model = "premier"},
		{name = "Primo", costs = 9000, description = {}, model = "primo"},
		{name = "Primo Custom", costs = 9500, description = {}, model = "primo2"},
		{name = "Regina", costs = 8000, description = {}, model = "regina"},
		{name = "Schafter 2", costs = 50000, description = {}, model = "schafter2"},
		{name = "Schafter V12", costs = 215000, description = {}, model = "schafter3"},
		{name = "Stanier", costs = 13000, description = {}, model = "stanier"},
		{name = "Stratum", costs = 50000, description = {}, model = "stratum"},
		{name = "Stretch", costs = 65000, description = {}, model = "stretch"},
		{name = "Sultan", costs = 50000, description = {}, model = "sultan"},
		{name = "Super D", costs = 55000, description = {}, model = "superd"},
		{name = "Surge", costs = 20000, description = {}, model = "surge"},
		{name = "Tornado", costs = 10000, description = {}, model = "tornado"},
		{name = "Tailgater", costs = 35000, description = {}, model = "tailgater"},
		{name = "Warrener", costs = 15000, description = {}, model = "warrener"},
		{name = "Washington", costs = 27000, description = {}, model = "washington"},
	},
	{ -- motorcycles
		{name = "Akuma", costs = 15000, description = {}, model = "AKUMA"},
		{name = "Avarus", costs = 25000, description = {}, model = "avarus"},
		{name = "Bagger", costs = 20000, description = {}, model = "bagger"},
		{name = "Bati 801", costs = 18000, description = {}, model = "bati"},
		{name = "Bati 801RR", costs = 28000, description = {}, model = "bati2"},
		{name = "BF400", costs = 70000, description = {}, model = "bf400"},
		{name = "Carbon RS", costs = 21000, description = {}, model = "carbonrs"},
		{name = "Cliffhanger", costs = 70000, description = {}, model = "cliffhanger"},
		{name = "Daemon", costs = 20500, description = {}, model = "daemon"},
		{name = "Double T", costs = 26000, description = {}, model = "double"},
		{name = "Enduro", costs = 30000, description = {}, model = "enduro"},
		{name = "Faggio 2", costs = 1500, description = {}, model = "faggio2"},
		{name = "Gargoyle", costs = 18000, description = {}, model = "gargoyle"},
		{name = "Hakuchou", costs = 32000, description = {}, model = "hakuchou"},
		{name = "Hexer", costs = 15000, description = {}, model = "hexer"},
		{name = "Innovation", costs = 27000, description = {}, model = "innovation"},
		{name = "Lectro", costs = 13000, description = {}, model = "lectro"},
		{name = "Nemesis", costs = 10000, description = {}, model = "nemesis"},
		{name = "Nightblade", costs = 32000, description = {}, model = "nightblade"},
		{name = "PCJ-600", costs = 24999, description = {}, model = "pcj"},
		{name = "Rat Bike", costs = 19000, description = {}, model = "ratbike"},
		{name = "Ruffian", costs = 15000, description = {}, model = "ruffian"},
		{name = "Sanchez", costs = 20000, description = {}, model = "sanchez"},
		{name = "Sanctus", costs = 60000, description = {}, model = "sanctus"},
		{name = "Sovereign", costs = 28000, description = {}, model = "sovereign"},
		{name = "Thrust", costs = 20000, description = {}, model = "thrust"},
		{name = "Vader", costs = 18000, description = {}, model = "vader"},
		{name = "Vindicator", costs = 10000, description = {}, model = "vindicator"},
		{name = "Wolfsbane", costs = 23000, description = {}, model = "wolfsbane"},
		{name = "Zombie Chopper", costs = 36000, description = {}, model = "zombieb"},
		{name = "Zombie Bobber", costs = 36000, description = {}, model = "zombiea"},
	},
	{ -- bicycles
		{name = "BMX", costs = 400, description = {}, model = "bmx"},
		{name = "Cruiser", costs = 300, description = {}, model = "cruiser"},
		{name = "Fixter", costs = 450, description = {}, model = "fixter"},
		{name = "Scorcher MTB", costs = 1300, description = {}, model = "scorcher"},
		{name = "Whippet", costs = 1500, description = {}, model = "tribike"},
		{name = "Endurex Ex1", costs = 1750, description = {}, model = "tribike2"},
		{name = "TriCycles Torpedo", costs = 2000, description = {}, model = "tribike3"},
	}
}

RegisterServerEvent('fsn_carstore:floor:Request')
AddEventHandler('fsn_carstore:floor:Request', function()
	local i = 1
	for k, v in pairs(car_spots) do
		if not v.car.model then
			local car = vehicles[i][math.random(1, #vehicles[i])]
			-- no vehicle is set, adding default value!
			v.car = { model = car.model, name = car.name, buyprice = car.costs, commission = 15, color = {math.random(1, 159),math.random(1,159)}, object = false, updated = false }
			print('setting car '..k..' to '..car.model)
			i = i+1
		end
	end
	
	TriggerClientEvent('fsn_carstore:floor:Update', source, car_spots)
end)

function WorksAtStore(id)
	return exports["fsn_jobs"]:isPlayerClockedInWhitelist(id, 1)
end
AddEventHandler('chatMessage', function(source, auth, msg)
	local split = Util.SplitString(msg, ' ')
	if WorksAtStore(source) then
		if split[1] == '/comm' then
			if tonumber(split[2]) and tonumber(split[2]) <= 30 and tonumber(split[2]) > 0 then
				TriggerClientEvent('fsn_carstore:floor:commission', source, tonumber(split[2]))
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Usage: /comm {number: 0-30}' })
			end
		end
		if split[1] == '/color1' then
			if tonumber(split[2]) and tonumber(split[2]) <= 159 and tonumber(split[2]) > 0 then
				TriggerClientEvent('fsn_carstore:floor:color:One', source, tonumber(split[2]))
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Usage: /color1 {number: 0-159}' })
			end
		end
		if split[1] == '/color2' then
			if tonumber(split[2]) and tonumber(split[2]) <= 159 and tonumber(split[2]) > 0 then
				TriggerClientEvent('fsn_carstore:floor:color:Two', source, tonumber(split[2]))
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Usage: /color2 {number: 0-159}' })
			end
		end
		if split[1] == '/testdrive' then
			if split[2] then
				if split[2] == 'end' then
					TriggerClientEvent('fsn_carstore:testdrive:end', source)
				end
			else
				TriggerClientEvent('fsn_carstore:testdrive:start', source)
			end
		end
	end
end)

function getVehicleFromModel(mdl)
	for k, v in pairs(vehicles) do
		for key, car in pairs(v) do
			if car.model == mdl then
				return car
			end
		end
	end
end

RegisterServerEvent('fsn_carstore:floor:color:One')
AddEventHandler('fsn_carstore:floor:color:One', function(carnum, col)
	car_spots[carnum]['car']['color'][1] = col
	car_spots[carnum]['car']['updated'] = false
	TriggerClientEvent('fsn_carstore:floor:UpdateCar', -1, carnum, car_spots[carnum])
	print('Player('..source..') is updating '..car_spots[carnum]['car']['model']..' color1 to '..col)
end)
RegisterServerEvent('fsn_carstore:floor:color:Two')
AddEventHandler('fsn_carstore:floor:color:Two', function(carnum, col)
	car_spots[carnum]['car']['color'][1] = col
	car_spots[carnum]['car']['updated'] = false
	TriggerClientEvent('fsn_carstore:floor:UpdateCar', -1, carnum, car_spots[carnum])
	print('Player('..source..') is updating '..car_spots[carnum]['car']['model']..' color2 to '..col)
end)
RegisterServerEvent('fsn_carstore:floor:commission')
AddEventHandler('fsn_carstore:floor:commission', function(carnum, amt)
	car_spots[carnum]['car']['commission'] = amt
	car_spots[carnum]['car']['updated'] = false
	TriggerClientEvent('fsn_carstore:floor:UpdateCar', -1, carnum, car_spots[carnum])
	print('Player('..source..') is updating '..car_spots[carnum]['car']['model']..' commission to '..amt)
end)
RegisterServerEvent('fsn_carstore:floor:ChangeCar')
AddEventHandler('fsn_carstore:floor:ChangeCar', function(carnum, mdl)
	local newCar = getVehicleFromModel(mdl)
	car_spots[carnum]['car']['model'] = newCar.model
	car_spots[carnum]['car']['name'] = newCar.name
	car_spots[carnum]['car']['buyprice'] = newCar.costs
	car_spots[carnum]['car']['updated'] = false
	TriggerClientEvent('fsn_carstore:floor:UpdateCar', -1, carnum, car_spots[carnum])
	print('Player('..source..') is updating '..car_spots[carnum]['car']['model']..' model to '..mdl)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You updated car pos '..carnum..' to '..mdl })
end)

