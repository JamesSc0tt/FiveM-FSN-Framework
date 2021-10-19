--GetWorldPositionOfEntityBone 
local inspectSelf = true

local pedState = {}
function updateState()
	if pedState[GetPlayerServerId(PlayerId())] and #pedState[GetPlayerServerId(PlayerId())] > 0 then
		TriggerServerEvent('fsn_evidence:ped:update', pedState[GetPlayerServerId(PlayerId())])
	end
end
RegisterNetEvent('fsn_evidence:ped:update')
AddEventHandler('fsn_evidence:ped:update', function(ply, tbl)
	for k,v in pairs(tbl) do
		local ass = tbl[k]['ttl'] * 1000
		local tyme = GetGameTimer()+ass
		tbl[k]['expire'] = tyme
	end
	pedState[ply] = tbl
end)
RegisterNetEvent('fsn_evidence:ped:addState')
AddEventHandler('fsn_evidence:ped:addState', function(state, bone, ttl)
	print('addstate: '..state)
	if not ttl then
		ttl = 60
	end
	if not pedState[GetPlayerServerId(PlayerId())] then
		pedState[GetPlayerServerId(PlayerId())] = {}
	end
	pedState[GetPlayerServerId(PlayerId())][#pedState[GetPlayerServerId(PlayerId())]+1] = {
		state = state,
		bone = bone,
		ttl = ttl
	}
	updateState()
end)

local BodyParts = {
    ['HEAD'] = { label = 'Head', causeLimp = false, isDamaged = false, severity = 0, index = 'BONETAG_HEAD'},
    ['NECK'] = { label = 'Neck', causeLimp = false, isDamaged = false, severity = 0, index = 'BONETAG_NECK'},
    ['SPINE'] = { label = 'Spine', causeLimp = true, isDamaged = false, severity = 0, index = 'BONETAG_SPINE'},
    ['UPPER_BODY'] = { label = 'Upper Body', causeLimp = false, isDamaged = false, severity = 0, index = 'BONETAG_SPINE2'},
    ['LOWER_BODY'] = { label = 'Lower Body', causeLimp = true, isDamaged = false, severity = 0, index = 'BONETAG_SPINE_ROOT'},
    ['LARM'] = { label = 'Left Arm', causeLimp = false, isDamaged = false, severity = 0, index = 'BONETAG_L_UPPERARM'},
    ['LHAND'] = { label = 'Left Hand', causeLimp = false, isDamaged = false, severity = 0, index = 'BONETAG_L_HAND' },
    ['LFINGER'] = { label = 'Left Hand Fingers', causeLimp = false, isDamaged = false, severity = 0, index = 'BONETAG_L_FINGER01'},
    ['LLEG'] = { label = 'Left Leg', causeLimp = true, isDamaged = false, severity = 0, index = 'BONETAG_L_CALF'},
    ['LFOOT'] = { label = 'Left Foot', causeLimp = true, isDamaged = false, severity = 0, index ='BONETAG_L_FOOT'},
    ['RARM'] = { label = 'Right Arm', causeLimp = false, isDamaged = false, severity = 0, index = 'BONETAG_R_UPPERARM' },
    ['RHAND'] = { label = 'Right Hand', causeLimp = false, isDamaged = false, severity = 0, index = 'BONETAG_R_HAND' },
    ['RFINGER'] = { label = 'Right Hand Fingers', causeLimp = false, isDamaged = false, severity = 0, index = 'BONETAG_R_FINGER01' },
    ['RLEG'] = { label = 'Right Leg', causeLimp = true, isDamaged = false, severity = 0, index = 'BONETAG_R_CALF'},
    ['RFOOT'] = { label = 'Right Foot', causeLimp = true, isDamaged = false, severity = 0, index = 'BONETAG_R_FOOT' },
}
RegisterNetEvent('fsn_evidence:ped:updateDamage')
AddEventHandler('fsn_evidence:ped:updateDamage', function(tbl)
	print'igotupdate'
	BodyParts = tbl
end)

local opacity = 0
local minus = false 
Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if minus then
			opacity = opacity - 1
			if opacity <= 0 then
				minus = false
			end
		else
			opacity = opacity + 1
			if opacity >=255 then
				minus = true
			end
		end
		for ply, v in pairs(pedState) do
			local ply = ply
			for key, s in pairs(v) do
				if s.expire then
					if s.expire <= GetGameTimer() then
						pedState[ply][key] = nil
						if #pedState[ply] < 1 then pedState[ply] = nil end
						if ply == GetPlayerServerId(PlayerId()) then
							updateState()
						end
					else
						local localPly = GetPlayerFromServerId(ply)
						local ped = false
						if localPly == -1 then
							if ply == GetPlayerServerId(PlayerId()) then
								ped = PlayerPedId()
							end
						else
							ped = GetPlayerPed(localPly)
						end
						if ped and GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(PlayerPedId()), true) < 8 then
							local loc = GetWorldPositionOfEntityBone(ped, GetEntityBoneIndexByName(ped, BodyParts[s.bone]['index']))
							Util.DrawText3D(loc.x, loc.y, loc.z, s.state, {255,255,255,opacity}, 0.15)
						end
					end
				end
			end
		end
		if not IsPedInAnyVehicle(PlayerPedId()) then
			for k, b in pairs(BodyParts) do
				if b.isDamaged and b.index then
					local loc = GetWorldPositionOfEntityBone(PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), b.index))
					--print(GetEntityBoneIndexByName(PlayerPedId(), b.index))
					--print(tostring(loc))
					local col = {255,255,255,255}
					if b.severity <= 2 then
						col = {255, 161, 54,opacity}
					else
						col = {255,0,0,opacity}
					end
					Util.DrawText3D(loc.x, loc.y, loc.z, b.label, col, 0.15)
				end
			end
		end
	end
end)
--TriggerEvent('fsn_evidence:ped:addState', 'SMELLS OF WEED', 'HEAD')