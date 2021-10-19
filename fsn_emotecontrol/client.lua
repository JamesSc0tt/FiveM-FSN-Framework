Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
-------------------------------------------------------------------
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, true)
end

Menu = {}
Menu.GUI = {}
Menu.TitleGUI = {}
Menu.buttonCount = 0
Menu.titleCount = 0
Menu.selection = 0
Menu.hidden = true
MenuTitle = "Menu"

-------------------
posXMenu = 0.1
posYMenu = 0.03
width = 0.15
height = 0.03

posXMenuTitle = 0.1
posYMenuTitle = 0.03
widthMenuTitle = 0.15
heightMenuTitle = 0.03
-------------------

function Menu.addTitle(name)

	local yoffset = 0.1
	local xoffset = 0

	local xmin = posXMenuTitle
	local ymin = posYMenuTitle
	local xmax = widthMenuTitle
	local ymax = heightMenuTitle


	Menu.TitleGUI[Menu.titleCount +1] = {}
	Menu.TitleGUI[Menu.titleCount +1]["name"] = name
	Menu.TitleGUI[Menu.titleCount+1]["xmin"] = xmin + xoffset
	Menu.TitleGUI[Menu.titleCount+1]["ymin"] = ymin * (Menu.titleCount + 0.01) +yoffset
	Menu.TitleGUI[Menu.titleCount+1]["xmax"] = xmax
	Menu.TitleGUI[Menu.titleCount+1]["ymax"] = ymax
	Menu.titleCount = Menu.titleCount+1
end

function Menu.addButton(name, func,args)

	local yoffset = 0.1
	local xoffset = 0

	local xmin = posXMenu
	local ymin = posYMenu
	local xmax = width
	local ymax = height


	Menu.GUI[Menu.buttonCount +1] = {}
	Menu.GUI[Menu.buttonCount +1]["name"] = name
	Menu.GUI[Menu.buttonCount+1]["func"] = func
	Menu.GUI[Menu.buttonCount+1]["args"] = args
	Menu.GUI[Menu.buttonCount+1]["active"] = false
	Menu.GUI[Menu.buttonCount+1]["xmin"] = xmin + xoffset
	Menu.GUI[Menu.buttonCount+1]["ymin"] = ymin * (Menu.buttonCount + 0.01) +yoffset
	Menu.GUI[Menu.buttonCount+1]["xmax"] = xmax
	Menu.GUI[Menu.buttonCount+1]["ymax"] = ymax
	Menu.buttonCount = Menu.buttonCount+1
end


function Menu.updateSelection()
	if IsControlJustPressed(1, Keys["DOWN"])  then
		if(Menu.selection < Menu.buttonCount -1  )then
			Menu.selection = Menu.selection +1
		else
			Menu.selection = 0
		end
	elseif IsControlJustPressed(1, Keys["TOP"]) then
		if(Menu.selection > 0)then
			Menu.selection = Menu.selection -1
		else
			Menu.selection = Menu.buttonCount-1
		end
	elseif IsControlJustPressed(1, Keys["NENTER"])  then
			MenuCallFunction(Menu.GUI[Menu.selection +1]["func"], Menu.GUI[Menu.selection +1]["args"])
	end
	local iterator = 0
	for id, settings in ipairs(Menu.GUI) do
		Menu.GUI[id]["active"] = false
		if(iterator == Menu.selection ) then
			Menu.GUI[iterator +1]["active"] = true
		end
		iterator = iterator +1
	end
end

function Menu.renderGUI()
	if not Menu.hidden then
		Menu.renderTitle()
		Menu.renderButtons()
		Menu.updateSelection()
	end
end

function Menu.renderBox(xMin,xMax,yMin,yMax,color1,color2,color3,color4)
	DrawRect(xMin, yMin,xMax, yMax, color1, color2, color3, color4);
end

