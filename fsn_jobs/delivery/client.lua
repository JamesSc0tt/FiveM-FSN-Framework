local startpos = {x = 78.926086425781, y = 111.87384033203, z = 81.168174743652}
local vanpos = {x = 62.564468383789, y = 122.1368560791, z = 79.058258056641}

local isdelivering = false
local mystops = 0
local donestops = 0
local myvan = false
local packageinhand = false

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

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if GetDistanceBetweenCoords(startpos.x,startpos.y,startpos.z,GetEntityCoords(PlayerPedId()), true) < 10 then
			DrawMarker(1,startpos.x,startpos.y,startpos.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(startpos.x,startpos.y,startpos.z,GetEntityCoords(PlayerPedId()), true) < 1 then
				if isdelivering then
					SetTextComponentFormat("STRING")
					AddTextComponentString("~r~You are currently out on delivery, finish your job")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				else
				SetTextComponentFormat("STRING")
				AddTextComponentString("Press ~INPUT_PICKUP~ to start delivering")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustPressed(0,38) then
						if exports["fsn_licenses"]:fsn_hasLicense("driver") then
							local res = 0
							Citizen.CreateThread(function()
							  DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
							  local editOpen = true
							  while UpdateOnscreenKeyboard() == 0 or editOpen do
								Wait(0)
								drawTxt('How many stops will you be doing today?',4,1,0.5,0.30,0.7,255,255,255,255)
								drawTxt('~b~Our delivery drivers earn on average of ~g~$350~b~ per delivery',4,1,0.5,0.35,0.4,255,255,255,255)
								drawTxt('~r~YOU WILL BE CHARGED FOR DELIVERIES YOU DO NOT COMPLETE!',4,1,0.5,0.49,0.4,255,255,255,255)
								if UpdateOnscreenKeyboard() ~= 0 then
								  editOpen = false
								  if UpdateOnscreenKeyboard() == 1 then
									if tonumber(GetOnscreenKeyboardResult()) then
										res = tonumber(GetOnscreenKeyboardResult())
										mystops = res
										if mystops > 0 then
											local model = 'boxville2'
											RequestModel(model)
											while not HasModelLoaded(model) do
												Wait(1)
											end
											local personalvehicle = CreateVehicle(model, vanpos.x, vanpos.y, vanpos.z, vanpos.h, true, false)
											TriggerEvent('fsn_fuel:update', GetVehicleNumberPlateText(personalvehicle), 100)
											myvan = personalvehicle
											SetModelAsNoLongerNeeded(model)
											SetVehicleOnGroundProperly(personalvehicle)
											SetVehicleHasBeenOwnedByPlayer(personalvehicle, true)
											local id = NetworkGetNetworkIdFromEntity(personalvehicle)
											SetNetworkIdCanMigrate(id, true)
											TriggerEvent('fsn_notify:displayNotification', 'Get your van from the garage!', 'centerRight', 4000, 'info')
											TriggerEvent('fsn_cargarage:makeMine', myvan, GetDisplayNameFromVehicleModel(GetEntityModel(myvan)), GetVehicleNumberPlateText(myvan))
											isdelivering = true
											fsn_SetJob('GoPostal Driver')
										end
									else
										mystops = 0
										TriggerEvent('fsn_notify:displayNotification', 'You need to enter a number', 'centerRight', 4000, 'error')
									end
								  end
								  break
								end
							  end
							end)
						else
							TriggerEvent('fsn_notify:displayNotification', 'You need a driver\'s license to do this work!', 'centerRight', 4000, 'error')
						end
					end
				end
			end
		end
	end
end)