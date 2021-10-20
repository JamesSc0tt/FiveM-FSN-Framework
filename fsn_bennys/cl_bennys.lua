local ingarage = false
--[[
	Menu stuff
]]
local Menu = SetMenu()
local BennysMenu = Menu.new("Benny's Workshop","CATEGORIES", 0.16,0.13,0.24,0.36,0,{255,255,255,255})

local categories = {
	{name='engine',desc = "Upgrade the core engine of the vehicle",index=11},
	{name='lights',desc = "Change bulbs",index=22},
	{name='paint',desc = "Change the color of the vehicle",index=0},
	{name='livery',desc = "Apply a new skin to the vehicle",requires='livery',index=0},
	{name='front bumpers',desc = "Change the front bumper.",requires='front bumpers',index=0},
	{name='rear bumpers',desc = "Change the rear bumper.",requires='rear bumpers',index=0},
}

function BennysMenu:OnMenuClose(m)
	ingarage = false
end
function BennysMenu:onButtonSelected(name, button)
	if button.price then
		if exports["fsn_main"]:fsn_CanAfford(button.price) then
			exports['mythic_notify']:DoHudText('success', 'You can afford: $'..tostring(button.price))
		else
			exports['mythic_notify']:DoHudText('error', 'You cannhot afford: $'..tostring(button.price))

		end
	end
end

-- stuff
Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if GetDistanceBetweenCoords(Config.XYZ.x, Config.XYZ.y, Config.XYZ.z, GetEntityCoords(PlayerPedId()), true) < 10 then
			if not ingarage then
				Util.DrawText('Press ~o~ENTER~w~ to enter ~o~Benny\'s', 4, true, 0.5,0.8, 0.9, {255, 255, 255,255})
				if IsControlJustReleased(0,201) then
					EnterGarage()
				end
			end
		end
	end
end)

--[[
	Enter garage
]]--
local myveh = {}
local function AddMod(mod,parent,header,name,info,stock)
	local veh = myveh.vehicle
	SetVehicleModKit(veh,0)	
	if (GetNumVehicleMods(veh,mod) ~= nil and GetNumVehicleMods(veh,mod) > 0) or mod == 18 or mod == 22 then
		local m = parent:addSubMenu(header, name, info,true)
		if stock then
			local btn = m:addPurchase("Stock")
			btn.modtype = mod
			btn.mod = -1
		end
		if Config.prices.mods[mod].startprice then
			local price = Config.prices.mods[mod].startprice
			for i = 0,   tonumber(GetNumVehicleMods(veh,mod)) -1 do
				local lbl = GetModTextLabel(veh,mod,i)
				if lbl ~= nil then
					local mname = tostring(GetLabelText(lbl))
					if mname ~= "NULL" then
						local btn = m:addPurchase(mname,price)
						btn.modtype = mod
						btn.mod = i
						price = price + Config.prices.mods[mod].increaseby
					end
				end
			end		
		else
			for n, v in pairs(Config.prices.mods[mod]) do
				btn = m:addPurchase(v.name,v.price)btn.modtype = mod
				btn.mod = v.mod
			end
		end
	end
end

function EnterGarage()
	
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsUsing(ped)
	myveh.vehicle = veh
	if not IsPedInAnyVehicle(PlayerPedId()) then exports['mythic_notify']:DoHudText('error', 'You need to be driving a vehicle to use this garage.') return end
	ingarage = true
	
	BennysMenu:setTitle("Benny's Motorworks")
	BennysMenu.title_sprite = "shopui_title_supermod"
	BennysMenu:setMaxButtons(10)
	BennysMenu:setColors({ r = 255,g = 255, b = 255, a = 255},{ r = 0,g = 0, b = 0, a = 255},{ r = 0,g = 0, b = 0, a = 155},{ r = 200,g = 15, b = 15, a = 200})
	BennysMenu.config.controls = {
		menu_up = 27,
		menu_down = 173,
		menu_left = 174,
		menu_right = 175,
		menu_select = 201,
		menu_back = 177
	}
	
	DisplayRadar(false)
	SetPlayerControl(PlayerId(),false,256)
	
	damage = (1000 - GetVehicleBodyHealth(veh))/100
	BennysMenu:addPurchase("Repair vehicle",math.ceil(250+150*damage,0), "Full body repair and engine service.")
	
	
	BennysMenu:addSubMenu("CATEGORIES", "categories",nil, false)
	local mod_inc = 2500
	for k,v in ipairs(categories) do
		--local m = BennysMenu.categories:addSubMenu(string.lower(v.name),string.upper(v.name),v.desc,true)
		AddMod(v.index,BennysMenu.categories,string.upper(v.name),string.lower(v.name),v.desc,true)
	end	
	
	BennysMenu:Open("categories")
	
end
-- debug	
SetPlayerControl(PlayerId(),true,256)