function Menu.renderTitle()
	local yoffset = 0.3
	local xoffset = 0

	local xmin = posXMenuTitle
	local ymin = posYMenuTitle
	local xmax = widthMenuTitle
	local ymax = heightMenuTitle
	for id, settings in pairs(Menu.TitleGUI) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GetScreenResolution(0, 0)
		boxColor = {0,0,0,255}

		SetTextFont(0)
		SetTextScale(0.0,0.35)
		SetTextColour(255, 255, 255, 255)
		SetTextCentre(true)
		SetTextDropShadow(0, 0, 0, 0, 0)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING")
		AddTextComponentString(string.upper(settings["name"]))
		DrawText(settings["xmin"], (settings["ymin"] - heightMenuTitle - 0.0125))
		Menu.renderBox(settings["xmin"] ,settings["xmax"], settings["ymin"] - heightMenuTitle, settings["ymax"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
	end
end

function Menu.renderButtons()

	for id, settings in pairs(Menu.GUI) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GetScreenResolution(0, 0)
		boxColor = {0,0,0,150}

		if(settings["active"]) then
			boxColor = {0,255,255,255}
		end
		SetTextFont(0)
		SetTextScale(0.0,0.35)
		SetTextColour(255, 255, 255, 255)
		SetTextCentre(true)
		SetTextDropShadow(0, 0, 0, 0, 0)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING")
		AddTextComponentString(settings["name"])
		DrawText(settings["xmin"], (settings["ymin"] - 0.0125 ))
		Menu.renderBox(settings["xmin"] ,settings["xmax"], settings["ymin"], settings["ymax"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
	 end
end


--------------------------------------------------------------------------------------------------------------------

function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.titleCount = 0
	Menu.selection = 0
end

function MenuCallFunction(fnc, arg)
	_G[fnc](arg)
end

--------------------------------------------------------------------------------------------------------------------
function NameOfMenu()
	ClearMenu()
	Menu.addTitle("Animations")
	Menu.addButton("Stop animation","stopAnim",nil)
	Menu.addButton("Scenarios Part 1","scenarios1",nil)
	Menu.addButton("Scenarios Part 2","scenarios2",nil)
	Menu.addButton("Scenarios Part 3","scenarios3",nil)
	Menu.addButton("Job's Scenarios","scenarios4",nil)
	Menu.addButton("Friendly","friendly",nil)
	Menu.addButton("Animations","animations",nil)
	Menu.addButton("Male Dances","maledances",nil)
	Menu.addButton("Female Dances","femdances",nil)
	Menu.addButton("Sit","sit",nil)
	Menu.addButton("Sleep","sleepanims",nil)
	Menu.addButton("Fitness","fitness",nil)
	Menu.addButton("Surrender","scared",nil)
	Menu.addButton("Others","others",nil)

	-- ...
end


function scenarios1()
	ClearMenu()
	Menu.addTitle("Scenarios")
	Menu.addButton("Binoculars","scenarioPlayer","WORLD_HUMAN_BINOCULARS")
	Menu.addButton("Slumped","scenarioPlayer","WORLD_HUMAN_BUM_SLUMPED")
	Menu.addButton("Bummed","scenarioPlayer","WORLD_HUMAN_BUM_STANDING")
	Menu.addButton("Cheering","scenarioPlayer","WORLD_HUMAN_CHEERING")
	Menu.addButton("Drinking","scenarioPlayer","WORLD_HUMAN_DRINKING")
	Menu.addButton("Use Map","scenarioPlayer","WORLD_HUMAN_TOURIST_MAP")
	Menu.addButton("Take Picture","scenarioPlayer","WORLD_HUMAN_TOURIST_MOBILE")
	Menu.addButton("Record","scenarioPlayer","WORLD_HUMAN_MOBILE_FILM_SHOCKING")
	Menu.addButton("Call","scenarioPlayer","WORLD_HUMAN_STAND_MOBILE")
	Menu.addButton("Text","scenarioPlayer","WORLD_HUMAN_STAND_MOBILE_UPRIGHT")
	Menu.addButton("Phone Call","pc",nil)
	Menu.addButton("Guard Idles","scenarioPlayer","WORLD_HUMAN_GUARD_STAND")
	Menu.addButton("Hang Out","scenarioPlayer","WORLD_HUMAN_HANG_OUT_STREET")
	Menu.addButton("Smoking","scenarioPlayer","WORLD_HUMAN_SMOKING")
	Menu.addButton("Smoking Pots","scenarioPlayer","WORLD_HUMAN_SMOKING_POT")
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
	-- ...
end

function scenarios2()
	ClearMenu()
	Menu.addTitle("Scenarios")
	Menu.addButton("Sunbathe","scenarioPlayer","WORLD_HUMAN_SUNBATHE")
	Menu.addButton("Sunbathe on back","scenarioPlayer","WORLD_HUMAN_SUNBATHE_BACK")
	Menu.addButton("Random Yoga Position","scenarioPlayer","WORLD_HUMAN_YOGA")
	Menu.addButton("Jogging","scenarioPlayer","WORLD_HUMAN_JOG_STANDING")
	Menu.addButton("Leaning","scenarioPlayer","WORLD_HUMAN_LEANING")
	Menu.addButton("Cleaning","scenarioPlayer","WORLD_HUMAN_MAID_CLEAN")
	Menu.addButton("Flexing","scenarioPlayer","WORLD_HUMAN_MUSCLE_FLEX")
	Menu.addButton("Partying","scenarioPlayer","WORLD_HUMAN_PARTYING")
	--Menu.addButton("Free Weights","scenarioPlayer","WORLD_HUMAN_MUSCLE_FREE_WEIGHTS")
	Menu.addButton("Sit","scenarioPlayer","WORLD_HUMAN_PICNIC")
	Menu.addButton("High Class Idles","scenarioPlayer","WORLD_HUMAN_PROSTITUTE_HIGH_CLASS")
	Menu.addButton("Low Class Idles","scenarioPlayer","WORLD_HUMAN_PROSTITUTE_LOW_CLASS")
	Menu.addButton("Impatient","scenarioPlayer","WORLD_HUMAN_STAND_IMPATIENT")
	Menu.addButton("Impatient 2","scenarioPlayer","WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT")
	Menu.addButton("Impatient 3","scenarioPlayer","PROP_HUMAN_STAND_IMPATIENT")
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
end

function scenarios4()
	ClearMenu()
	Menu.addTitle("Scenarios")
	Menu.addButton("Cop Idles","scenarioPlayer","WORLD_HUMAN_COP_IDLES")
	Menu.addButton("Write on Notepad","scenarioPlayer","CODE_HUMAN_MEDIC_TIME_OF_DEATH")
	Menu.addButton("CPR","cpr",nil)
	Menu.addButton("CPR2","cpr2",nil)
	--Menu.addButton("Drilling","scenarioPlayer","WORLD_HUMAN_CONST_DRILL")
	--Menu.addButton("Hammering","scenarioPlayer","WORLD_HUMAN_HAMMERING")
	--Menu.addButton("Welding","scenarioPlayer","WORLD_HUMAN_WELDING")
	--Menu.addButton("Fishing","scenarioPlayer","WORLD_HUMAN_STAND_FISHING")
	Menu.addButton("Human Statue","scenarioPlayer","WORLD_HUMAN_HUMAN_STATUE")
	--Menu.addButton("Janitor","scenarioPlayer","WORLD_HUMAN_JANITOR")
	--Menu.addButton("Gardener","scenarioPlayer","WORLD_HUMAN_GARDENER_PLANT")
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
end

function scenarios3()
	ClearMenu()
	Menu.addTitle("Scenarios")
	Menu.addButton("Bum Rail","scenarioPlayer","PROP_HUMAN_BUM_SHOPPING_CART")
	Menu.addButton("Chin Ups","scenarioPlayer","PROP_HUMAN_MUSCLE_CHIN_UPS")
	Menu.addButton("Bench Press","scenarioPlayer","PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS")
	Menu.addButton("Sunlounger","scenarioPlayer","PROP_HUMAN_SEAT_SUNLOUNGER")
	Menu.addButton("Kneel","scenarioPlayer","CODE_HUMAN_MEDIC_KNEEL")
	Menu.addButton("Fast Kneel","scenarioPlayer","CODE_HUMAN_MEDIC_TEND_TO_DEAD")
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
end

function scenarioPlayer(scenario)
local lPed = PlayerPedId()
TaskStartScenarioInPlace(lPed, scenario, 0, 1)
end

RegisterNetEvent('fsn_emotecontrol:play')
AddEventHandler('fsn_emotecontrol:play', function(type, dict, anim)
	if type == 'scenario' then
		scenarioPlayer(dict)
	elseif type == 'anim' then
		animPlayer(dict, anim)
	elseif type == 'halfanim' then
		halfanimPlayer(dict, anim)
	end
end)

function friendly()
	ClearMenu()
	Menu.addTitle("Friendly")
	Menu.addButton("Wave 1","wave1",nil)
	Menu.addButton("Wave 2","wave2",nil)
	Menu.addButton("Hug 1","huga",nil)
	Menu.addButton("Hug 2","hugb",nil)
	Menu.addButton("Kiss 1","kissa",nil)
	Menu.addButton("Kiss 2","kissb",nil)
	Menu.addButton("Pet Doggo","petsteve",nil)
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
	-- ...
end

function wave1()
halfanimPlayer("random@car_thief@victimpoints_ig_3", "arms_waving")
end

function wave2()
halfanimPlayer("random@gang_intimidation@", "001445_01_gangintimidation_1_female_idle_b")
end

function huga()
animPlayer("mp_ped_interaction", "hugs_guy_a")
end

function hugb()
animPlayer("mp_ped_interaction", "hugs_guy_b")
end

function kissa()
animPlayer("mp_ped_interaction", "kisses_guy_a")
end

function kissb()
animPlayer("mp_ped_interaction", "kisses_guy_b")
end

function petsteve()
animPlayer("creatures@rottweiler@tricks@", "petting_franklin")
end

function animations()
	ClearMenu()
	Menu.addTitle("Animations")
	Menu.addButton("Crossarms","crossarms1",nil)
	Menu.addButton("Crossarms2","crossarms2",nil)
	Menu.addButton("Crossarms3","crossarms4",nil)
	Menu.addButton("Crossarms4","crossarms5",nil)
	Menu.addButton("Crossarms5","crossarms6",nil)
	Menu.addButton("Arse Pick","arsepick",nil)
	Menu.addButton("Middle Finger","onehandmiddlefinger",nil)
	Menu.addButton("Facepalm","failfish",nil)
	BackToLevel1()
	-- ...
end

function crossarms1()
animPlayer("amb@world_human_hang_out_street@male_c@base", "base")
end

function crossarms2()
animPlayer("amb@world_human_hang_out_street@female_arms_crossed@base", "base")
end

function onehandmiddlefinger()
animPlayer("anim@mp_player_intselfiethe_bird", "idle_a")
end

function crossarms4()
animPlayer("amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a")
end

function crossarms5()
animPlayer("missfbi_s4mop", "guard_idle_a")
end

function crossarms6()
animPlayer("oddjobs@assassinate@construction@", "unarmed_fold_arms")
end

function arsepick()
animPlayer("mp_player_int_upperarse_pick", "mp_player_int_arse_pick")
end

function failfish()
animPlayer("anim@mp_player_intupperface_palm", "idle_a")
end

function maledances()
	ClearMenu()
	Menu.addTitle("Male Dances")
	Menu.addButton("Dance 1","dancem1",nil)
	Menu.addButton("Dance 2","dancem2",nil)
	Menu.addButton("Dance 3","dancem3",nil)
	Menu.addButton("Dance 4","dancem4","missfbi3_sniping")
	Menu.addButton("Dance 5","dancem5",nil)
	Menu.addButton("Dance 6","dancem6",nil)
	Menu.addButton("Dance 7","dancem7",nil)
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
	-- ...
end

function dancem1()
halfanimPlayer("misschinese2_crystalmazemcs1_cs", "dance_loop_tao")
end

function dancem2()
animPlayer("move_clown@p_m_two_idles@", "fidget_short_dance")
end

function dancem3()
animPlayer("special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag")
end

function dancem4()
animPlayer("missfbi3_sniping", "dance_m_default")
end

function dancem5()
halfanimPlayer("anim@mp_player_intcelebrationfemale@oh_snap", "oh_snap")
end

function dancem6()
halfanimPlayer("anim@mp_player_intcelebrationfemale@raise_the_roof", "raise_the_roof")
end

function dancem7()
halfanimPlayer("anim@mp_player_intcelebrationfemale@find_the_fish", "find_the_fish")
end

function femdances()
	ClearMenu()
	Menu.addTitle("Female Dances")
	Menu.addButton("Dance 1","dancef1",nil)
	Menu.addButton("Dance 2","dancef2",nil)
	Menu.addButton("Dance 3","dancef3",nil)
	Menu.addButton("Dance 4","dancef4",nil)
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
	-- ...
end

function dancef1()
animPlayer("mini@strip_club@private_dance@part1", "priv_dance_p1")
end

function dancef2()
animPlayer("mini@strip_club@private_dance@part2", "priv_dance_p2")
end

function dancef3()
animPlayer("mini@strip_club@private_dance@part3", "priv_dance_p3")
end

function dancef4(animDict)
animPlayer("mp_am_stripper","lap_dance_girl")
end

function pole(animDict)
animPlayer("mini@strip_club@pole_dance@pole_dance1", "pd_dance_01")
end

function sit()
	ClearMenu()
	Menu.addTitle("Sit")
	Menu.addButton("Sit 1","sit1",nil)
	Menu.addButton("Sit 2","sit2",nil)
	Menu.addButton("Sit 3","sit3",nil)
	Menu.addButton("Sit 4","sit4",nil)
	Menu.addButton("Sit 5","sit5",nil)
	Menu.addButton("Sit 6","sit6",nil)
	Menu.addButton("Sit 7","sit7",nil)
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
	-- ...
end

function sit1()
animPlayer("rcm_barry3", "barry_3_sit_loop")
end

function sit2()
animPlayer("switch@michael@sitting", "idle")
end

function sit3()
animPlayer("switch@michael@restaurant", "001510_02_gc_mics3_ig_1_base_amanda")
end

function sit5()
animPlayer("amb@prop_human_seat_deckchair@female@idle_a", "idle_a")
end

function sit4()
animPlayer("timetable@amanda@ig_12", "amanda_idle_a")
end

function sit6()
animPlayer("amb@world_human_picnic@female@idle_a", "idle_b")
end

function sit7()
animPlayer("amb@world_human_picnic@male@idle_a", "idle_b")
end

function sleepanims()
	ClearMenu()
	Menu.addTitle("Sleep")
	Menu.addButton("Sleep 1","sleep1",nil)
	Menu.addButton("More Soon","MainFunction",nil)
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
	-- ...
end

function sleep1()
animPlayer("timetable@tracy@sleep@", "idle_c")
end

function fitness()
	ClearMenu()
	Menu.addTitle("Fitness")
	Menu.addButton("Meditate","meditate",nil)
	Menu.addButton("Sit Ups","situps",nil)
	Menu.addButton("Push Ups","pushups",nil)
	Menu.addButton("Yoga 1","yogaa",nil)
	Menu.addButton("Yoga 2","yogab",nil)
	Menu.addButton("Yoga 3","yogac",nil)
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
	-- ...
end

function meditate()
animPlayer("rcmcollect_paperleadinout@", "meditiate_idle")
end

function situps()
animPlayer("amb@world_human_sit_ups@male@base", "base")
end

function pushups()
animPlayer("amb@world_human_push_ups@male@base", "base")
end

function yogaa()
animPlayer("amb@world_human_yoga@female@base", "base_a")
end

function yogab()
animPlayer("amb@world_human_yoga@female@base", "base_b")
end

function yogac()
animPlayer("amb@world_human_yoga@female@base", "base_c")
end

---------------------------
----Liquid Custom Shit-----
---------------------------

function cpr()
halfanimPlayer("missheistfbi3b_ig8_2", "cpr_loop_paramedic")
end

function cpr2()
animPlayer("missheistfbi3b_ig8_2", "cpr_loop_paramedic")
end

function pc()
animPlayer("cellphone@", "cellphone_call_listen_base")
end

function scared()
	ClearMenu()
	Menu.addTitle("Surrender")
	Menu.addButton("Hands Up","handsup",nil)
	Menu.addButton("Hands Behind Back","cuff",nil)
	Menu.addButton("Cry Like a Baby","cry",nil)
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
	-- ...
end

function handsup()
halfanimPlayer("random@mugging3", "handsup_standing_base")
end

function cuff()
halfanimPlayer("mp_arresting", "idle")
end

function cry()
animPlayer("missfam4leadinoutmcs2", "tracy_loop")
end

function fapm()
halfanimPlayer("switch@trevor@jerking_off", "trev_jerking_off_loop")
end

function fapf(animDict)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, animDict, "ig_6_base", 3) then
				FreezeEntityPosition(lPed, 0)
				SetEntityCollision(lPed, 1, 1)
				ClearPedTasks(lPed)
				drawNotification("Anim Stopped.")
			else
				ClearPedTasks(lPed)
				x, y, z = table.unpack(GetEntityCoords(PlayerPedId() , true))
				SetEntityCoords(PlayerPedId(), x, y, z - 1.77, 0, 0, 10, 1)
				FreezeEntityPosition(lPed, 1)
				SetEntityCollision(lPed, 0, 1)
				TaskPlayAnim(lPed, animDict, "ig_6_base", 4.0, -4, -1, 1, 0, 0, 0, 0)
				drawNotification("Anim Started, press it again to cancel/continue it.")
			end
		end)
	end
end

function sex(animName)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict("rcmpaparazzo_2")
			while not HasAnimDictLoaded("rcmpaparazzo_2") do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, "rcmpaparazzo_2", animName, 3) then
				FreezeEntityPosition(lPed, 0)
				SetEntityCollision(lPed, 1, 1)
				ClearPedTasks(lPed)
				drawNotification("Anim Stopped.")
			else
				ClearPedTasks(lPed)
				FreezeEntityPosition(lPed, 1)
				SetEntityCollision(lPed, 0, 1)
				TaskPlayAnim(lPed, "rcmpaparazzo_2", animName, 4.0, -4, -1, 1, 0, 0, 0, 0)
				drawNotification("Anim Started, press it again to cancel/continue it.")
			end
		end)
	end
