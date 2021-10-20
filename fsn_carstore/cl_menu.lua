local vehshop = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.9,
		y = 0.08,
		width = 0.2,
	height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Vehicles", description = ""},
				{name = "Motorcycles", description = ""},
				{name = "Bicycles", description = ""},
			}
		},
		["vehicles"] = {
			title = "VEHICLES",
			name = "vehicles",
			buttons = {
				{name = "Compacts", description = ''},
				{name = "Coupes", description = ''},
				{name = "Sedans", description = ''},
				{name = "Sports", description = ''},
				{name = "Sports Classics", description = ''},
				{name = "Super", description = ''},
				{name = "Muscle", description = ''},
				{name = "Off-Road", description = ''},
				{name = "SUVs", description = ''},
				{name = "Vans", description = ''},				
			}
		},
		["compacts"] = {
			title = "compacts",
			name = "compacts",
			buttons = {
				{name = "Blista", costs = 5200, description = {}, model = "blista"},
				{name = "Blista Compact", costs = 5500, description = {}, model = "blista2"},
				{name = "Brioso R/A", costs = 8000, description = {}, model = "brioso"},
				{name = "Dilettante", costs = 5000, description = {}, model = "Dilettante"},
				{name = "Issi 2 Convertible", costs = 10000, description = {}, model = "issi2"},
				{name = "Panto", costs = 8000, description = {}, model = "panto"},
				{name = "Prairie", costs = 20000, description = {}, model = "prairie"},
				{name = "Rhapsody", costs = 4000, description = {}, model = "rhapsody"},
			}
		},
		["coupes"] = {
			title = "coupes",
			name = "coupes",
			buttons = {
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
			}
		},
		["sports"] = {
			title = "sports",
			name = "sports",
			buttons = {
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
			}
		},
		["sportsclassics"] = {
			title = "sports classics",
			name = "sportsclassics",
			buttons = {
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
			}
		},
		["super"] = {
			title = "super",
			name = "super",
			buttons = {
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
			}
		},
		["muscle"] = {
			title = "muscle",
			name = "muscle",
			buttons = {
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
			}
		},
		["offroad"] = {
			title = "off-road",
			name = "off-road",
			buttons = {
				{name = "Bifta", costs = 45000, description = {}, model = "bifta"},
				{name = "Blazer", costs = 20000, description = {}, model = "blazer"},
				{name = "Blazer 3 (R)", costs = 25000, description = {}, model = "blazer3"},
				{name = "Brawler", costs = 50000, description = {}, model = "brawler"},
				{name = "Contender.", costs = 120000, description = {}, model = "contender"},
				{name = "Dubsta 6x6", costs = 105000, description = {}, model = "dubsta3"},
				{name = "Dune Buggy (R)", costs = 25000, description = {}, model = "dune"},
				{name = "Guardian", costs = 105000, description = {}, model = "guardian"},
				{name = "Kalahari", costs = 20000, description = {}, model = "Kalahari"},
				{name = "Rebel", costs = 28000, description = {}, model = "rebel2"},
				{name = "Sandking", costs = 68000, description = {}, model = "sandking"},
				{name = "Sadler", costs = 30000, description = {}, model = "sadler"},
				--{name = "Jeep Trailcat 707hp", costs = 100000, description = {}, model = "trailcat"}, -- Logan please check
				--{name = "The Liberator (R)", costs = 2500000, description = {}, model = "monster"},
				{name = "Trophy Truck (R)", costs =	 550000, description = {}, model = "trophytruck"},
				{name = "Merryweather Mesa", costs = 95000, description = {}, model = "mesa3"},

			}
		},
		["suvs"] = {
			title = "suvs",
			name = "suvs",
			buttons = {
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
			}
		},
		["vans"] = {
			title = "vans",
			name = "vans",
			buttons = {
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
				{name = "Slamvan", costs = 50000, description = {}, model = "slamvan"},
				{name = "Lost Slamvan", costs = 65000, description = {}, model = "slamvan2"},
				{name = "Slamvan Custom", costs = 95000, description = {}, model = "slamvan3"},
				{name = "Rumpo Custom", costs = 115000, description = {}, model = "rumpo3"},
				{name = "Surfer", costs = 5000, description = {}, model = "surfer"},
				{name = "Youga", costs = 11000, description = {}, model = "youga"},
			}
		},
		["sedans"] = {
			title = "sedans",
			name = "sedans",
			buttons = {
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
			}
		},
		["motorcycles"] = {
			title = "MOTORCYCLES",
			name = "motorcycles",
			buttons = {
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
			}
		},
		["bicycles"] = {
			title = "Bicycles",
			name = "bicycles",
			buttons = {
				{name = "BMX", costs = 400, description = {}, model = "bmx"},
				{name = "Cruiser", costs = 300, description = {}, model = "cruiser"},
				{name = "Fixter", costs = 450, description = {}, model = "fixter"},
				{name = "Scorcher MTB", costs = 1300, description = {}, model = "scorcher"},
				{name = "Whippet", costs = 1500, description = {}, model = "tribike"},
				{name = "Endurex Ex1", costs = 1750, description = {}, model = "tribike2"},
				{name = "TriCycles Torpedo", costs = 2000, description = {}, model = "tribike3"},
			}
		},
	}
}
local fakecar = {model = '', car = nil}
local vehshop_locations = {}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false
local ibought = ''

