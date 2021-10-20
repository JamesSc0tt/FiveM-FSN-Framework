local volspot = {x = 324.6282043457, y = -580.87713623047, z = 43.317390441895}
local volunteer_ems = {}

local whitelisted = true

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if GetDistanceBetweenCoords(volspot.x,volspot.y,volspot.z,GetEntityCoords(PlayerPedId()),false) < 10 then
			DrawMarker(25,volspot.x, volspot.y, volspot.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(volspot.x,volspot.y,volspot.z,GetEntityCoords(PlayerPedId()),false) < 1 then
				Util.DrawText3D(volspot.x, volspot.y, volspot.z, '[E] ~g~Volunteer~w~ as ~r~EMS', {255,255,255,200}, 0.25)
			
				if #volunteer_ems < 4 then
					
				else
				
				end
			end
		end
	end
end)