end

function sexv(animName)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict("misslamar1leadinout")
			while not HasAnimDictLoaded("misslamar1leadinout") do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, "misslamar1leadinout", animName, 3) then
				FreezeEntityPosition(lPed, 0)
				SetEntityCollision(lPed, 1, 1)
				ClearPedTasks(lPed)
				drawNotification("Anim Stopped.")
			else
				ClearPedTasks(lPed)
				FreezeEntityPosition(lPed, 1)
				SetEntityCollision(lPed, 0, 1)
				TaskPlayAnim(lPed, "misslamar1leadinout", animName, 4.0, -4, -1, 1, 0, 0, 0, 0)
				drawNotification("Anim Started, press it again to cancel/continue it.")
			end
		end)
	end
end

function carsex1(animDict)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, animDict, "low_car_sex_loop_female", 3) then
				TaskPlayAnim(lPed, animDict, "low_car_sex_to_prop_p1_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(2500)
				TaskPlayAnim(lPed, animDict, "low_car_sex_to_prop_p2_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(3900)
				ClearPedTasks(lPed)
			else
				TaskPlayAnim(lPed, animDict, "low_car_prop_to_sex_p1_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				 Citizen.Wait(3900)
				TaskPlayAnim(lPed, animDict, "low_car_prop_to_sex_p2_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(4500)
				TaskPlayAnim(lPed, animDict, "low_car_sex_loop_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				TriggerEvent("chatMessage", "INFO", {255, 0, 0}, "Press the animation again to start the final stage.")
			end
		end)
	end
end

function carbj1(animDict)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, animDict, "low_car_bj_loop_female", 3) then
				TaskPlayAnim(lPed, animDict, "low_car_bj_to_prop_p1_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(2500)
				TaskPlayAnim(lPed, animDict, "low_car_bj_to_prop_p2_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(4900)
				ClearPedTasks(lPed)
			else
				TaskPlayAnim(lPed, animDict, "low_car_prop_to_bj_p1_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				 Citizen.Wait(3900)
				TaskPlayAnim(lPed, animDict, "low_car_prop_to_bj_p2_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(1500)
				TaskPlayAnim(lPed, animDict, "low_car_bj_loop_female", 4.0, -4, -1, 1, 0, 0, 0, 0)
				TriggerEvent("chatMessage", "INFO", {255, 0, 0}, "Press the animation again to start the final stage.")
			end
		end)
	end
end

function carsex2(animDict)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, animDict, "sex_loop_prostitute", 3) then
				TaskPlayAnim(lPed, animDict, "sex_to_proposition_prostitute", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(13000)
				ClearPedTasks(lPed)
			else
				TaskPlayAnim(lPed, animDict, "proposition_to_sex_p1_prostitute", 4.0, -4, -1, 1, 0, 0, 0, 0)
				 Citizen.Wait(1400)
				TaskPlayAnim(lPed, animDict, "proposition_to_sex_p2_prostitute", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(2000)
				TaskPlayAnim(lPed, animDict, "sex_loop_prostitute", 4.0, -4, -1, 1, 0, 0, 0, 0)
				TriggerEvent("chatMessage", "INFO", {255, 0, 0}, "Press the animation again to start the final stage.")
			end
		end)
	end
end

function carbj2(animDict)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, animDict, "bj_loop_prostitute", 3) then
				TaskPlayAnim(lPed, animDict, "bj_to_proposition_p1_prostitute", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(3500)
				TaskPlayAnim(lPed, animDict, "bj_to_proposition_p2_prostitute", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(3500)
				ClearPedTasks(lPed)
			else
				TaskPlayAnim(lPed, animDict, "proposition_to_bj_p1_prostitute", 4.0, -4, -1, 1, 0, 0, 0, 0)
				 Citizen.Wait(700)
				TaskPlayAnim(lPed, animDict, "proposition_to_bj_p2_prostitute", 4.0, -4, -1, 1, 0, 0, 0, 0)
				Citizen.Wait(1000)
				TaskPlayAnim(lPed, animDict, "bj_loop_prostitute", 4.0, -4, -1, 1, 0, 0, 0, 0)
				TriggerEvent("chatMessage", "INFO", {255, 0, 0}, "Press the animation again to start the final stage.")
			end
		end)
	end
end

function others()
	ClearMenu()
	Menu.addTitle("Others")
	Menu.addButton("Shake Fist","shakefist",nil)
	Menu.addButton("Shake Butt","shakebutt",nil)
	Menu.addButton("Pee","pee",nil)
	Menu.addButton("Poo","poo",nil)
	Menu.addButton("Back","NameOfMenu",nil)
	BackToLevel1()
	-- ...
end

function animPlayer(animDict, animName)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, animDict, animName, 3) then
				ClearPedTasks(lPed)
				drawNotification("Anim Stopped.")
			else
				ClearPedTasks(lPed)
				TaskPlayAnim(lPed, animDict, animName, 4.0, -4, -1, 1, 0, 0, 0, 0)
				drawNotification("Anim Started, press it again to cancel/continue it.")
			end
		end)
	end
end

function halfanimPlayer(animDict, animName)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, animDict, animName, 3) then
				ClearPedTasks(lPed)
				drawNotification("Anim Stopped.")
			else
				ClearPedTasks(lPed)
				TaskPlayAnim(lPed, animDict, animName, 4.0, -4, -1, 49, 0, 0, 0, 0)
				drawNotification("Anim Started, press it again to cancel/continue it.")
			end
		end)
	end
end

function shakefist()
halfanimPlayer("amb@code_human_in_car_mp_actions@dance@bodhi@ds@base", "idle_a_fp")
end

function shakebutt()
animPlayer("switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", 3)
end

function pee()
animPlayer("misscarsteal2peeing", "peeing_loop")
end

function poo()
animPlayer("missfbi3ig_0", "shit_loop_trev")
end

function ChangeToSkin(skin)
	local model = GetHashKey(skin)
	if IsModelInCdimage(model) and IsModelValid(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end
		SetPlayerModel(PlayerId(), model)
		SetPedRandomComponentVariation(PlayerPedId(), true)
		drawNotification('New skin is: '..skin)
		SetModelAsNoLongerNeeded(model)
		DecorSetInt(PlayerPedId(), "charID", tonumber(CharacterDBID))
	else
		drawNotification("Model not found")
	end
end

function pedvar1()
local lPed = PlayerPedId()
SetPedDefaultComponentVariation(lPed)
end

function pedvar2()
local lPed = PlayerPedId()
SetPedComponentVariation(lPed, 2, 2, 0, 0)
SetPedComponentVariation(lPed, 3, 1, 0, 0)
SetPedComponentVariation(lPed, 8, 1, 0, 0)
end

function hump()
animPlayer("creatures@rottweiler@amb@", "hump_loop_chop")
end

function trick1()
animPlayer("creatures@rottweiler@tricks@", "petting_chop")
end

function trick2()
animPlayer("creatures@rottweiler@tricks@", "sit_loop")
end

function trick3()
animPlayer("creatures@rottweiler@tricks@", "paw_right_loop")
end

function peedoggo()
animPlayer("creatures@rottweiler@move", "pee_left_idle")
end

function MainFunction()
	drawNotification("More animations soon, just wait!")
end

function stopAnim()
local lPed = PlayerPedId()
	FreezeEntityPosition(lPed, 0)
	SetEntityCollision(lPed, 1, 1)
	ClearPedTasks(lPed)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0,Keys["LEFTCTRL"]) then
			stopAnim()
		end
		if IsControlJustPressed(0,166) then
			NameOfMenu()                     -- Menu to draw
			Menu.hidden = not Menu.hidden    -- Hide/Show the menu
		end

		if IsControlJustPressed(01,Keys["BACKSPACE"]) then
			NameOfMenu()
		end
		Menu.renderGUI()     -- Draw menu on each tick if Menu.hidden = false
	end
end)

--------------

function BackToLevel1()
Citizen.CreateThread(function()
	--while true do
	--	Citizen.Wait(0)
	--	if IsControlJustPressed(01,Keys["BACKSPACE"]) then
	--		NameOfMenu()
	--	end
	--end
end)
end
-----------------------
RegisterNetEvent('fsn_emotecontrol:phone:call1')
AddEventHandler('fsn_emotecontrol:phone:call1', function()
	if not IsPedInAnyVehicle(PlayerPedId()) then
		while not HasAnimDictLoaded('cellphone@') do
			RequestAnimDict('cellphone@')
			Citizen.Wait(5)
		end
		ClearPedTasksImmediately(PlayerPedId())
		TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_call_listen_base', 8.0, 1.0, 3000, 49, 1.0, 0, 0, 0)
	end
end)
RegisterNetEvent('fsn_emotecontrol:dice:roll')
AddEventHandler('fsn_emotecontrol:dice:roll', function()
    if not IsPedInAnyVehicle(PlayerPedId()) then
        while not HasAnimDictLoaded('mp_player_intwank') do
            RequestAnimDict('mp_player_intwank')
            Citizen.Wait(5)
        end
        ClearPedTasksImmediately(PlayerPedId())
        TaskPlayAnim(PlayerPedId(), 'mp_player_intwank', "mp_player_int_wank", 8.0, 1.0, -1, 120, 0, 0, 0, 0 )
    end
end)
RegisterNetEvent('fsn_emotecontrol:police:ticket')
AddEventHandler('fsn_emotecontrol:police:ticket', function()
	--while not HasAnimDictLoaded('amb@medic@timeofdeath') do
	--	RequestAnimDict('amb@medic@timeofdeath')
	--	Citizen.Wait(5)
	--end
	--ClearPedTasksImmediately(PlayerPedId())
	--TaskPlayAnim(PlayerPedId(), 'amb@medic@timeofdeath', 'idle_b_timeofdeath', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, false)
end)
RegisterNetEvent('fsn_emotecontrol:police:tablet')
AddEventHandler('fsn_emotecontrol:police:tablet', function(status)
	local prop_name = prop_name or 'hei_prop_dlc_tablet'

	if status == "open" then
		if IsPedInAnyVehicle(PlayerPedId()) then
			TriggerEvent('fsn_commands:me', 'uses the onboard computer...')
		else
		while not HasAnimDictLoaded('amb@code_human_in_bus_passenger_idles@female@tablet@idle_a') do
			RequestAnimDict('amb@code_human_in_bus_passenger_idles@female@tablet@idle_a')
			Citizen.Wait(5)
		end
		ClearPedTasksImmediately(PlayerPedId())
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.0, -0.01, -0.04, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
		TaskPlayAnim(PlayerPedId(), 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a', 'idle_b', 3.0, -8, -1, 63, 0, 0, 0, 0 )
		tabletOpen = true
	end
	else
		TaskPlayAnim(PlayerPedId(), 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a', 'exit', 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
		DetachEntity(prop, 1, 1)
		DeleteObject(prop)
		Wait(1000)
		ClearPedSecondaryTask(PlayerPedId())
		tabletOpen = false
	end
end)
-----------------------
DecorRegister("player:handsup", 2)
function halfanimPlayer(animDict, animName)
local lPed = PlayerPedId()
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, animDict, animName, 3) then
				ClearPedTasks(lPed)
				DecorSetBool(PlayerPedId(), "player:handsup", false)
				--drawNotification("Anim Stopped.")
			else
				--ClearPedTasks(lPed)
				TaskPlayAnim(lPed, animDict, animName, 4.0, -4, -1, 49, 0, 0, 0, 0)
				DecorSetBool(PlayerPedId(), "player:handsup", true)
				--drawNotification("Anim Started, press it again to cancel/continue it.")
			end
		end)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 289) then --Start holding X
			halfanimPlayer("random@mugging3", "handsup_standing_base")
		end
		if IsControlJustPressed(1, 170) then --Start holding X
			--halfanimPlayer("anim@mp_player_intcelebrationmale@surrender", "surrender")
			halfanimPlayer("random@shop_robbery", "kneel_loop_p")
		end
		-- if shift is also pressed
		--if IsControlPressed(1, 21) then
		--	if IsControlJustPressed(1, 46) then --Start holding X
		--		halfanimPlayer("switch@trevor@jerking_off", "trev_jerking_off_loop")
		--	end
		--end
	end
end)
--[[
local crouched = false

DecorRegister("player:isCrouched", 2)
Citizen.CreateThread( function()
    while true do
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK

            if ( not IsPauseMenuActive() ) then
                if ( IsDisabledControlJustPressed( 0, 36 ) ) then
                    RequestAnimSet( "move_ped_crouched" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do
                        Citizen.Wait( 100 )
                    end

                    if ( crouched == true ) then
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false
                        DecorSetBool(PlayerPedId(), "player:isCrouched", false)
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true
                        DecorSetBool(PlayerPedId(), "player:isCrouched", true)
                    end
                end
            end
        end
    end
end )
]]
local mp_pointing = false
local keyPressed = false

local function startPointing()
    local ped = PlayerPedId()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = PlayerPedId()
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)
