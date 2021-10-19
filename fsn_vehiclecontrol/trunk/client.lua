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
        SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
        SetCamRot(cam, 0.0, 0.0, 0.0)
        SetCamActive(cam,  true)
        RenderScriptCams(true,  false,  0,  true,  true)
        SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
    end
    AttachCamToEntity(cam, PlayerPedId(), 1.5, -3.5, 2.0, true)
    SetCamRot(cam, -20.0, 0.0, GetEntityHeading(PlayerPedId()) )
end

function DestroyTrunkCam()
	RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
	DoScreenFadeIn(1000)
end

function GetInTrunk(veh)
	DetachEntity(PlayerPedId())
	local d1,d2 = GetModelDimensions(GetEntityModel(veh))
	if d2["z"] > 1.4 then
		return
	end

	invehtrunk = veh
	
	RequestAnimDict("fin_ext_p1-7")
	while not HasAnimDictLoaded("fin_ext_p1-7") do
		Citizen.Wait(0)
	end
		
	SetBlockingOfNonTemporaryEvents(PlayerPedId(), true)      
	SetPedSeeingRange(PlayerPedId(), 0.0)     
	SetPedHearingRange(PlayerPedId(), 0.0)        
	SetPedFleeAttributes(PlayerPedId(), 0, false)     
	SetPedKeepTask(PlayerPedId(), true)   
	DetachEntity(PlayerPedId())
	ClearPedTasks(PlayerPedId())
	
	TaskPlayAnim(PlayerPedId(), "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
	
	local OffSet = TrunkOffset(veh)
	if OffSet > 0 then
		AttachEntityToEntity(PlayerPedId(), veh, 0, -0.1,(d1["y"]+0.85) + offsets[OffSet]["yoffset"],(d2["z"]-0.87) + offsets[OffSet]["zoffset"], 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
	else
		AttachEntityToEntity(PlayerPedId(), veh, 0, -0.1,d1["y"]+0.85,d2["z"]-0.87, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
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
		DetachEntity(PlayerPedId())
		ClearPedTasks(PlayerPedId())
		SetEntityCoords(PlayerPedId(), troonk.x, troonk.y, troonk.z)
		if GetEntitySpeed(veh) > 5 then
			SetPedToRagdoll(PlayerPedId(), 1, 5000, 0, 0, 0, 0)
		end
		intrunk = false
		DestroyTrunkCam()
	end
end)

--[[
	Set vehicle models here that you do NOT want players to be able to get into their trunks. 
	For example the trash truck Even though it has a trunk it makes no sense to get into it right
]]
local blacklistedVehicles = {
	'trash' -- TrashMaster from the garbage job
}

Util.Tick(function()
	if not IsPedInAnyVehicle(PlayerPedId()) then
			local veh = fsn_lookingAt()
			-- Check if the vehicle is blacklisted and compare it to the vehicle you are looking at
			for k, car in pairs(blacklistedVehicles) do
				blacklistedCar = GetHashKey(car)
				vehmodel = GetEntityModel(veh)
				if vehmodel == blacklistedCar then
					veh = nil
					break
				end
			end
			if veh and not intrunk then
				if not DoesVehicleHaveDoor(veh, 6) and DoesVehicleHaveDoor(veh, 5) and IsThisModelACar(GetEntityModel(veh)) and GetVehicleDoorsLockedForPlayer(veh, PlayerId()) == false then
					local d1,d2 = GetModelDimensions(GetEntityModel(veh))
					local troonk = GetOffsetFromEntityInWorldCoords(veh, 0.0,d1["y"]-0.2,0.0)
					if GetDistanceBetweenCoords(troonk.x, troonk.y, troonk.z, GetEntityCoords(PlayerPedId()), true) < 1 then
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
					DetachEntity(PlayerPedId())
					ClearPedTasks(PlayerPedId())
					SetEntityCoords(PlayerPedId(), troonk.x, troonk.y, troonk.z)
					if GetEntitySpeed(veh) > 5 then
						SetPedToRagdoll(PlayerPedId(), 1, 5000, 0, 0, 0, 0)
					end
					intrunk = false
					DestroyTrunkCam()
				end
			end
		end
end)
