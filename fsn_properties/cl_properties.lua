local properties_xyz = {}

AddEventHandler('fsn_main:character', function(c)
	-- what properties do i have keys to papa
	TriggerServerEvent('fsn_properties:request')
	TriggerServerEvent('fsn_properties:requestKeys', c.char_id)
end)

RegisterNetEvent('fsn_properties:updateXYZ')
AddEventHandler('fsn_properties:updateXYZ', function(tbl)
	for k,v in pairs(properties_xyz) do
		if v.blip and DoesBlipExist(v.blip) then
			RemoveBlip(v.blip)
		end
	end 
	properties_xyz = tbl
	for k,v in ipairs(properties_xyz) do
		print('adding blip for '..v.name)
		local blip = AddBlipForCoord(v.xyz.x, v.xyz.y, v.xyz.z)
		SetBlipSprite(blip, 350)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Prop: '..v.name)
		EndTextCommandSetBlipName(blip)
		properties_xyz[k].blip = blip
	end
end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		for k,p in pairs(properties_xyz) do
			if GetDistanceBetweenCoords(p.xyz.x,p.xyz.y,p.xyz.z,GetEntityCoords(PlayerPedId()),true) < 20 then
				DrawMarker(25, p.xyz.x,p.xyz.y,p.xyz.z - 0.95, 0, 0, 0, 0, 0, 0, 0.50, 0.50, 10.3, 255, 255, 255, 140, 0, 0, 1, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(p.xyz.x,p.xyz.y,p.xyz.z,GetEntityCoords(PlayerPedId()),true) < 0.5 then
					Util.DrawText3D(p.xyz.x,p.xyz.y,p.xyz.z, '[E] Access:\n'..p.name, {255, 255, 255, 140}, 0.25)
					if IsControlJustPressed(0,38) then
						TriggerServerEvent('fsn_properties:access', k)
					end
				end
			end
		end
	end
end)

--[[
	Current property
]]--
current_p_id = 0
current_p = {}

current_p_Owner = false
current_p_Keys = false
isPoPoCMD = false

RegisterNetEvent('fsn_properties:access')
AddEventHandler('fsn_properties:access', function(id, p)
	current_p_id = id
	current_p = p
	if current_p.owner == exports["fsn_main"]:fsn_CharID() then
		current_p_Owner = true
		current_p_Keys = true
	else
		current_p_Owner = false
		current_p_Keys = false
	end
	for k, v in pairs(current_p.keys) do
		if v.id == exports["fsn_main"]:fsn_CharID() then
			current_p_Owner = false
			current_p_Keys = true
		end
	end
	if keez then hasKeys = true else hasKeys = false end
	if exports["fsn_police"]:fsn_getPDLevel() > 5 then isPoPoCMD = false else isPoPoCMD = false end
	ToggleActionMenu()
end)

RegisterNetEvent('fsn_properties:inv:update')
AddEventHandler('fsn_properties:inv:update', function(inv)
	current_p.inventory = inv
end)
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
function depositWeapon()
	local accepted = {
		"WEAPON_KNIFE",
		"WEAPON_NIGHTSTICK",
		"WEAPON_HAMMER",
		"WEAPON_BAT",
		"WEAPON_GOLFCLUB",
		"WEAPON_CROWBAR",
		"WEAPON_PISTOL",
		"WEAPON_COMBATPISTOL",
		"WEAPON_APPISTOL",
		"WEAPON_PISTOL50",
		"WEAPON_MICROSMG",
		"WEAPON_SMG",
		"WEAPON_ASSAULTSMG",
		"WEAPON_ASSAULTRIFLE",
		"WEAPON_CARBINERIFLE",
		"WEAPON_ADVANCEDRIFLE",
		"WEAPON_MG",
		"WEAPON_COMBATMG",
		"WEAPON_PUMPSHOTGUN",
		"WEAPON_SAWNOFFSHOTGUN",
		"WEAPON_ASSAULTSHOTGUN",
		"WEAPON_BULLPUPSHOTGUN",
		"WEAPON_STUNGUN",
		"WEAPON_SNIPERRIFLE",
		"WEAPON_SMOKEGRENADE",
		"WEAPON_BZGAS",
		"WEAPON_MOLOTOV",
		"WEAPON_FIREEXTINGUISHER",
		"WEAPON_PETROLCAN",
		"WEAPON_SNSPISTOL",
		"WEAPON_SPECIALCARBINE",
		"WEAPON_HEAVYPISTOL",
		"WEAPON_BULLPUPRIFLE",
		"WEAPON_HOMINGLAUNCHER",
		"WEAPON_PROXMINE",
		"WEAPON_SNOWBALL",
		"WEAPON_VINTAGEPISTOL",
		"WEAPON_DAGGER",
		"WEAPON_FIREWORK",
		"WEAPON_MUSKET",
		"WEAPON_MARKSMANRIFLE",
		"WEAPON_HEAVYSHOTGUN",
		"WEAPON_GUSENBERG",
		"WEAPON_HATCHET",
		"WEAPON_COMBATPDW",
		"WEAPON_KNUCKLE",
		"WEAPON_MARKSMANPISTOL",
		"WEAPON_BOTTLE",
		"WEAPON_FLAREGUN",
		"WEAPON_FLARE",
		"WEAPON_REVOLVER",
		"WEAPON_SWITCHBLADE",
		"WEAPON_MACHETE",
		"WEAPON_FLASHLIGHT",
		"WEAPON_MACHINEPISTOL",
		"WEAPON_DBSHOTGUN",
		"WEAPON_COMPACTRIFLE"
	}
	local wep = GetSelectedPedWeapon(PlayerPedId())
	local submitting = false
	for k,v in pairs(accepted) do
		if GetHashKey(v) == wep then
			submitting = true
		end
	end
	if submitting == false then
		exports['mythic_notify']:DoHudText('error', 'You cannot put this weapon here!')
	else
		local info = exports["fsn_criminalmisc"]:weaponInfo(GetSelectedPedWeapon(PlayerPedId()))
		if info.name then
			exports['mythic_notify']:DoHudText('inform', 'Adding: '..info.name)
			table.insert(current_p.weapons,#current_p.weapons+1,info)
			TriggerEvent('fsn_criminalmisc:weapons:destroy')
			ToggleActionMenu(false)
			Citizen.Wait(100)
			ToggleActionMenu()
		else
			exports['mythic_notify']:DoHudText('error', 'There is something wrong with this weapon.')
		end
	end
end
function takeWeapon(id)
	id = id + 1
	local wep = current_p.weapons[id]
	if wep then
		if wep.name then
			exports['mythic_notify']:DoHudText('inform', 'Taking: '..wep.name)
			TriggerEvent('fsn_criminalmisc:weapons:add:tbl', wep)
			current_p.weapons[id] = nil
			ToggleActionMenu(false)
			Citizen.Wait(100)
			ToggleActionMenu()
		else
			exports['mythic_notify']:DoHudText('error', 'There is something wrong with this weapon.')
		end
	else
		exports['mythic_notify']:DoHudText('error', 'This weapon does not exist????')
	end
end

function checkRent()
	TriggerServerEvent('fsn_properties:rent:check', current_p_id)
end

function addKeys()
	ToggleActionMenu(false)
	Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('Input #ID',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~r~DO NOT USE THE OVERHEAD NUMBER, USE #ID FROM THEIR ID CARD.',4,1,0.5,0.49,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            ToggleActionMenu()
            res = tonumber(GetOnscreenKeyboardResult())
			local exists = false
			for k, v in pairs(current_p.keys) do
				if v.id == res then
					exists = true
				end
			end
			if not exists then
				table.insert(current_p.keys,#current_p.keys+1,{id=res})
				exports['mythic_notify']:DoHudText('success', 'You added CharID '..res..' to this property.')
			else	
				exports['mythic_notify']:DoHudText('error', 'This CharID already has access!')
			end
            ToggleActionMenu(true)
          end
          break
        end
      end
    end)
end

function removeKeys(id)
	local removed = false
	print('removing: '..id)
	for k, v in pairs(current_p.keys) do
		if v.id == id then
			if v.name then
				exports['mythic_notify']:DoHudText('success', 'You removed '..v.name..' ('..v.id..') from this property!')
				current_p.keys[k] = false
				current_p.keys[k] = nil
			else
				exports['mythic_notify']:DoHudText('success', 'You removed CharID '..v.id..' from this property!')
			end
			removed=true
		else
			print(v.id .. ' != ' .. id)
		end
	end
	if not removed then
		exports['mythic_notify']:DoHudText('error', 'This CharID does not have access?????')
	end
	ToggleActionMenu(false)
	ToggleActionMenu()
end

function depositMoney()
	ToggleActionMenu(false)
	Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('What would you like to deposit?',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~r~Do NOT include the dollar symbol ($)',4,1,0.5,0.49,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            amount = tonumber(GetOnscreenKeyboardResult())
			if amount <= 100000 and amount > 0 then
				if exports["fsn_main"]:fsn_CanAfford(amount) then
					current_p.money = current_p.money + amount
					TriggerEvent('fsn_bank:change:walletMinus', amount)
					exports['mythic_notify']:DoHudText('success', 'You added: $'..amount)
				else
					exports['mythic_notify']:DoHudText('error', 'You cannot afford this!')
				end
			else
				exports['mythic_notify']:DoHudText('error', 'Maximum withdraw of $100,000')
			end
			
			ToggleActionMenu()
          end
        end
      end
    end)
end

function withdrawMoney()
	ToggleActionMenu(false)
	Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('What would you like to withdraw?',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~r~Do NOT include the dollar symbol ($)',4,1,0.5,0.49,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            amount = tonumber(GetOnscreenKeyboardResult())
			if amount <= 100000 and amount > 0 then
				if current_p.money >= amount then
					current_p.money = current_p.money - amount
					TriggerEvent('fsn_bank:change:walletAdd', amount)
					exports['mythic_notify']:DoHudText('success', 'You withdrew: $'..amount)
				else
					exports['mythic_notify']:DoHudText('error', 'There is not enough money.')
				end
			else
				exports['mythic_notify']:DoHudText('error', 'Maximum withdraw of $100,000')
			end
			
			ToggleActionMenu()
          end
        end
      end
    end)
end
--[[
	Menu shit
]]--

RegisterNetEvent('fsn_properties:inv:closed')
AddEventHandler('fsn_properties:inv:closed', function(id)
	Citizen.Wait(100)
	ToggleActionMenu()
end)

menuEnabled = false
function ToggleActionMenu(send)
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then
		SetNuiFocus( true, true )
		SendNUIMessage({
			showmenu = true,
			forSale = current_p.sale,
			isOwner = current_p_Owner,
			hasKeys = current_p_Keys,
			weapons = json.encode(current_p.weapons),
			keys = json.encode(current_p.keys),
			money = current_p.money,
			DOJ = false,
			POLICE = isPoPoCMD,
		})
	else
		SetNuiFocus( false )
		if send then
			TriggerServerEvent('fsn_properties:leave', current_p_id, current_p)
			current_p_id = 0
			current_p = {}
		end
		SendNUIMessage({
			hidemenu = true
		})
	end
end
function fsn_SplitString(inputstr, sep)
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
local last_click = 0
RegisterNUICallback( "ButtonClick", function( data, cb )
	if last_click + 1000 > GetNetworkTime() then return end
	last_click = GetNetworkTime()
	local split = fsn_SplitString(data, "-")
	if split[1] == 'money' then
		if split[2] == 'deposit' then
			depositMoney()
		elseif split[2] == 'withdraw' then
			withdrawMoney()
		end
	elseif split[1] == 'keys' then
		if split[2] == 'grant' then
			addKeys()
		elseif split[2] == 'remove' then
			removeKeys(tonumber(split[3]))
		end
	elseif split[1] == 'robbery' then
		exports['mythic_notify']:DoHudText('error', 'This feature has not been developed yet!')
	elseif split[1] == 'info' then
		if split[2] == 'show' then
			TriggerEvent('chatMessage', '', {255,255,255}, '^*^4:fsn_properties:^0^r '..current_p.name..' | '..current_p.owner)
			checkRent()
		elseif split[2] == 'rent' then
			if exports["fsn_main"]:fsn_CanAfford(25000) then
				TriggerServerEvent('fsn_properties:rent:pay', current_p_id)
			else
				exports['mythic_notify']:DoHudText('error', 'You cannot afford this. ($25,000)')
			end
		elseif split[2] == 'buy' then
			if exports["fsn_main"]:fsn_CanAfford(50000) then
				TriggerServerEvent('fsn_properties:buy', current_p_id)
				ToggleActionMenu(true)
			else
				exports['mythic_notify']:DoHudText('error', 'You cannot afford this. ($50,000)')
			end
		end
	elseif split[1] == 'weapon' then
		if split[2] == 'deposit' then
			depositWeapon()
		elseif split[2] == 'take' then
			takeWeapon(split[3])
		end
	elseif split[1] == 'inventory' then
		print('item: '..#current_p.inventory)
		ToggleActionMenu(false)
		TriggerEvent('fsn_inventory:prop:recieve', current_p_id, current_p.inventory)
	elseif ( data == "exit" ) then
		ToggleActionMenu(true)
		return
	end
end)