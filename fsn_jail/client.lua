local jailtime = 0
local totaltime = 0
local beginSentence = 0
local isinjail = false
local characterid = 0
local timetick = 0
local jobcomplete = false
local lastjob = 0
local myjob = 0

local jobs = {
	{x = 1609.4788818359, y = 2668.8981933594, z = 45.564933776855},
	{x = 1608.2047119141, y = 2655.5576171875, z = 45.564933776855},
	{x = 1663.1888427734, y = 2635.4958496094, z = 45.564880371094},
	{x = 1703.9364013672, y = 2631.6931152344, z = 45.564872741699},
	{x = 1758.1614990234, y = 2646.4929199219, z = 45.56489944458},
	{x = 1779.0938720703, y = 2659.8835449219, z = 45.564910888672},
	{x = 1756.6635742188, y = 2677.162109375, z = 45.564910888672},
	{x = 1697.4555664063, y = 2686.08203125, z = 45.564888000488},
	{x = 1661.994140625, y = 2636.4445800781, z = 45.564872741699},
	{x = 1649.4085693359, y = 2586.0710449219, z = 45.56485748291},
	{x = 1624.4453125, y = 2577.3071289063, z = 45.564868927002},
	{x = 1625.0989990234, y = 2575.7470703125, z = 45.564876556396},
	{x = 1608.9229736328, y = 2567.0065917969, z = 45.564876556396},
	{x = 1609.6904296875, y = 2568.5939941406, z = 45.564876556396},
	{x = 1707.1981201172, y = 2481.3537597656, z = 45.564918518066},
	{x = 1706.1644287109, y = 2479.4211425781, z = 45.564922332764},
	{x = 1737.2509765625, y = 2504.7338867188, z = 45.564975738525},
	{x = 1735.4582519531, y = 2504.5319824219, z = 45.564987182617},
	{x = 1760.7620849609, y = 2519.2299804688, z = 45.564987182617},
	{x = 1760.8270263672, y = 2517.3139648438, z = 45.565002441406},
	{x = 1761.4669189453, y = 2540.3828125, z = 45.565017700195},
	{x = 1760.5579833984, y = 2541.4289550781, z = 45.565017700195},
	{x = 1695.7875976563, y = 2535.9916992188, z = 45.564888000488},
	{x = 1695.1467285156, y = 2537.8662109375, z = 45.564888000488},
	{x = 1679.4931640625, y = 2480.4077148438, z = 45.564922332764},
	{x = 1678.0528564453, y = 2480.9506835938, z = 45.564945220947},
	{x = 1622.435546875, y = 2507.7373046875, z = 45.564888000488},
	{x = 1621.630859375, y = 2509.3666992188, z = 45.564888000488}
}

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('fsn_jail:spawn:recieve')
AddEventHandler('fsn_jail:spawn:recieve', function(result)
	jailtime = result
  if jailtime >= 1 then
    TriggerEvent('fsn_jail:sendme', jailtime)
    TriggerServerEvent('fsn_jail:update:database', jailtime)
  else
    jailtime = 0
    beginSentence = 0
    isinjail = false
  end
end)

RegisterNetEvent('fsn_jail:sendme')
AddEventHandler('fsn_jail:sendme', function(time)
	jailtime = time
	totaltime = time
  isinjail = true
  RemoveAllPedWeapons(PlayerPedId())
  local jail = {x = 1653.5433349609, y = 2603.8093261719, z = 45.564876556396}
  SetEntityCoords(PlayerPedId(), jail.x, jail.y,jail.z+1)
  TriggerEvent('pNotify:SendNotification', {text = "You've been sent to jail for: ".. math.floor(tonumber(jailtime) / 60) .." minutes",
    layout = "centerRight",
    timeout = 600,
    progressBar = true,
    type = "info"
  })
  TriggerEvent('fsn_hungerandthirst:pause')
end)

