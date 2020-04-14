local Keys = {
    ["ESC"]       = 322,  ["F1"]        = 288,  ["F2"]        = 289,  ["F3"]        = 170,  ["F5"]  = 166,  ["F6"]  = 167,  ["F7"]  = 168,  ["F8"]  = 169,  ["F9"]  = 56,   ["F10"]   = 57, 
    ["~"]         = 243,  ["1"]         = 157,  ["2"]         = 158,  ["3"]         = 160,  ["4"]   = 164,  ["5"]   = 165,  ["6"]   = 159,  ["7"]   = 161,  ["8"]   = 162,  ["9"]     = 163,  ["-"]   = 84,   ["="]     = 83,   ["BACKSPACE"]   = 177, 
    ["TAB"]       = 37,   ["Q"]         = 44,   ["W"]         = 32,   ["E"]         = 38,   ["R"]   = 45,   ["T"]   = 245,  ["Y"]   = 246,  ["U"]   = 303,  ["P"]   = 199,  ["["]     = 116,  ["]"]   = 40,   ["ENTER"]   = 18,
    ["CAPS"]      = 137,  ["A"]         = 34,   ["S"]         = 8,    ["D"]         = 9,    ["F"]   = 23,   ["G"]   = 47,   ["H"]   = 74,   ["K"]   = 311,  ["L"]   = 182,
    ["LEFTSHIFT"] = 21,   ["Z"]         = 20,   ["X"]         = 73,   ["C"]         = 26,   ["V"]   = 0,    ["B"]   = 29,   ["N"]   = 249,  ["M"]   = 244,  [","]   = 82,   ["."]     = 81,
    ["LEFTCTRL"]  = 36,   ["LEFTALT"]   = 19,   ["SPACE"]     = 22,   ["RIGHTCTRL"] = 70, 
    ["HOME"]      = 213,  ["PAGEUP"]    = 10,   ["PAGEDOWN"]  = 11,   ["DELETE"]    = 178,
    ["LEFT"]      = 174,  ["RIGHT"]     = 175,  ["UP"]        = 27,   ["DOWN"]      = 173,
    ["NENTER"]    = 201,  ["N4"]        = 108,  ["N5"]        = 60,   ["N6"]        = 107,  ["N+"]  = 96,   ["N-"]  = 97,   ["N7"]  = 117,  ["N8"]  = 61,   ["N9"]  = 118
  }

local yogaStartKey = Keys["E"]
local yogaEndKey = Keys["DELETE"]

local doingYoga
local drawTextDist = 2.0
local distance = 10.0
local yogaLocation = vector3(-1217.31, -1543.11, 4.72)
local yogaSpots = {

	[1] = vector3(-1217.31, -1543.11, 4.72),
	[2] = vector3(-1223.25, -1546.05, 4.72),
	[3] = vector3(-1228.80, -1549.44, 4.72)  

}

local Blips = {
    
    YogaBliss = {
		Zone = 'Yoga Bliss',
		Sprite = 480,
		Scale = 1.0,
		Display = 4,
		Color = 7,
		Pos = {x = -1224.85, y = -1547.37, z = 4.62 },
    },
    
}

-- Draw the blips
Citizen.CreateThread(function()
    
    for key, val in pairs(Blips) do
        local blip = AddBlipForCoord(val.Pos.x, val.Pos.y, val.Pos.z)
        SetBlipHighDetail           (blip, true)
        SetBlipSprite               (blip, val.Sprite)
        SetBlipDisplay              (blip, val.Display)
        SetBlipScale                (blip, val.Scale)
        SetBlipColour               (blip, val.Color)
        SetBlipAsShortRange         (blip, true)
        BeginTextCommandSetBlipName ("STRING")
        AddTextComponentString      (val.Zone)
        EndTextCommandSetBlipName   (blip)
    end

end)

-- Lets start some YOGA
Citizen.CreateThread(function()
    
    while true do
        Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local playerPos = GetEntityCoords(playerPed)
		local nearestDist, nearestPos = PositionCheck(playerPos)
        local dist = GetVecDist(playerPos, yogaLocation)

        if dist < distance then
            nearestDist,nearestPos = PositionCheck(playerPos)

            if nearestDist < drawTextDist then
                DrawText3D(nearestPos.x, nearestPos.y, nearestPos.z, 'Press ~g~[ E ] ~s~ to begin yoga')
                if (IsControlJustPressed(0, yogaStartKey, IsDisabledControlJustPressed(0, yogaStartKey))) then
                    doingYoga = true
                    DoYoga(playerPed)
                end
            end
        end
    end
end)

