local intrunk = false
local invehtrunk = false
local offsets = {
	[1] = { ["name"] = "taxi", ["yoffset"] = 0.0, ["zoffset"] = -0.5 },
    [2] = { ["name"] = "buccaneer", ["yoffset"] = 0.5, ["zoffset"] = 0.0 },
    [3] = { ["name"] = "peyote", ["yoffset"] = 0.35, ["zoffset"] = -0.15 },
    [4] = { ["name"] = "regina", ["yoffset"] = 0.2, ["zoffset"] = -0.35 },
    [5] = { ["name"] = "pigalle", ["yoffset"] = 0.2, ["zoffset"] = -0.15 },
    [6] = { ["name"] = "pol3", ["yoffset"] = 0.1, ["zoffset"] = -0.2 },
    [7] = { ["name"] = "glendale", ["yoffset"] = 0.0, ["zoffset"] = -0.35 },
}

function TrunkOffset(veh)
    for i=1,#offsets do
        if GetEntityModel(veh) == GetHashKey(offsets[i]["name"]) then
            return i
        end
    end
    return 0
end

local cam = 0
function SetupTrunkCam()
    if(not DoesCamExist(cam)) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
        SetCamRot(cam, 0.0, 0.0, 0.0)
        SetCamActive(cam,  true)
        RenderScriptCams(true,  false,  0,  true,  true)
        SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
    end
    AttachCamToEntity(cam, GetPlayerPed(-1), 1.5, -3.5, 2.0, true)
    SetCamRot(cam, -20.0, 0.0, GetEntityHeading(GetPlayerPed(-1)) )
end

function DestroyTrunkCam()
	RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
	DoScreenFadeIn(1000)
end

function GetInTrunk(veh)
	DetachEntity(GetPlayerPed(-1))
	local d1,d2 = GetModelDimensions(GetEntityModel(veh))
	if d2["z"] > 1.4 then
		return
	end

	invehtrunk = veh
	
	RequestAnimDict("fin_ext_p1-7")
	while not HasAnimDictLoaded("fin_ext_p1-7") do
		Citizen.Wait(0)
	end
		
	SetBlockingOfNonTemporaryEvents(GetPlayerPed(-1), true)      
	SetPedSeeingRange(GetPlayerPed(-1), 0.0)     
	SetPedHearingRange(GetPlayerPed(-1), 0.0)        
	SetPedFleeAttributes(GetPlayerPed(-1), 0, false)     
	SetPedKeepTask(GetPlayerPed(-1), true)   
	DetachEntity(GetPlayerPed(-1))
	ClearPedTasks(GetPlayerPed(-1))
	
	TaskPlayAnim(GetPlayerPed(-1), "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
	
	local OffSet = TrunkOffset(veh)
	if OffSet > 0 then
		AttachEntityToEntity(GetPlayerPed(-1), veh, 0, -0.1,(d1["y"]+0.85) + offsets[OffSet]["yoffset"],(d2["z"]-0.87) + offsets[OffSet]["zoffset"], 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
	else
		AttachEntityToEntity(GetPlayerPed(-1), veh, 0, -0.1,d1["y"]+0.85,d2["z"]-0.87, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
	end
	SetupTrunkCam()
	DoScreenFadeIn(1000)
end

RegisterNetEvent('fsn_vehiclecontrol:trunk:forceIn')
AddEventHandler('fsn_vehiclecontrol:trunk:forceIn', function(netid)
	print'im being forced into a vehicle'
	if NetworkDoesEntityExistWithNetworkId(netid) then
		local veh = NetworkGetEntityFromNetworkId(netid)
		DoScreenFadeOut(500)
		GetInTrunk(veh)
		intrunk = veh
	else
		print('no entity exists with netid: '..tostring(netid))
	end
end)

RegisterNetEvent('fsn_vehiclecontrol:trunk:forceOut')
AddEventHandler('fsn_vehiclecontrol:trunk:forceOut', function()
	if intrunk then
		local d1,d2 = GetModelDimensions(GetEntityModel(invehtrunk))
		local troonk = GetOffsetFromEntityInWorldCoords(invehtrunk, 0.0,d1["y"]-0.2,0.0)
	
		DoScreenFadeOut(500)
		DetachEntity(GetPlayerPed(-1))
		ClearPedTasks(GetPlayerPed(-1))
		SetEntityCoords(GetPlayerPed(-1), troonk.x, troonk.y, troonk.z)
		if GetEntitySpeed(veh) > 5 then
			SetPedToRagdoll(GetPlayerPed(-1), 1, 5000, 0, 0, 0, 0)
		end
		intrunk = false
		DestroyTrunkCam()
	end
end)

Util.Tick(function()
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
			local veh = fsn_lookingAt()
			if veh and not intrunk then
				if not DoesVehicleHaveDoor(veh, 6) and DoesVehicleHaveDoor(veh, 5) and IsThisModelACar(GetEntityModel(veh)) and GetVehicleDoorsLockedForPlayer(veh, PlayerId()) == false then
					local d1,d2 = GetModelDimensions(GetEntityModel(veh))
					local troonk = GetOffsetFromEntityInWorldCoords(veh, 0.0,d1["y"]-0.2,0.0)
					if GetDistanceBetweenCoords(troonk.x, troonk.y, troonk.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
						if exports["fsn_ems"]:carryingWho() ~= 0  then
							Util.DrawText3D(troonk.x, troonk.y, troonk.z, '[E] Put '..exports["fsn_ems"]:carryingWho()..' in trunk', {255, 255, 255, 140}, 0.3)
							if IsControlJustPressed(0,38) then
								TriggerServerEvent('fsn_ems:carry:end', exports["fsn_ems"]:carryingWho())
								TriggerServerEvent('fsn_vehiclecontrol:trunk:forceIn', exports["fsn_ems"]:carryingWho(), NetworkGetNetworkIdFromEntity(veh))
							end
						else
							Util.DrawText3D(troonk.x, troonk.y, troonk.z+0.5, '[E] Get In\n[H] Access Trunk', {255, 255, 255, 200}, 0.2)
							if IsControlJustPressed(0,38) then
								DoScreenFadeOut(500)
								GetInTrunk(veh)
								intrunk = veh
							end
							if IsControlJustPressed(0,74) then
								TriggerServerEvent('fsn_inventory:veh:request', GetVehicleNumberPlateText(veh), 'trunk')
							end
						end
					end
				end
			elseif intrunk then
				local veh = intrunk
				local d1,d2 = GetModelDimensions(GetEntityModel(veh))
				local troonk = GetOffsetFromEntityInWorldCoords(veh, 0.0,d1["y"]-0.2,0.0)
				Util.DrawText3D(troonk.x, troonk.y, troonk.z, '[E] Get Out', {255, 255, 255, 140}, 0.3)
				if IsControlJustPressed(0,38) then
					DoScreenFadeOut(500)
					DetachEntity(GetPlayerPed(-1))
					ClearPedTasks(GetPlayerPed(-1))
					SetEntityCoords(GetPlayerPed(-1), troonk.x, troonk.y, troonk.z)
					if GetEntitySpeed(veh) > 5 then
						SetPedToRagdoll(GetPlayerPed(-1), 1, 5000, 0, 0, 0, 0)
					end
					intrunk = false
					DestroyTrunkCam()
				end
			end
		end
end)
