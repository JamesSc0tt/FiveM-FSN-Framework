function GetWeaponInfo(hash)	
	if hashGunToText[tostring(hash)] then
		tbl = {name = hashGunToText[tostring(hash)].name, hash = hash, isweapon = hashGunToText[tostring(hash)].isweapon, ammoType = hashGunToText[tostring(hash)].ammoType, isAuto = hashGunToText[tostring(hash)].isAuto} 
		return tbl
	else
		print('cannot find weaponinfo for '..hash)
		return false
	end
end

function HoldingWeapon()
	for k, v in pairs(hashGunToText) do
		if tostring(GetSelectedPedWeapon(PlayerPedId())) == k then
			if v.isweapon then
				return true
			end
		end
	end
	return false
end

local name = ''
local myWeapons = {}
function GetWeapons()
	return myWeapons
end
--[[
{
	name = 'Pistol 50.',
	hash = 917418974,
	model = false,
	ammo = 200,
	owner = {
		serial = 'LS:1764135',
		name = 'Logan Whitehead'
	}
}
]]--

local droppedWeapons = {}
--[[
{
	dropid = 0,
	loc = {x = 0, y = 0, z = 0},
	weapon = {
		name = 'Pistol 50.',
		hash = 917418974,
		model = false,
		ammo = 200,
		owner = {
			serial = 'LS:1764135',
			name = 'Logan Whitehead'
		}
	}
}
]]--

function makeString(l)
	if l < 1 then return nil end
	local s = ""
	for i = 1, l do
		s = s .. math.random(32, 126)
	end
	return s
end

function weaponInfo(hash)
	local weapon = {}
	local remov = 0
	for k,v in pairs(myWeapons) do
		if v.hash == GetSelectedPedWeapon(PlayerPedId()) then
			remov = k
			weapon = v
			print('getting weapon info for: '..weapon.name)
		end
	end
	if weapon == {} then
		TriggerEvent('fsn_notify:displayNotification', 'There is no weaponinfo regarding '..GetSelectedPedWeapon(PlayerPedId())..' contact a developer', 'centerRight', 10000, 'error')
		RemoveWeaponFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()))
	else
		if weapon == nil then
			print 'im a dumbass'
		end
		return weapon
	end
end

