-- shared functions
function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
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
menuEnabled = false
function ToggleActionMenu()
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then
		SetNuiFocus( true, true )
		SendNUIMessage({
			showmenu = true
		})
	else
		SetNuiFocus( false )

		SendNUIMessage({
			hidemenu = true
		})
	end
end
local last_click = 0

RegisterNetEvent('fsn_properties:buy')
RegisterNetEvent('fsn_properties:menu:access:allow')
RegisterNetEvent('fsn_properties:menu:access:view')
RegisterNetEvent('fsn_properties:menu:access:revoke')
RegisterNetEvent('fsn_properties:menu:inventory:deposit')
RegisterNetEvent('fsn_properties:menu:inventory:take')
RegisterNetEvent('fsn_properties:menu:weapon:deposit')
RegisterNetEvent('fsn_properties:menu:weapon:take')
RegisterNetEvent('fsn_properties:menu:money:withdraw')
RegisterNetEvent('fsn_properties:menu:money:deposit')
RegisterNetEvent('fsn_properties:menu:police:search')
RegisterNetEvent('fsn_properties:menu:police:seize')
RegisterNetEvent('fsn_properties:menu:police:empty')
RegisterNetEvent('fsn_properties:menu:police:breach')
RegisterNetEvent('fsn_properties:menu:rent:check')
RegisterNetEvent('fsn_properties:menu:rent:pay')
RegisterNetEvent('fsn_properties:menu:robbery')
local last_click = 0
RegisterNUICallback( "ButtonClick", function( data, cb )
  if last_click + 1000 > GetNetworkTime() then print('toosoon') return end
  last_click = GetNetworkTime()
  local split = fsn_SplitString(data, "-")
  if split[1] == 'buy' then
    local id = tonumber(split[2])
    TriggerEvent('fsn_properties:buy', id)
  end
  if split[1] == 'robbery' then
    local id = tonumber(split[2])
    TriggerEvent('fsn_properties:menu:robbery', id)
  end
  ------------------------------- ACCESS
  if split[1] == 'access' then
    if split[2] == 'allow' then
      TriggerEvent('fsn_properties:menu:access:allow', tonumber(split[3]))
    end
    if split[2] == 'view' then
      TriggerEvent('fsn_properties:menu:access:view', tonumber(split[3]))
    end
    if split[2] == 'revoke' then
      TriggerEvent('fsn_properties:menu:access:revoke', tonumber(split[3]))
    end
  end
  ------------------------------- INVENTORY
  if split[1] == 'item' then
    if split[2] == 'deposit' then
      TriggerEvent('fsn_properties:menu:inventory:deposit', tonumber(split[3]))
    end
    if split[2] == 'take' then
      TriggerEvent('fsn_properties:menu:inventory:take', split[3], tonumber(split[4]))
    end
  end
  ------------------------------- WEAPONS
  if split[1] == 'weapon' then
    if split[2] == 'deposit' then
      TriggerEvent('fsn_properties:menu:weapon:deposit', tonumber(split[3]))
    end
    if split[2] == 'take' then
      TriggerEvent('fsn_properties:menu:weapon:take', tonumber(split[4]), split[3])
    end
  end
  ------------------------------- MONEY
  if split[1] == 'money' then
    if split[2] == 'withdraw' then
      TriggerEvent('fsn_properties:menu:money:withdraw', tonumber(split[3]))
    end
    if split[2] == 'deposit' then
      TriggerEvent('fsn_properties:menu:money:deposit', tonumber(split[3]))
    end
  end
  ------------------------------- POLICE
  if split[1] == 'police' then
    if split[2] == 'search' then
      TriggerEvent('fsn_properties:menu:police:search', tonumber(split[3]))
    end
    if split[2] == 'seize' then
      TriggerEvent('fsn_properties:menu:police:seize', tonumber(split[3]))
    end
    if split[2] == 'empty' then
      TriggerEvent('fsn_properties:menu:police:empty', tonumber(split[3]))
    end
    if split[2] == 'breach' then
      TriggerEvent('fsn_properties:menu:police:breach', tonumber(split[3]))
    end
  end
  if split[1] == 'rent' then
    if split[2] == 'check' then
      TriggerEvent('fsn_properties:menu:rent:check', tonumber(split[3]))
    end
    if split[2] == 'pay' then
      TriggerEvent('fsn_properties:menu:rent:pay', tonumber(split[3]))
    end
  end
  if ( data == "exit" ) then
		ToggleActionMenu()
		return
	end
	ToggleActionMenu()
end )
