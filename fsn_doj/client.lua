local cr_blip = 0

function CreateCRBlip()
	cr_blip = AddBlipForCoord(-517.01586914063, -196.01460266113, 38.219631195068)
	SetBlipSprite(cr_blip, 285)
	SetBlipColour(cr_blip, 2)
	SetBlipAsShortRange(cr_blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Court Room")
	EndTextCommandSetBlipName(cr_blip)
	SetBlipScale(cr_blip, 0.5)
end
	
Citizen.CreateThread(function()
	local ch_blip = AddBlipForCoord(-540.80249023438, -211.36741638184, 37.649761199951)
	SetBlipSprite(ch_blip, 58)
	SetBlipColour(ch_blip, 36)
	SetBlipAsShortRange(ch_blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("City Hall")
	EndTextCommandSetBlipName(ch_blip)
	
	while true do Citizen.Wait(0)
		if GetDistanceBetweenCoords(-517.01586914063, -196.01460266113, 38.219631195068, GetEntityCoords(PlayerPedId()),false) < 50 then
			if not DoesBlipExist(cr_blip) then
				CreateCRBlip()
			end
		else
			if DoesBlipExist(cr_blip) then
				RemoveBlip(cr_blip)
			end
		end
	end
end)