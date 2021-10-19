local boatshop = {
	opened = false,
	title = "Boat Shop",
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
				{name = "Boats", description = ""},
			}
		},
		["boats"] = {
			title = "boats",
			name = "boats",
			buttons = {
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
		},
	}
}
local fakeboat = {model = '', boat = nil}
local boatshop_locations = {}

local boatshop_blips ={}
local inrangeofboatshop = false
local currentlocation = nil
local boughtboat = false
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

function IsPlayerInRangeOfboatshop()
return inrangeofboatshop
end

function ShowboatshopBlips(bool)
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
local boatIamChanging = 0
function OpenCreator(changingBoat)
	boatIamChanging = changingBoat
	boughtboat = false
	local ped = LocalPed()
	local pos = {-803.65118408203, -1469.5137939453, -0.47453951835632, 131.9475402832}
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	boatshop.currentmenu = "main"
	boatshop.opened = true
	boatshop.selectedbutton = 0
end

local vehicle_price = 0
function CloseCreator()
	Citizen.CreateThread(function()
		local ped = LocalPed()
		if not boughtboat then
			local pos = {-718.85162353516, -1325.6365966797, 1.596290230751, 0.0}
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			local veh = GetVehiclePedIsUsing(ped)
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
			local pos = {-718.85162353516, -1325.6365966797, 1.596290230751, 0.0}--currentlocation.pos.outside
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)

			--print(boatIamChanging .. ibought)
			
			TriggerServerEvent('fsn_boatshop:floor:ChangeBoat', boatIamChanging, ibought)
		end
		boatshop.opened = false
		boatshop.menu.from = 1
		boatshop.menu.to = 10
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = boatshop.menu
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
	local menu = boatshop.menu
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
	local menu = boatshop.menu
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
local menu = boatshop.menu
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
		--TODO:check if player own boat
		if t then
			drawMenuRight("OWNED",boatshop.menu.x,y,selected)
		else
			drawMenuRight(button.costs.."$",boatshop.menu.x,y,selected)
		end
end

local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and IsPlayerInRangeOfboatshop() then
			if boatshop.opened then
				CloseCreator()
			else
				OpenCreator()
			end
		end
		if boatshop.opened then
			local ped = LocalPed()
			local menu = boatshop.menu[boatshop.currentmenu]
			drawTxt(boatshop.title,1,1,boatshop.menu.x,boatshop.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, boatshop.menu.x,boatshop.menu.y + 0.08)
			drawTxt(boatshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,boatshop.menu.x + boatshop.menu.width/2 - 0.0385,boatshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = boatshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= boatshop.menu.from and i <= boatshop.menu.to then

					if i == boatshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,boatshop.menu.x,y,selected)
					if button.costs ~= nil then
						if boatshop.currentmenu == "boats"  then
							DoesPlayerHaveVehicle(button.model,button,y,selected)
						else
						drawMenuRight(button.costs.."$",boatshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if boatshop.currentmenu == "boats" then
						if selected then
							if fakeboat.model ~= button.model then
								if DoesEntityExist(fakeboat.boat) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakeboat.boat))
								end
								local pos = {-803.65118408203, -1469.5137939453, -0.47453951835632, 131.9475402832}
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
								fakeboat = { model = button.model, boat = veh}
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if boatshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if boatshop.selectedbutton > 1 then
					boatshop.selectedbutton = boatshop.selectedbutton -1
					if buttoncount > 10 and boatshop.selectedbutton < boatshop.menu.from then
						boatshop.menu.from = boatshop.menu.from -1
						boatshop.menu.to = boatshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if boatshop.selectedbutton < buttoncount then
					boatshop.selectedbutton = boatshop.selectedbutton +1
					if buttoncount > 10 and boatshop.selectedbutton > boatshop.menu.to then
						boatshop.menu.to = boatshop.menu.to + 1
						boatshop.menu.from = boatshop.menu.from + 1
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
	local this = boatshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Boats" then
			OpenMenu('boats')
		end
	elseif this == "boats" then
		--if tonumber(exports.fsn_main:fsn_GetWallet()) >= button.costs then
			vehicle_price = button.costs
			boughtboat = true
			ibought = button.model
			--TriggerEvent('fsn_bank:change:walletMinus', button.costs)
			CloseCreator()
		--else
 	  	--TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
		--end
	end
end

function OpenMenu(menu)
	fakeboat = {model = '', boat = nil}
	boatshop.lastmenu = boatshop.currentmenu
	if menu == "boats" then
		boatshop.lastmenu = "main"
	end
	boatshop.menu.from = 1
	boatshop.menu.to = 10
	boatshop.selectedbutton = 0
	boatshop.currentmenu = menu
end


function Back()
	if backlock then
		return
	end
	backlock = true
	if boatshop.currentmenu == "main" then
		CloseCreator()
	elseif boatshop.currentmenu == "boats" then
		if DoesEntityExist(fakeboat.boat) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakeboat.boat))
		end
		fakeboat = {model = '', boat = nil}
		OpenMenu(boatshop.lastmenu)
	else
		OpenMenu(boatshop.lastmenu)
	end

end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
