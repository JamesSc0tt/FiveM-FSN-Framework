local actions = {
  [1] = {
    name = "Shots Fired",
    tencode = '10-71',
    reward = 1000,
	blip = 110
  },
  [2] = {
    name = "Carjacking",
    tencode = '10-60',
    reward = 800,
	blip = 380
  },
  [3] = {
    name = "CDS Complaint",
    tencode = '10-31',
    reward = 350,
	blip = 456
  },
  [4] = {
    name = "OFFICER DOWN",
    tencode = '10-13',
    reward = 0,
	blip = 310
  },
  [5] = {
    name = "Officer Backup Requested",
    tencode = '10-77',
    reward = 0,
	blip = 60
  },
  [6] = {
    name = "EMERGENCY OFFICER BACKUP",
    tencode = '10-78',
    reward = 0,
	blip = 461
  },
 [7] = {
    name = 'Bank Robbery',
    tencode = '10-90',
    reward = 500,
	blip = 207
  },
  [8] = {
    name = false, -- speeding vehicle
    reward = 500,
	blip = 315
  },
  [9] = {
    name = 'EMS Request',
    tencode = '10-47',
    reward = 500,
	blip = 310
  },
  [10] = {
    name = "Attempted Carjacking",
    tencode = '10-60',
    reward = 800,
	blip = 380
  },
  [11] = {
    name = "Flagged Plate Location",
    tencode = '10-61',
    reward = 800,
	blip = 304
  },
  [12] = {
    name = 'Robbery in progress',
    tencode = '10-31b',
    reward = 500,
	blip = 103
  },
  [13] = {
    name = 'Suspicious Vehicle',
    tencode = '10-37',
    reward = 500,
	blip = 147
  },
  [14] = {
    name = 'Person with a Gun',
    tencode = '10-32',
    reward = 500,
	blip = 110
  },
  [15] = {
    name = 'Civil Disturbance',
    tencode = '10-15',
    reward = 500,
	blip = 491
  },
  [16] = {
    name = 'Road Traffic Collision',
    tencode = '10-50',
    reward = 500,
	blip = 380
  },
  [17] = {
    name = 'Road Traffic Collision (Injured)',
    tencode = '10-50A',
    reward = 500,
	blip = 380
  },
  [18] = {
    name = 'Burglary in Progress',
    tencode = '10-31a',
    reward = 500,
	blip = 461
  },
}
local dispatch_calls = {}
local disp_enable = false
local disp_id = 0
local last_disp = 0
local current_time = 0
local last_report_01 = 0

RegisterNetEvent('fsn_police:dispatch:toggle')
AddEventHandler('fsn_police:dispatch:toggle', function()
  if disp_enable then
    disp_enable = false
    TriggerEvent('fsn_notify:displayNotification', 'Dispatch: <b style="color:red">DISABLED', 'centerRight', 4000, 'info')
  else
    disp_enable = true
    TriggerEvent('fsn_notify:displayNotification', 'Dispatch: <b style="color:#42f474">ENABLED', 'centerRight', 4000, 'info')
  end
end)

function displayDispatch(x,y,z,id,chatPrint)
  if pdonduty then
    local var1, var2 = GetStreetNameAtCoord(x, y, z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    local sname = GetStreetNameFromHashKey(var1)
    if chatPrint then
      TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:DISPATCH:^0^r '..chatPrint)
    else
      --TriggerEvent('chatMessage', '', {255,255,255}, '^1^*:DISPATCH:^0^r This dispatch call has no details')
    end
    --SendNUIMessage({
    --  addDispatch = true,
    --  tencode = actions[id].tencode,
    --  name = actions[id].name,
    --  loc = sname,
    --  x = x,
    --  y = y,
    --  z = z
    --})
    if disp_enable then
		if actions[id].name then
		  disp_id = #dispatch_calls+1
		  last_disp = current_time
		  table.insert(dispatch_calls, disp_id, {
			type = actions[id].tencode,
			cx = x,
			cy = y
		  })
		  if id == 7 then
			TriggerEvent('chatMessage', '', {255,255,255}, '^6^*:fsn_police:^0^r A BANK IS BEING ROBBED @ '..sname)
		  end
		  
		  SetNotificationTextEntry("STRING");
		  AddTextComponentString('Call: ~r~'..actions[id].tencode..'~w~ ('..actions[id].name..')\nLocation: ~y~'..sname);
		  SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "~g~DISPATCH:~s~", "");
		  DrawNotification(false, true);
	  end
    end
	if actions[id].blip ~= false then
		print 'triggering addblip'
		TriggerEvent("fsn_main:blip:add", "police", "ALERT: "..actions[id].tencode, actions[id].blip, x, y, z)
	end
  end
end

RegisterNetEvent('fsn_police:dispatchcall')
AddEventHandler('fsn_police:dispatchcall', function(tbl, id, chatPrint)
  if chatPrint then
    displayDispatch(tbl.x,tbl.y,tbl.z,id, chatPrint)
  else
    displayDispatch(tbl.x,tbl.y,tbl.z,id)
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    current_time = current_time + 1
  end
end)

local myGSR = false
local lastGSR = 0
local last_Fight = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) and exports["fsn_criminalmisc"]:HoldingWeapon() then
			print 'adding gsr'
			lastGSR = current_time
			myGSR = true
			TriggerEvent('fsn_evidence:ped:addState', 'GSR Residue', 'LFINGER')
		end
		if IsPedInMeleeCombat(PlayerPedId()) and not pdonduty then
			if last_Fight+10000 < GetGameTimer() then
				local pos = GetEntityCoords(PlayerPedId())
			   local coords = {
				 x = pos.x,
				 y = pos.y,
				 z = pos.z
			   }
			   TriggerServerEvent('fsn_police:dispatch', coords, 15)
				last_Fight = GetGameTimer()
			end
		end
		if lastGSR + 600 < current_time then
			if myGSR then
				lastGSR = 0 	
				myGSR = false
				print 'removing gsr'
			end
		end
	end
end)
RegisterNetEvent('fsn_commands:police:gsrMe')
AddEventHandler('fsn_commands:police:gsrMe', function(pd)
	TriggerServerEvent('fsn_commands:police:gsrResult', pd, myGSR)
end)

Citizen.CreateThread(function()
   while true do
     Citizen.Wait(0)
	 if IsPedShooting(PlayerPedId()) and not pdonduty then
		if exports["fsn_criminalmisc"]:HoldingWeapon() then
		   local pos = GetEntityCoords(PlayerPedId())
		   local coords = {
			 x = pos.x,
			 y = pos.y,
			 z = pos.z
		   }
		   TriggerServerEvent('fsn_police:dispatch', coords, 1)
			print 'you hold weapon - dispatch'
		else
			print 'you no hold weapon - no dispatch'
		end
     end
     ----- PD SIDE
     if disp_id ~= 0 then
       if last_disp + 10 > current_time then
         SetTextComponentFormat("STRING")
         AddTextComponentString("Press ~INPUT_MP_TEXT_CHAT_TEAM~ to ~g~accept~w~ the call\nPress ~INPUT_PUSH_TO_TALK~ to ~r~decline~w~ the call")
         DisplayHelpTextFromStringLabel(0, 0, 1, -1)
         if IsControlJustPressed(0, 246) then
           SetNewWaypoint(dispatch_calls[disp_id].cx, dispatch_calls[disp_id].cy)
           last_disp = 0
         end
         if IsControlJustPressed(0, 249) then
           last_disp = 0
         end
       end
     end
   end
end)