-- Cancel Yoga
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local playerPos = GetEntityCoords(playerPed)
		local nearestDist,nearestPos = PositionCheck(playerPos)
        local dist = GetVecDist(playerPos, yogaLocation)

        if dist < distance then
            nearestDist,nearestPos = PositionCheck(playerPos)

            if nearestDist < drawTextDist then
                if doingYoga then
                    DrawText3D(nearestPos.x, nearestPos.y, nearestPos.z, 'Press ~r~[ DELETE ] ~s~ to cancel yoga')
                    if (IsControlJustPressed(0, yogaEndKey, IsDisabledControlJustPressed(0, yogaEndKey))) then
                        doingYoga = false
                        cancelledYoga(playerPed)
                    end
                end
            end
        end
    end
end)

function cancelledYoga(playerPed)
    
    exports['mythic_notify']:DoCustomHudText('inform', 'You ended your yoga session early and now are resting for 15 seconds.', 3000)

    doingYoga = false
    ClearPedTasksImmediately(playerPed)

end

function PositionCheck(playerPos)

	local nearestDist,nearestPos
	
	for k,v in pairs(yogaSpots) do
		local curDist = GetVecDist(playerPos, v.xyz)
		if not nearestDist or curDist < nearestDist then
			nearestDist = curDist
			nearestPos = v
		end
	end
	
	if not nearestDist then return false; end
	return nearestDist,nearestPos
	
end

function DoYoga(playerPed)

	local playerPos = GetEntityCoords(playerPed)

	exports['mythic_notify']:DoCustomHudText('inform', 'Preparing the exercise...', 1000)
	
	Citizen.Wait(1000)
	TaskStartScenarioInPlace(playerPed, "world_human_yoga", 0, true)
	Citizen.Wait(15000)
	TriggerEvent('fsn_yoga:checkStress')
	ClearPedTasksImmediately(playerPed)

end

RegisterNetEvent('fsn_yoga:checkStress')
AddEventHandler('fsn_yoga:checkStress', function()
	local playerPed = GetPlayerPed(-1)
	
	if doingYoga then
		TriggerEvent('fsn_stress:removeStress', 10)
		doingYoga = false
	else
		doingYoga = false
	end
end)

function GetVecDist(v1,v2)
    if not v1 or not v2 or not v1.x or not v2.x then return 0; end
    return math.sqrt(  ( (v1.x or 0) - (v2.x or 0) )*(  (v1.x or 0) - (v2.x or 0) )+( (v1.y or 0) - (v2.y or 0) )*( (v1.y or 0) - (v2.y or 0) )+( (v1.z or 0) - (v2.z or 0) )*( (v1.z or 0) - (v2.z or 0) )  )
end

local color = { r = 220, g = 220, b = 220, alpha = 255 } -- Color of the text 
local font = 4 -- Font of the text
local time = 7000 -- Duration of the display of the text : 1000ms = 1sec
local background = { enable = false, color = { r = 35, g = 35, b = 35, alpha = 200 }, }
local chatMessage = true
local dropShadow = false

function DrawText3D(x,y,z, text)
      local onScreen,_x,_y = World3dToScreen2d(x,y,z)
      local px,py,pz = table.unpack(GetGameplayCamCoord())
      local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
   
      local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*100
  
      if onScreen then
        -- Formalize the text
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextScale(0.0*scale, 0.40*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextCentre(true)
        if dropShadow then
            SetTextDropshadow(10, 100, 100, 100, 255)
        end
  
        -- Calculate width and height
        BeginTextCommandWidth("STRING")
        --AddTextComponentString(text)
        local height = GetTextScaleHeight(0.45*scale, font)
        local width = EndTextCommandGetWidth(font)
  
        -- Diplay the text
        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
  
        if background.enable then
            DrawRect(_x, _y+scale/73, width, height, background.color.r, background.color.g, background.color.b , background.color.alpha)
        end
      end
 end