RegisterNetEvent('fsn_criminalmisc:weapons:add')
AddEventHandler('fsn_criminalmisc:weapons:add', function(hash, ammo)
	local info = GetWeaponInfo(hash)
	if info then
		for k, v in pairs(myWeapons) do
			if v.hash == hash then
				TriggerEvent('fsn_notify:displayNotification', 'You already have '..info.name..' so got 200 ammo', 'centerRight', 6000, 'info')
				SetPedAmmo(PlayerPedId(), v.hash, 200)
				return
			end
		end
		local srl = "LS:"..makeString(6)
		table.insert(myWeapons, #myWeapons+1, {
			name = info.name,
			hash = hash,
			model = info.model,
			ammo = ammo,
			ammoType = info.ammoType,
			owner = {
				serial = srl,
				name = name
			}
		})
		TriggerEvent('fsn_notify:displayNotification', 'You got '..info.name, 'centerRight', 6000, 'info')
		TriggerEvent('fsn_criminalmisc:weapons:equip')
	else
		TriggerEvent('fsn_notify:displayNotification', 'Could not find weapon info, tell this to a developer ('..hash..')', 'centerRight', 10000, 'error')
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:add:police')
AddEventHandler('fsn_criminalmisc:weapons:add:police', function(hash, ammo)
	local info = GetWeaponInfo(hash)
	if info then
		for k, v in pairs(myWeapons) do
			if v.hash == hash then
				TriggerEvent('fsn_notify:displayNotification', 'You already have '..info.name..' so got 200 ammo', 'centerRight', 6000, 'info')
				SetPedAmmo(PlayerPedId(), v.hash, 200)
				return
			end
		end
		local srl = "LS:"..makeString(6)
		local name = '(PD ISSUE) '..name
		table.insert(myWeapons, #myWeapons+1, {
			name = info.name,
			hash = hash,
			model = info.model,
			ammo = ammo,
			ammoType = info.ammoType,
			isAuto = info.isAuto,
			owner = {
				serial = srl,
				name = name
			}
		})
		TriggerEvent('fsn_notify:displayNotification', 'You got '..info.name, 'centerRight', 6000, 'info')
		TriggerEvent('fsn_criminalmisc:weapons:equip')
	else
		TriggerEvent('chatMessage', '', {255,255,255}, '^1^r:FSN:^0^* ERROR | No weapon info for: '..hash)
		TriggerEvent('fsn_notify:displayNotification', 'Could not find weapon info, tell this to a developer ('..hash..')', 'centerRight', 10000, 'error')
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:add:unknown')
AddEventHandler('fsn_criminalmisc:weapons:add:unknown', function(hash, ammo)
	local info = GetWeaponInfo(hash)
	if info then
		for k, v in pairs(myWeapons) do
			if v.hash == hash then
				TriggerEvent('fsn_notify:displayNotification', 'You already have '..info.name..' so got 200 ammo', 'centerRight', 6000, 'info')
				SetPedAmmo(PlayerPedId(), v.hash, 200)
				return
			end
		end
		local srl = "LS:"..makeString(6)
		table.insert(myWeapons, #myWeapons+1, {
			name = info.name,
			hash = hash,
			model = info.model,
			ammo = ammo,
			ammoType = info.ammoType,
			isAuto = true,
			owner = {
				serial = 'illegible',
				name = 'UNKNOWN'
			}
		})
		TriggerEvent('fsn_notify:displayNotification', 'You got '..info.name, 'centerRight', 6000, 'info')
		TriggerEvent('fsn_criminalmisc:weapons:equip')
	else
		TriggerEvent('fsn_notify:displayNotification', 'Could not find weapon info, tell this to a developer ('..hash..')', 'centerRight', 10000, 'error')
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:add:tbl')
AddEventHandler('fsn_criminalmisc:weapons:add:tbl', function(tbl)
	table.insert(myWeapons, #myWeapons+1, tbl)
	TriggerEvent('fsn_notify:displayNotification', 'You got '..tbl.name, 'centerRight', 6000, 'info')
	TriggerEvent('fsn_criminalmisc:weapons:equip')
end)

RegisterNetEvent('fsn_criminalmisc:weapons:pickup')
AddEventHandler('fsn_criminalmisc:weapons:pickup', function(weapon)
	local info = GetWeaponInfo(weapon.hash)
	if info then
		for k, v in pairs(myWeapons) do
			if v.hash == weapon.hash then
				TriggerEvent('fsn_notify:displayNotification', 'You already have '..weapon.name..' so got 200 ammo', 'centerRight', 6000, 'info')
				SetPedAmmo(PlayerPedId(), v.hash, 200)
				v.ammo = 200
				return
			end
		end
		table.insert(myWeapons, #myWeapons+1, weapon)
		TriggerEvent('fsn_notify:displayNotification', 'You got '..weapon.name..' with '..weapon.ammo..' ammo (Owned by: '..weapon.owner.name..')', 'centerRight', 8000, 'error')
		TriggerEvent('fsn_criminalmisc:weapons:equip')
	else
		TriggerEvent('fsn_notify:displayNotification', 'Could not find weapon info, tell this to a developer ('..hash..')', 'centerRight', 10000, 'error')
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:info')
AddEventHandler('fsn_criminalmisc:weapons:info', function()
	if GetSelectedPedWeapon(PlayerPedId()) == -1569615261 then
		TriggerEvent('fsn_notify:displayNotification', 'Your fists do not have a serial number', 'centerRight', 10000, 'error')
		return
	end
	for k,v in pairs(myWeapons) do
		if v.hash == GetSelectedPedWeapon(PlayerPedId()) then
			 TriggerEvent('chatMessage', '', {255,255,255}, '^1^r:FSN:^0^* INFO | Registered to: '..v.owner.name..' / Serial: '..v.owner.serial)
		end
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:equip')
AddEventHandler('fsn_criminalmisc:weapons:equip', function()
	for k, v in pairs(myWeapons) do
		if not HasPedGotWeapon(PlayerPedId(), v.hash, false) then
			print('equipping '..v.name..' ('..v.hash..')')
			GiveWeaponToPed(PlayerPedId(), v.hash, v.ammo, false, true)
		end
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:drop')
AddEventHandler('fsn_criminalmisc:weapons:drop', function()
	if GetSelectedPedWeapon(PlayerPedId()) == -1569615261 then
		TriggerEvent('fsn_notify:displayNotification', 'You cannot drop your fists', 'centerRight', 10000, 'error')
		return
	end
	local weapon = {}
	local remov = 0
	for k,v in pairs(myWeapons) do
		if v.hash == GetSelectedPedWeapon(PlayerPedId()) then
			remov = k
			weapon = v
			print('droppping current weapon: '..weapon.name)
		end
	end
	if weapon == {} then
		TriggerEvent('fsn_notify:displayNotification', 'There is no weaponinfo regarding '..GetSelectedPedWeapon(PlayerPedId())..' contact a developer', 'centerRight', 10000, 'error')
		RemoveWeaponFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()))
	else
		TriggerServerEvent('fsn_criminalmisc:weapons:addDrop', weapon, {x=GetEntityCoords(PlayerPedId()).x, y=GetEntityCoords(PlayerPedId()).y, z=GetEntityCoords(PlayerPedId()).z})
		
		RemoveWeaponFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()))
		myWeapons[remov] = nil
		table.remove(myWeapons, remov)
		
		TriggerEvent('fsn_main:characterSaving')
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:destroy')
AddEventHandler('fsn_criminalmisc:weapons:destroy', function()
	if GetSelectedPedWeapon(PlayerPedId()) == -1569615261 then
		TriggerEvent('fsn_notify:displayNotification', 'You cannot destroy your fists', 'centerRight', 10000, 'error')
		return
	end
	local weapon = {}
	local remov = 0
	for k,v in pairs(myWeapons) do
		if v.hash == GetSelectedPedWeapon(PlayerPedId()) then
			remov = k
			weapon = v
			print('droppping current weapon: '..weapon.name)
		end
	end
	if weapon == {} then
		TriggerEvent('fsn_notify:displayNotification', 'There is no weaponinfo regarding '..GetSelectedPedWeapon(PlayerPedId())..' contact a developer', 'centerRight', 10000, 'error')
		RemoveWeaponFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()))
	else
		--TriggerServerEvent('fsn_criminalmisc:weapons:addDrop', weapon, {x=GetEntityCoords(PlayerPedId()).x, y=GetEntityCoords(PlayerPedId()).y, z=GetEntityCoords(PlayerPedId()).z})
		
		RemoveWeaponFromPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()))
		myWeapons[remov] = nil
		table.remove(myWeapons, remov)
		
		TriggerEvent('fsn_main:characterSaving')
	end
