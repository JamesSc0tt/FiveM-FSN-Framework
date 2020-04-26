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
    if GetDistanceBetweenCoords(s.x,s.y,s.z,GetEntityCoords(GetPlayerPed(-1)),true) < 10 then
      DrawMarker(25, s.x,s.y,s.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
      if GetDistanceBetweenCoords(s.x,s.y,s.z,GetEntityCoords(GetPlayerPed(-1)),true) < 1 then
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