local ChoosingTattoo = false; local CurrentCategory = 1; local CurrentTattoo = 1; local TattooCamera; local PreviousTattoos = {}; local ShopTattoos = {}

RegisterNetEvent('fsn_characterdetails:recievetattoos')
AddEventHandler('fsn_characterdetails:recievetattoos', function(Data)
    PreviousTattoos = Data
end)

Citizen.CreateThread(function()
	for k, Store in pairs(TattooLocations) do
		local Blip = AddBlipForCoord(Store.X, Store.Y, Store.Z)
		SetBlipSprite(Blip, 75)
		SetBlipAsShortRange(Blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('InKed uP')
		EndTextCommandSetBlipName(Blip)
	end
	while true do
		Citizen.Wait(0)
		for k, Coordinates in pairs(TattooLocations) do
			if GetDistanceBetweenCoords(Coordinates.X, Coordinates.Y, Coordinates.Z, GetEntityCoords(PlayerPedId(), true)) < 10 then
				DrawMarker(1, Coordinates.X, Coordinates.Y, Coordinates.Z - 1, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.4001, 0, 155, 255, 175, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(Coordinates.X, Coordinates.Y, Coordinates.Z, GetEntityCoords(PlayerPedId()), true) < 1 then
					SetTextComponentFormat('STRING')
					AddTextComponentString('Press ~INPUT_PICKUP~ to get a ~y~tattoo')
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustPressed(0, 38) then
                        ToggleActionMenu()
						PreviewTattoo()
					end
				end
			end
		end
	end
end)

function ExitTattooStore()
	ChoosingTattoo = false
end

function NextCategory()
    if CurrentCategory == 3 then
        CurrentCategory = 1
        return
    end
    CurrentCategory = CurrentCategory + 1
	CurrentTattoo = 1
	PreviewTattoo()
end

function BackCategory()
    if CurrentCategory == 1 then
        CurrentCategory = 3
        return
    end
    CurrentCategory = CurrentCategory - 1
	CurrentTattoo = 1
	PreviewTattoo()
end

function NextTattoo()
    CurrentTattoo = CurrentTattoo + 1
	PreviewTattoo()
end

function PreviousTattoo()
    CurrentTattoo = CurrentTattoo - 1
	PreviewTattoo()
end

function PurchaseTattoo()
    local TargetTattooHash = TattooList[TattooCategories[CurrentCategory].Value][CurrentTattoo].NameHash
    table.insert(PreviousTattoos, TargetTattooHash)
    print(PreviousTattoos)
    print(PreviousTattoos[1])
    TriggerEvent('fsn_main:saveCharacter')
end

function PreviewTattoo()
    ChoosingTattoo = true
    
    SetEntityHeading(PlayerPedId(), 297.7296)
    ClearPedDecorations(PlayerPedId())

    if not DoesCamExist(TattooCamera) then
        TattooCamera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamCoord(TattooCamera, GetEntityCoords(PlayerPedId()))
        SetCamRot(TattooCamera, 0.0, 0.0, 0.0)
        SetCamActive(TattooCamera,  true)
        RenderScriptCams(true, false, 0, true, true)

        SetCamCoord(TattooCamera, GetEntityCoords(PlayerPedId()))
    end

    FreezeEntityPosition(PlayerPedId(), true)

    local Coordinates = GetEntityCoords(PlayerPedId())

    SetCamCoord(TattooCamera, Coordinates.x + TattooList[TattooCategories[CurrentCategory].Value][CurrentTattoo].AddedX, Coordinates.y + TattooList[TattooCategories[CurrentCategory].Value][CurrentTattoo].AddedY, Coordinates.z + TattooList[TattooCategories[CurrentCategory].Value][CurrentTattoo].AddedZ)
    SetCamRot(TattooCamera, 0.0, 0.0, TattooList[TattooCategories[CurrentCategory].Value][CurrentTattoo].RotZ)

    ClearPedDecorations(PlayerPedId())
    --ApplyTattoos()
    ApplyPedOverlay(PlayerPedId(), GetHashKey(TattooCategories[CurrentCategory].Value), GetHashKey(TattooList[TattooCategories[CurrentCategory].Value][CurrentTattoo].NameHash))

    while ChoosingTattoo do
        Citizen.Wait(0)
        -- IF whatever then go to next tattoo etc using functions.
    end

    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(TattooCamera, true)
    FreezeEntityPosition(PlayerPedId(), false)
end

function GetPreviousTattoos()
    return PreviousTattoos
end