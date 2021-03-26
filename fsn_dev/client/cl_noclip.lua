-- https://github.com/blattersturm/expeditious-execution/blob/master/resources/%5Bexpeditious%5D/execution-noclip/execution-noclip.js

local key_toggle = 289 -- F2 by default
local freecam = exports["freecam"];
local target

AddEventHandler("freecam:onTick", function()
	if target then
		SetEntityCoordsNoOffset(target, freecam:GetPosition(), false, false, false)
		local rot = freecam:GetRotation()
		SetEntityRotation(target, rot.x, rot.y, rot.z, 0, true)
	end
end)

function noclip(enabled)
	if enabled then
		target = PlayerPedId()
		local veh = GetVehiclePedIsIn(target, false)
		if veh ~= 0 then target = veh end

		if not NetworkHasControlOfEntity(target) then
			target = nil
			print("Can't noclip something you don't control :(")
			return
		end
	end

	SetEntityInvincible(target, enabled);
	FreezeEntityPosition(target, enabled);
	SetEntityCollision(target, not enabled, not enabled);
	SetEntityVisible(target, not enabled, false);

	freecam:SetActive(enabled)
	if enabled then
		local pos = GetEntityCoords(target)
		freecam:SetPosition(pos.x, pos.y, pos.z)
	else
		target = nil
	end
end

RegisterNetEvent('fsn_developer:noClip:enabled')
AddEventHandler('fsn_developer:noClip:enabled', function()
	noclip(not freecam:IsActive())
end)

Citizen.CreateThread(function()
	while true do
		if IsDisabledControlJustPressed(0, key_toggle) then
			if noclip(enabled) then
				noclip(not freecam:IsActive())
			end
		end
		Citizen.Wait(0)
	end
end)
