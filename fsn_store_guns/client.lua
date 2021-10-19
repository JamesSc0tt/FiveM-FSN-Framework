local stores = {
  {id='ply_owner', x = 20.658050537109, y = -1106.4268798828, z = 29.797029495239,busy=false},
  {id='ply_owner', x = 252.50720214844, y = -48.169807434082, z = 69.941047668457,busy=false},
  {id='ply_owner', x = -1305.5524902344, y = -392.48916625977, z = 36.695766448975,busy=false},
  {id='ply_owner', x = -3172.5053710938, y = 1086.0944824219, z = 20.83874130249,busy=false},
  {id='ply_owner', x = -331.59213256836, y = 6082.30859375, z = 31.454767227173,busy=false},
  {id='ply_owner', x = 1692.4958496094, y = 3758.3500976563, z = 34.705307006836,busy=false},
  {id='ply_owner', x = 2569.7351074219, y = 294.61560058594, z = 108.73488616943,busy=false},
  {id='ply_owner', x = 844.45977783203, y = -1033.3918457031, z = 28.194868087769,busy=false},
  {id='ply_owner', x = -664.06213378906, y = -935.31024169922, z = 21.829229354858,busy=false},
  {id='ply_owner', x = 812.17529296875, y = -2157.5158691406, z = 29.619016647339,busy=false},
  {id='ply_owner', x = -1119.0673828125, y = 2697.0854492188, z = 18.554151535034,busy=false},
}

local requireLicense = false

Util.Tick(function()
  for k, s in pairs(stores) do
    if GetDistanceBetweenCoords(s.x,s.y,s.z,GetEntityCoords(PlayerPedId()),true) < 10 then
      DrawMarker(25, s.x,s.y,s.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
      if GetDistanceBetweenCoords(s.x,s.y,s.z,GetEntityCoords(PlayerPedId()),true) < 1 then
        if not s.busy then
          Util.DrawText3D(s.x,s.y,s.z, '[E] Access Store', {255,255,255,200}, 0.25)
          if IsControlJustReleased(0, Util.GetKeyNumber('E')) then
            if requireLicense and not exports["fsn_licenses"]:fsn_hasLicense('weapon') then
              TriggerEvent('fsn_notify:displayNotification', 'This store requires a <b>WEAPON</b> license!', 'centerLeft', 3000, 'error')
            else 
              TriggerServerEvent('fsn_store_guns:request', s.id)
            end
          end 
        else
          Util.DrawText3D(s.x,s.y,s.z, '~r~Store in use\nplease try again later', {255,255,255,200}, 0.25)
        end
      end
    end
  end
end)

Citizen.CreateThread( function()
  for k, store in pairs(stores) do
      local blip = AddBlipForCoord(store.x, store.y, store.z)
      SetBlipSprite(blip, 110)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Gun Store")
      EndTextCommandSetBlipName(blip)
  end
end)

-- If you want a spot to buy a wep license leave all this code below here. If not just comment it out or delete it. This sets a spot in the gunstore by PDM

local weaponLicLocation = vector3(14.055945396423, -1105.7650146484, 29.797029495239)

Citizen.CreateThread(function()
	
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local playerPos = GetEntityCoords(playerPed)
    local dist = Util.GetVecDist(playerPos, weaponLicLocation)
    local weaponLicenseprice = 5000
    local money = 0

    if dist < 2.0 then
			Util.DrawText3D(weaponLicLocation.x, weaponLicLocation.y, weaponLicLocation.z, 'Press ~g~[ E ] ~s~ to buy a weapon\'s license for ~g~$~w~'..weaponLicenseprice,{255,255,255,200}, 0.25)
      money = exports.fsn_main:fsn_GetWallet()
      
      if IsControlJustPressed(0, 38) then
        if money >= weaponLicenseprice then
				  if not exports["fsn_licenses"]:fsn_hasLicense('weapon') then
					  TriggerEvent('fsn_licenses:police:give', 'weapon')
					  --TriggerEvent('fsn_notify:displayNotification', 1, 'You were granted a <b>Weapons License</b> with 0 infractions', 'centerRight', 7000, 'info')
					  exports['mythic_notify']:DoCustomHudText('success', 'You bought a weapons license with 0 infractions!', 4000)
					  TriggerEvent('fsn_bank:change:walletMinus', weaponLicenseprice)
				  else
					  --TriggerEvent('fsn_notify:displayNotification', 1, 'You already have a weapons license', 'centerRight', 7000, 'info')
					  exports['mythic_notify']:DoCustomHudText('error', 'You already have a weapons license!', 4000)
          end
        else
          exports['mythic_notify']:DoCustomHudText('error', 'You can not afford this!', 5000)
        end
			end
		end
	end
end)