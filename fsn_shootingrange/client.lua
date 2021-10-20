function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
local range = {x = 12.377730369568, y = -1099.5345458984, z = 29.797027587891}
local ranges = {
  [1] = {inuse=false,loc={x = 8.4415864944458, y = -1095.2994384766, z = 29.834543228149, h = 336.54846191406}},
  [2] = {inuse=false,loc={x = 9.3716773986816, y = -1095.6260986328, z = 29.834558486938, h = 345.27816772461}},
  [3] = {inuse=false,loc={x = 10.339754104614, y = -1095.9066162109, z = 29.834619522095, h = 338.00933837891}},
  [4] = {inuse=false,loc={x = 11.1967420578, y = -1096.2221679688, z = 29.834644317627, h = 329.2360534668}},
  [5] = {inuse=false,loc={x = 15.823736190796, y = -1097.9860839844, z = 29.834819793701, h = 331.80352783203}},
  [6] = {inuse=false,loc={x = 16.812646865845, y = -1098.3410644531, z = 29.834842681885, h = 331.81686401367}},
  [7] = {inuse=false,loc={x = 17.761032104492, y = -1098.6226806641, z = 29.834899902344, h = 333.25262451172}},
  [8] = {inuse=false,loc={x = 18.791498184204, y = -1099.0651855469, z = 29.834928512573, h = 333.07080078125}}
}
local lasttarget = 0
local inrange = false
local currenttarget = false
local targets = {
  [1] = {hash=-58618026,loc={x = 21.266675949097, y = -1091.4289550781, z = 29.796955108643, h = 153.48428344727}},
  [2] = {hash=-58618026,loc={x = 19.882585525513, y = -1090.9522705078, z = 29.797023773193, h = 153.84771728516}},
  [3] = {hash=104571594,loc={x = 22.355573654175, y = -1082.1015625, z = 29.797029495239, h = 159.56182861328}},
  [4] = {hash=1741284929,loc={x = 20.907932281494, y = -1081.6898193359, z = 29.797029495239, h = 165.92581176758}},
  [5] = {hash=-58618026,loc={x = 15.272421836853, y = -1079.6857910156, z = 29.843517303467, h = 151.82936096191}},
  [6] = {hash=104571594,loc={x = 16.726470947266, y = -1080.1750488281, z = 29.797027587891, h = 166.9317779541}},
  [7] = {hash=1741284929,loc={x = 18.902379989624, y = -1068.4865722656, z = 29.797027587891, h = 159.13600158691}},
  [8] = {hash=-58618026,loc={x = 28.2692527771, y = -1072.0395507813, z = 29.797023773193, h = 154.90347290039}},
  [9] = {hash=104571594,loc={x = 22.517183303833, y = -1069.9752197266, z = 29.797023773193, h = 161.59638977051}},
  [10] = {hash=1741284929,loc={x = 16.31834602356, y = -1089.5882568359, z = 29.797029495239, h = 157.49235534668}},
  [11] = {hash=-58618026,loc={x = 24.26784324646, y = -1082.4281005859, z = 29.797029495239, h = 162.89242553711}},
  [12] = {hash=104571594,loc={x = 15.326369285583, y = -1079.6533203125, z = 29.797029495239, h = 152.5389251709}},
}
function gunrange_start()
  for k, v in pairs(ranges) do
    if v.inuse then
      print(':fsn_shootingrange: Range #'..k..' is in use')
    else
      print(':fsn_shootingrange: Range #'..k..' is not in use, joining range')
      gunrange_join(k)
      return
    end
  end
  TriggerEvent('fsn_notify:displayNotification', 'There are no ranges available, try again later.', 'centerLeft', 4000, 'error')
end
function gunrange_join(rid)
  SetEntityCoords(PlayerPedId(), ranges[rid].loc.x, ranges[rid].loc.y, ranges[rid].loc.z-1)
  SetEntityHeading(PlayerPedId(), ranges[rid].loc.h)
  FreezeEntityPosition(PlayerPedId(), true)
  inrange = true
  gunrange_CreateTarget(0)
end
function gunrange_leave()
  if currenttarget then
    DeleteObject(currenttarget)
  end
  SetEntityCoords(PlayerPedId(), range.x, range.y, range.z)
  inrange = false
  lasttarget = 0
  FreezeEntityPosition(PlayerPedId(), false)
end
function gunrange_CreateTarget(lastid)
  print('creating new target')
  if targets[lastid] or lastid == 0 then
    if currenttarget then
      DeleteObject(currenttarget)
    end
    local newid = math.random(1, #targets)
    if newid == lastid then
      gunrange_CreateTarget(lastid)
    end
    lasttarget = newid
    local newtarget = targets[newid]
    RequestModel(newtarget.hash)
    while not HasModelLoaded(newtarget.hash) do
      drawTxt(1.24, 1.44, 1.0,1.0,0.4, "~r~Loading your next target...", 255, 255, 255, 255)
      print('loading model')
      Wait(1)
    end
    local object = CreateObject(newtarget.hash, newtarget.loc.x, newtarget.loc.y, newtarget.loc.z, true, true, true)
    currenttarget = object
    SetEntityHeading(currenttarget, newtarget.loc.h)
    TriggerEvent('fsn_notify:displayNotification', 'Target created...', 'centerRight', 3000, 'info')
  else
    print('no target')
  end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if inrange then
      local created = false
      if IsPedShooting(PlayerPedId()) then
        if not created then
          created = true
          gunrange_CreateTarget(lasttarget)
        end
      else
        if created then
          created = false
        end
      end
      SetTextComponentFormat("STRING")
      AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~leave~w~ the range")
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)
      if IsControlJustPressed(0, 51) then
        gunrange_leave()
      end
    end
    if GetDistanceBetweenCoords(range.x, range.y, range.z, GetEntityCoords(PlayerPedId()), true) < 10 then
      DrawMarker(1,range.x, range.y, range.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
      if GetDistanceBetweenCoords(range.x, range.y, range.z, GetEntityCoords(PlayerPedId()), true) < 1 then
        SetTextComponentFormat("STRING")
        AddTextComponentString("Press ~INPUT_PICKUP~ to access the range (~g~$500~w~)")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        if IsControlJustPressed(0, 51) then
          gunrange_start()
        end
      end
    end
  end
end)