end)

RegisterNetEvent('fsn_criminalmisc:weapons:updateDropped')
AddEventHandler('fsn_criminalmisc:weapons:updateDropped', function(weapons)
	droppedWeapons = weapons
	for k, v in pairs(droppedWeapons) do
		print(v.weapon.name)
	end
end)

AddEventHandler('fsn_main:character', function(character)
	myWeapons = json.decode(character.char_weapons)
	name = character.char_fname..' '..character.char_lname
	
	TriggerEvent('fsn_criminalmisc:weapons:equip')
end)

---------------------------------------------------- system
function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 140)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
local stripper = {x = 605.54632568359, y = -3091.7287597656, z = 6.0692601203918}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(stripper.x, stripper.y, stripper.z, GetEntityCoords(PlayerPedId())) < 10 then
			DrawMarker(1,stripper.x, stripper.y, stripper.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(stripper.x, stripper.y, stripper.z, GetEntityCoords(PlayerPedId())) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("~INPUT_PICKUP~ modify weapon (~r~5000DM~w~)")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0, 38) then
					if GetSelectedPedWeapon(PlayerPedId()) == -1569615261 then
						TriggerEvent('fsn_notify:displayNotification', 'It looks like that tool would hurt your hands...', 'centerRight', 5000, 'error')
					else
						if exports["fsn_inventory"]:fsn_HasItem('dirty_money') and exports["fsn_inventory"]:fsn_GetItemAmount('dirty_money') >= 5000 then
							for k,v in pairs(myWeapons) do
								if v.hash == GetSelectedPedWeapon(PlayerPedId()) then
									if v.owner.name ~= 'UNKNOWN' and v.owner.serial ~= 'illegible' then
										if string.find(v.owner.name, '(PD ISSUE)') then
											TriggerEvent('fsn_notify:displayNotification', 'The heat are looking for this gun, you cannot modify it here.', 'centerRight', 5000, 'success')
										else
											v.owner.name = 'UNKNOWN'
											v.owner.serial = 'illegible'
											TriggerEvent('fsn_inventory:item:take', 'dirty_money', 5000)
											TriggerEvent('fsn_notify:displayNotification', 'This was successfully scratched off', 'centerRight', 5000, 'success')
										end
									end
								end
							end
						else
							TriggerEvent('fsn_notify:displayNotification', 'You don\'t have the required DM', 'centerRight', 10000, 'error')
						end
					end
				end
			end
		end
		for k,v in pairs(droppedWeapons) do
			if GetDistanceBetweenCoords(v.loc.x, v.loc.y, v.loc.z, GetEntityCoords(PlayerPedId())) < 10 then
				DrawMarker(25, v.loc.x, v.loc.y, v.loc.z - 0.95, 0, 0, 0, 0, 0, 0, 0.50, 0.50, 10.3, 255, 255, 255, 140, 0, 0, 1, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(v.loc.x, v.loc.y, v.loc.z, GetEntityCoords(PlayerPedId())) < 1 then
					fsn_drawText3D(v.loc.x, v.loc.y, v.loc.z, "[E] pickup "..v.weapon.name)
					if IsControlJustPressed(0, 38) then
						TriggerServerEvent('fsn_criminalmisc:weapons:pickup', v.dropid)
					end
				end 
			end
		end
	end
end)

RegisterNetEvent('fsn_police:search:strip')
AddEventHandler('fsn_police:search:strip', function()
  TriggerEvent('fsn_inventory:empty')
  RemoveAllPedWeapons(PlayerPedId())
  TriggerEvent('fsn_bank:change:bankandwallet', 0, false)
  myWeapons = {}
  ExecuteCommand('save')
end)

RegisterNetEvent('fsn_police:search:start:weapons')
AddEventHandler('fsn_police:search:start:weapons', function(officerid)
  TriggerServerEvent('fsn_police:search:end:weapons', myWeapons, officerid)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		for k,v in pairs(myWeapons) do
			v.ammo = GetAmmoInPedWeapon(PlayerPedId(), v.hash)
		end
	end
end)
