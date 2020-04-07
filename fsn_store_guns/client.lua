local menuEnabled = false

local stores = {
  {x = 20.658050537109, y = -1106.4268798828, z = 29.797029495239, dm=false},
  {x = 252.50720214844, y = -48.169807434082, z = 69.941047668457, dm=false},
  {x = -1305.5524902344, y = -392.48916625977, z = 36.695766448975, dm=false},
  {x = -3172.5053710938, y = 1086.0944824219, z = 20.83874130249, dm=false},
  {x = -331.59213256836, y = 6082.30859375, z = 31.454767227173, dm=false},
  {x = 1692.4958496094, y = 3758.3500976563, z = 34.705307006836, dm=false},
  {x = 2569.7351074219, y = 294.61560058594, z = 108.73488616943, dm=false},
  {x = 844.45977783203, y = -1033.3918457031, z = 28.194868087769, dm=false},
  {x = -664.06213378906, y = -935.31024169922, z = 21.829229354858, dm=false},
  {x = 812.17529296875, y = -2157.5158691406, z = 29.619016647339, dm=false},
  --{x = -1804.9047851563, y = 437.09829711914, z = 128.7074432373, dm=true},
{x = -1119.0673828125, y = 2697.0854492188, z = 18.554151535034, dm=false}
}

local store_items = {
  WEAPON_KNIFE = 500,
  WEAPON_HAMMER = 250,
  WEAPON_BAT = 250,
  WEAPON_CROWBAR = 250,
  WEAPON_PISTOL = 1250,
  WEAPON_FLASHLIGHT = 250,
  WEAPON_GOLFCLUB = 150,
  WEAPON_PETROLCAN = 150,
  WEAPON_FLARE = 250,
  WEAPON_BALL = 10,
  WEAPON_FIREEXTINGUISHER = 250,
  WEAPON_COMBATPISTOL = 1500,
  WEAPON_VINTAGEPISTOL = 500,
  WEAPON_PISTOL50 = 4000,
  GADGET_PARACHUTE = 1000,
  WEAPON_STUNGUN = 2500,
}

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

function ToggleActionMenu(dm)
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then
		SetNuiFocus( true, true )
		SendNUIMessage({
			showmenu = true,
      dm = dm
		})
	else
		SetNuiFocus( false )
		SendNUIMessage({
			hidemenu = true
		})
	end
end

RegisterNUICallback( "ButtonClick", function( data, cb )
	if ( data == "exit" ) then
		ToggleActionMenu()
		return
	else
		local split = fsn_SplitString(data, '-')
		if split[1] == 'buy' then
			local item = split[2]
      local money = 0
      local price = 0
      local dm = false
      for k,v in pairs(stores) do
        if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
          if v.dm then
            money = exports.fsn_inventory:fsn_GetItemAmount('dirty_money')
            price = store_items[split[2]] * 2
            dm = true
          else
            money = exports.fsn_main:fsn_GetWallet()
            price = store_items[split[2]]
			if not exports["fsn_licenses"]:fsn_hasLicense('weapon') then
				TriggerEvent('fsn_notify:displayNotification', 'Come back with a weapons license', 'centerLeft', 5000, 'error')
				return
			end
			if exports["fsn_licenses"]:fsn_getLicensePoints('weapon') >= 15then
				TriggerEvent('fsn_notify:displayNotification', 'You have 15 or more points on your license, you cannot purchase a weapon.', 'centerLeft', 5000, 'error')
				return
			end
          end
        end
      end
      if money >= price then
        local weaponHash = GetHashKey(split[2])
        if HasPedGotWeapon(GetPlayerPed(-1), weaponHash) then
          GiveWeaponToPed(GetPlayerPed(-1), weaponHash, 250, false, true)
          TriggerEvent('fsn_notify:displayNotification', 'You already have this weapon so you bought some ammo for half the price', 'centerLeft', 3000, 'info')
          if dm then
            TriggerEvent('fsn_inventory:item:take', 'dirty_money', price / 2)
          else
            TriggerEvent('fsn_bank:change:walletMinus', price / 2)
          end
        else
          --GiveWeaponToPed(GetPlayerPed(-1), weaponHash, 250, false, true)
		  TriggerEvent('fsn_criminalmisc:weapons:add', weaponHash, 250)
          TriggerEvent('fsn_notify:displayNotification', 'You bought <b>'..split[2], 'centerLeft', 3000, 'info')
          if dm then
            TriggerEvent('fsn_inventory:item:take', 'dirty_money', price)
          else
            TriggerEvent('fsn_bank:change:walletMinus', price)
          end
        end
      else
        TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this', 'centerLeft', 3000, 'error')
      end
		else
			--??
		end
	end
end )

Citizen.CreateThread( function()
  for k, store in pairs(stores) do
    if not store.dm then
      local blip = AddBlipForCoord(store.x, store.y, store.z)
      SetBlipSprite(blip, 110)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Gun Store")
      EndTextCommandSetBlipName(blip)
    else
      --local blip = AddBlipForCoord(store.x, store.y, store.z)
      SetBlipSprite(blip, 277)
      SetBlipColour(blip, 1)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Unknown")
      EndTextCommandSetBlipName(blip)
    end
  end
	while true do
		Citizen.Wait(0)
		for k, v in pairs(stores) do
			if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        if v.dm then
          if exports.fsn_inventory:fsn_HasItem('dirty_money') then
            DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
            if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
              SetTextComponentFormat("STRING")
            	AddTextComponentString("Press ~INPUT_PICKUP~ to view the ~y~store")
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
              if IsControlJustPressed(0,38) then
    						ToggleActionMenu(true)
    					end
    				end
          end
        else
          DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
          if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to view the ~y~store")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,38) then
  						ToggleActionMenu(false)
  					end
  				end
        end
			end
		end
	end
end )

function chatPrint( msg )
	TriggerEvent( 'chatMessage', "ActionMenu", { 255, 255, 255 }, msg )
end