RegisterNetEvent('fsn_jail:releaseme')
AddEventHandler('fsn_jail:releaseme', function()
	jailtime = 0
  isinjail = false
  SetEntityCoords(PlayerPedId(), 1852.42, 2603.44,45.672)
  TriggerServerEvent('fsn_jail:update:database', jailtime)
  TriggerEvent('pNotify:SendNotification', {text = "You've been released from jail",
    layout = "centerRight",
    timeout = 600,
    progressBar = true,
    type = "info"
  })
  TriggerEvent('fsn_hungerandthirst:unpause')
end)

RegisterNetEvent('fsn_jail:init')
AddEventHandler('fsn_jail:init', function(char_id)
  characterid = char_id
  TriggerServerEvent("fsn_jail:spawn", characterid)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isinjail then
		local maff = lastjob + 30
		if maff <= timetick then
			if myjob == 0 then
				if jailtime > totaltime / 50 then
					myjob = math.random(1, #jobs)
					lastjob = timetick
					TriggerEvent('fsn_notify:displayNotification', 'You just got a new job (#'..myjob..'), head to it to reduce your sentence!', 'centerRight', 4000, 'info')
				end
			end
		else
			--print(maff..' not larger than '..timetick..', waiting')
		end
		if myjob ~= 0 then
			local job = jobs[myjob]
			DrawMarker(1,job.x, job.y, job.z-1,0,0,0,0,0,0,1.0,1.0,90.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(job.x, job.y, job.z, GetEntityCoords(PlayerPedId()), true) < 1 then
				--amb@world_human_welding@male@idle_a
				--idle_a
				RequestAnimDict('amb@world_human_welding@male@idle_a')
				while not HasAnimDictLoaded('amb@world_human_welding@male@idle_a') do
					Citizen.Wait(1)
				end
				TaskPlayAnim(PlayerPedId(), "amb@world_human_welding@male@idle_a", 'idle_a', 4.0, -4, -1, 1, 0, 0, 0, 0)
				SetTextComponentFormat("STRING")
				AddTextComponentString("~g~working...")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				local sex = math.random(60,180)
				jailtime = jailtime - sex
				lastjob = timetick
				myjob = 0
				TriggerEvent('fsn_notify:displayNotification', 'Job well done! '..sex..' seconds earned!', 'centerRight', 4000, 'success')
			end
		end
      local inmins = tonumber(jailtime) / 60
      drawTxt(1.24, 1.44, 1.0,1.0,0.4, "Jailtime: ~r~" .. math.floor(inmins) .. "~w~ minutes remaining", 255, 255, 255, 255)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isinjail then
      Citizen.Wait(1000)
	  timetick = timetick + 1
      jailtime = jailtime - 1
	  if GetDistanceBetweenCoords(1691.8676757813, 2606.4614257813, 45.560329437256,GetEntityCoords(PlayerPedId()), true) > 330 then
		SetEntityCoords(PlayerPedId(), 1654.0007324219, 2601.3422851563, 45.564872741699)
		TriggerEvent('fsn_notify:displayNotification', 'You must stay in jail for the entirity of your sentence!', 'centerRight', 6000, 'error')
	  end
      if jailtime <= 0 then
        TriggerEvent('fsn_jail:releaseme')
      end
    end
  end
end)

--[[
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isinjail then
		DrawMarker(1,1691.8676757813, 2606.4614257813, 45.560329437256,0,0,0,0,0,0,330.001,330.0001,30.4001,0,155,255,175,0,0,0,0)
		for k,v in pairs(jobs) do
			DrawMarker(1,v.x, v.y, v.z-1,0,0,0,0,0,0,1.0,1.0,90.4001,0,155,255,175,0,0,0,0)
		end
    end
  end
end)
]]
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isinjail then
      Citizen.Wait(60000)
      TriggerServerEvent('fsn_jail:update:database', jailtime)
    end
  end
end)