local function LocalPed()
return PlayerPedId()
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function IsPlayerInRangeOfVehshop()
return inrangeofvehshop
end

function ShowVehshopBlips(bool)
end

function f(n)
return n + 0.0001
end

function LocalPed()
return PlayerPedId()
end

function try(f, catch_f)
local status, exception = pcall(f)
if not status then
catch_f(exception)
end
end
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
local carIamChanging = 0
function OpenCreator(changingCar)
	carIamChanging = changingCar
	boughtcar = false
	local ped = LocalPed()
	local pos = {-37.41089630127,-1088.1712646484,25.990238189697,251.69311523438}
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end

local vehicle_price = 0
function CloseCreator()
	Citizen.CreateThread(function()
		local ped = LocalPed()
		if not boughtcar then
			local pos = {-34.02855682373, -1089.1179199219, 26.422239303589, 0.0}
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			local veh = GetVehiclePedIsUsing(ped)
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
			local pos = {-34.02855682373, -1089.1179199219, 26.422239303589, 0.0}--currentlocation.pos.outside
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
			
			TriggerServerEvent('fsn_carstore:floor:ChangeCar', carIamChanging, ibought)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)
end

function drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

function drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function DoesPlayerHaveVehicle(model,button,y,selected)
		local t = false
		--TODO:check if player own car
		if t then
			drawMenuRight("OWNED",vehshop.menu.x,y,selected)
		else
			drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
		end
end

local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				CloseCreator()
			else
				OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			drawTxt(vehshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "motorcycles" or vehshop.currentmenu == "bicycles" then
							DoesPlayerHaveVehicle(button.model,button,y,selected)
						else
						drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "motorcycles" or vehshop.currentmenu == "bicycles" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = {-37.41089630127,-1088.1712646484,25.990238189697,251.69311523438}
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								while not HasModelLoaded(hash) do
									Citizen.Wait(0)
									drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)

								end
								local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
								while not DoesEntityExist(veh) do
									Citizen.Wait(0)
									drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)
								end
								FreezeEntityPosition(veh,true)
								SetEntityInvincible(veh,true)
								SetVehicleDoorsLocked(veh,4)
								--SetEntityCollision(veh,false,false)
								TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
								for i = 0,24 do
									SetVehicleModKit(veh,0)
									RemoveVehicleMod(veh,i)
								end
								fakecar = { model = button.model, car = veh}
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if vehshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function ButtonSelected(button)
	local ped = PlayerPedId()
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Vehicles" then
			OpenMenu('vehicles')
		elseif btn == "Motorcycles" then
			OpenMenu('motorcycles')
		elseif btn == "Bicycles" then
			OpenMenu('bicycles')
		end
 elseif this == "vehicles" then
		if btn == "Sports" then
			OpenMenu('sports')
		elseif btn == "Sedans" then
			OpenMenu('sedans')
		elseif btn == "Compacts" then
			OpenMenu('compacts')
		elseif btn == "Coupes" then
			OpenMenu('coupes')
		elseif btn == "Sports Classics" then
			OpenMenu("sportsclassics")
		elseif btn == "Super" then
			OpenMenu('super')
		elseif btn == "Muscle" then
			OpenMenu('muscle')
		elseif btn == "Off-Road" then
			OpenMenu('offroad')
		elseif btn == "SUVs" then
			OpenMenu('suvs')
		elseif btn == "Vans" then
			OpenMenu('vans')
	    elseif btn == "Bicycles" then
			OpenMenu('bicycles')
			end
	elseif this == "compacts" or this == "coupes" or this == "sedans" or this == "sports" or this == "sportsclassics" or this == "super" or this == "muscle" or this == "offroad" or this == "suvs" or this == "vans" or this == "industrial" or this == "motorcycles" or this == "bicycles" then
		--if tonumber(exports.fsn_main:fsn_GetWallet()) >= button.costs then
			vehicle_price = button.costs
			boughtcar = true
			ibought = button.model
			--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
			CloseCreator()
		--else
 	  	--TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
		--end
	end
end

function OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "vehicles" then
		vehshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
	elseif menu == "bicycles"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end


function Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		CloseCreator()
	elseif vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "bicycles" or vehshop.currentmenu == "motorcycles" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		OpenMenu(vehshop.lastmenu)
	else
		OpenMenu(vehshop.lastmenu)
	end

end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	RemoveIpl('v_carshowroom')
	RemoveIpl('shutter_open')
	RemoveIpl('shutter_closed')
	RemoveIpl('shr_int')
	RemoveIpl('csr_inMission')
	RequestIpl('v_carshowroom')
	RequestIpl('shr_int')
	--RequestIpl('csr_inMission')
	RequestIpl('shutter_closed')
	--326 car blip 227 225
	ShowVehshopBlips(true)
	firstspawn = 1
end
end)
