local policeDoors = {
  -- Mission Row To locker room & roof
  [1] = { ["objName"] = "v_ilev_ph_gendoor004", ["x"]= 449.69815063477, ["y"]= -986.46911621094,["z"]= 30.689594268799,["locked"]= true,["txtX"]=450.104,["txtY"]=-986.388,["txtZ"]=31.739},
  -- Mission Row Armory
  [2] = { ["objName"] = "v_ilev_arm_secdoor", ["x"]= 452.61877441406, ["y"]= -982.7021484375,["z"]= 30.689598083496,["locked"]= true,["txtX"]=453.079,["txtY"]=-982.600,["txtZ"]=31.739},
  -- Mission Row Captain Office
  [3] = { ["objName"] = "v_ilev_ph_gendoor002", ["x"]= 447.23818969727, ["y"]= -980.63006591797,["z"]= 30.689598083496,["locked"]= true,["txtX"]=447.200,["txtY"]=-980.010,["txtZ"]=31.739},
  -- Mission Row To downstairs right
  [4] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 443.97, ["y"]= -989.033,["z"]= 30.6896,["locked"]= true,["txtX"]=444.020,["txtY"]=-989.445,["txtZ"]=31.739},
  -- Mission Row To downstairs left
  [5] = { ["objName"] = "v_ilev_ph_gendoor005", ["x"]= 445.37, ["y"]= -988.705,["z"]= 30.6896,["locked"]= true,["txtX"]=445.350,["txtY"]=-989.445,["txtZ"]=31.739},
  -- Mission Row Main cells
  [6] = { ["objName"] = 631614199, ["x"]= 464.0, ["y"]= -992.265,["z"]= 24.9149,["locked"]= true,["txtX"]=463.465,["txtY"]=-992.664,["txtZ"]=25.064},
  -- Mission Row Cell 1
  [7] = { ["objName"] = 631614199, ["x"]= 462.381, ["y"]= -993.651,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-993.308,["txtZ"]=25.064},
-- Mission Row Cell 2
  [8] = { ["objName"] = 631614199, ["x"]= 462.331, ["y"]= -998.152,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-998.800,["txtZ"]=25.064},
  -- Mission Row Cell 3
  [9] = { ["objName"] = 631614199, ["x"]= 462.704, ["y"]= -1001.92,["z"]= 24.9149,["locked"]= true,["txtX"]=461.806,["txtY"]=-1002.450,["txtZ"]=25.064},
  -- Mission Row Backdoor in
  --[10] = { ["objName"] = -1033001619, ["x"]= 464.126, ["y"]= -1002.78,["z"]= 24.9149,["locked"]= true,["txtX"]=464.100,["txtY"]=-1003.538,["txtZ"]=26.064},
  -- Mission Row Rooftop In
  [12] = { ["objName"] = "v_ilev_gtdoor02", ["x"]= 465.467, ["y"]= -983.446,["z"]= 43.6918,["locked"]= true,["txtX"]=464.361,["txtY"]=-984.050,["txtZ"]=44.834},
  -- rear right door
  [13] = { ["objName"] = -2023754432, ["x"]= 469.9679, ["y"]= -1014.452,["z"]= 26.53623,["locked"]= true,["txtX"]=468.9679,["txtY"]=-1014.452,["txtZ"]=26.53623},
  -- Rear left door
  [14] = { ["objName"] = -2023754432, ["x"]= 467.3716, ["y"]= -1014.452,["z"]= 26.53623,["locked"]= true,["txtX"]=468.3716,["txtY"]=-1014.452,["txtZ"]=26.53623},
  -- sandy shores office
  --[15] = { ["objName"] = -1765048490 , ["x"]= 1855.685, ["y"]= 3683.93,["z"]= 34.59282,["locked"]= true,["txtX"]=1854.685,["txtY"]=3683.93,["txtZ"]=34.59282},
  -- paleto office right
  --[16] = { ["objName"] = -1501157055 , ["x"]= -444.4985, ["y"]= 6017.06,["z"]= 31.86633,["locked"]= true,["txtX"]=-443.91278076172,["txtY"]=6016.58984375,["txtZ"]=31.716369628906},
  -- paleto office left
  --[17] = { ["objName"] = -1501157055 , ["x"]= -443.20260620117, ["y"]= 6015.7021484375,["z"]= 31.716369628906,["locked"]= true,["txtX"]=-443.20260620117,["txtY"]=6015.7021484375,["txtZ"]=31.716369628906},
  -- MRPD Changing room
  [18] = { ["objName"] = -2023754432 , ["x"]= 452.624, ["y"]= -987.362, ["z"]= 30.839,["locked"]= true,["txtX"]= 451.624,["txtY"]=-987.362,["txtZ"]=30.839},
  -- MRPD Back gate
  [19] = { ["objName"] = -1603817716 , ["x"]= 488.894, ["y"]= -1017.210, ["z"]= 27.14,["locked"]= true,["txtX"]= 488.894,["txtY"]=-1017.210,["txtZ"]=28.145},
  -- Prison Front Gate
  [20] = { ["objName"] = 741314661, ["x"]= 1844.998, ["y"]= 2604.810, ["z"]= 44.636,["locked"]= true,["txtX"]= 1845.104,["txtY"]=2605.009,["txtZ"]=45.889},
  -- Prison Second Gate
  [21] = { ["objName"] = 741314661, ["x"]= 1818.539, ["y"]= 2604.791, ["z"]= 44.607,["locked"]= true,["txtX"]= 1818.616,["txtY"]=2605.176,["txtZ"]=45.570},
  -- Prison Left gate
  [22] = { ["objName"] = -1156020871, ["x"]= 1797.760, ["y"]= 2596.564, ["z"]= 46.387,["locked"]= true,["txtX"]= 1797.760,["txtY"]=2596.564,["txtZ"]=46.387},
  
  -- OLD ONES KEEP INCASE I REVERT LOLZ
  
  -- PD lower first left
  --[22] = { ["objName"] = -131296141, ["x"]= 465.595, ["y"]=-988.704, ["z"]=25.067,["locked"]= true,["txtX"]=465.454,["txtY"]=-989.748,["txtZ"]=24.914},
  -- PD lower first right
  --[23] = { ["objName"] = -131296141, ["x"]= 465.572, ["y"]=-991.300, ["z"]=25.067,["locked"]= true,["txtX"]=465.644,["txtY"]=-990.323,["txtZ"]=24.914},
  -- PD lower evidence room
  --[24] = { ["objName"] = -131296141, ["x"]= 478.422, ["y"]=-987.247, ["z"]=25.086,["locked"]= true,["txtX"]=477.240,["txtY"]=-987.244,["txtZ"]=24.914},
  -- PD lower question room 1 
  --[25] = { ["objName"] = -131296141, ["x"]= 468.733, ["y"]=-992.748, ["z"]=25.086,["locked"]= true,["txtX"]=467.578,["txtY"]=-992.787,["txtZ"]=24.914},
  -- PD lower question room 2 
  --[26] = { ["objName"] = -131296141, ["x"]= 470.339, ["y"]=-993.660, ["z"]=25.086,["locked"]= true,["txtX"]=470.345,["txtY"]=-994.923,["txtZ"]=24.914},
  -- PD lower jailing room
  --[27] = { ["objName"] = -131296141, ["x"]= 469.465, ["y"]=-987.247, ["z"]=25.086,["locked"]= true,["txtX"]=470.668,["txtY"]=-987.193,["txtZ"]=24.914},
  
  -- PD Lower [First Left]
  [23] = {["objName"] = 185711165, ["x"]= 465.557, ["y"]= -988.742, ["z"]= 25.054,["locked"]= true,["txtX"]=465.454,["txtY"]=-989.748,["txtZ"]=24.914},
  -- PD Lower [First Right]
  [24] = {["objName"] = 185711165, ["x"]= 465.558, ["y"]= -991.342, ["z"]= 25.054,["locked"]= true,["txtX"]=465.644,["txtY"]=-990.323,["txtZ"]=24.914},
  -- PD Lower [First Questioning Room]
  [25] = {["objName"] = 452874391, ["x"]= 470.135, ["y"]= -987.566, ["z"]= 25.059,["locked"]= true,["txtX"]=469.126,["txtY"]=-987.700,["txtZ"]=24.914},
  -- PD Lower [Middle Questioning Room]
  [26] = {["objName"] = -1033001619, ["x"]= 474.599, ["y"]= -987.584, ["z"]= 25.059,["locked"]= true,["txtX"]=473.621,["txtY"]=-987.711,["txtZ"]=24.914},
  -- PD Lower [End Questioning Room]
  [27] = {["objName"] = 452874391, ["x"]= 479.039, ["y"]= -987.566, ["z"]= 25.059,["locked"]= true,["txtX"]=478.020,["txtY"]=-987.600,["txtZ"]=24.914},
  -- PD Lower [Sendoff Room]
  [28] = {["objName"] = 452874391, ["x"]= 475.505, ["y"]= -992.469, ["z"]= 25.059,["locked"]= true,["txtX"]=476.506,["txtY"]=-992.400,["txtZ"]=24.914},
  -- PD Lower [Rear inner entry left]
  [29] = {["objName"] = 185711165, ["x"]= 462.673, ["y"]= -1003.696, ["z"]= 25.054,["locked"]= true,["txtX"]=463.400,["txtY"]=-1003.600,["txtZ"]=24.914},
  -- PD Lower [Rear inner entry right]
  [30] = {["objName"] = 185711165, ["x"]= 465.270, ["y"]= -1003.696, ["z"]= 25.054,["locked"]= true,["txtX"]=464.600,["txtY"]=-1003.600,["txtZ"]=24.914},
  -- PD Lower [Holding cell 1]
  [31] = {["objName"] = 871712474, ["x"]= 467.748, ["y"]= -997.619, ["z"]= 25.064,["locked"]= true,["txtX"]=467.200,["txtY"]=-997.400,["txtZ"]=24.914},
  -- PD Lower [Holding cell 2]
  [32] = {["objName"] = 871712474, ["x"]= 469.724, ["y"]= -1000.545, ["z"]= 25.064,["locked"]= true,["txtX"]=469.800,["txtY"]=-1000.00,["txtZ"]=24.914},
  -- PD Lower [Holding cell 3]
  [33] = {["objName"] = 871712474, ["x"]= 467.561, ["y"]= -1003.671, ["z"]= 25.064,["locked"]= true,["txtX"]=468.546,["txtY"]=-1003.500,["txtZ"]=24.914},
  
  -- Paleto Bay YMAP Cell Door
  [50] = { ["objName"] = 631614199, ["x"]= -433.910, ["y"]= 6004.791,["z"]= 31.866,["locked"]= true,["txtX"]=-434.835,["txtY"]=6003.869,["txtZ"]=31.8661},
  -- Paleto Bay YMAP MDT room
  [51] = { ["objName"] = -1765048490, ["x"]= -440.675, ["y"]= 6008.023,["z"]= 32.052,["locked"]= true,["txtX"]=-440.675,["txtY"]=6008.023,["txtZ"]=32.052},
  -- Prison Gate Right
  [52] = { ["objName"] = 741314661, ["x"]= 1799.610, ["y"]= 2616.975, ["z"]= 44.599,["locked"]= true,["txtX"]= 1799.610,["txtY"]=2616.975,["txtZ"]=46.599},
  --Prison Tower Left
  [53] = { ["objName"] = 741314661, ["x"]= 1830.133, ["y"]= 2703.500, ["z"]= 44.443,["locked"]= true,["txtX"]= 1830.133,["txtY"]=2703.500,["txtZ"]=44.443},
  -- Prison Tower Right
  [54] = { ["objName"] = 741314661, ["x"]= 1835.287, ["y"]= 2689.103, ["z"]= 44.443,["locked"]= true,["txtX"]= 1835.287,["txtY"]=2689.103,["txtZ"]=44.443},
  -- Prison Tower
  [55] = { ["objName"] = -1033001619, ["x"]= 1845.789, ["y"]= 2698.620,["z"]= 45.955,["locked"]= true,["txtX"]=1845.789,["txtY"]=2698.620,["txtZ"]=45.955},
  -- Paleto SO Right Door (If Looking From The Inside)
  [56] = { ["objName"] = -2023754432 , ["x"]= -440.987, ["y"]= 6012.764, ["z"]= 31.866,["locked"]= true,["txtX"]= -441.730,["txtY"]=6011.900,["txtZ"]=32.066},
  -- Paleto SO Left Door (If Looking From The Inside)
  [57] = { ["objName"] = -2023754432 , ["x"]= -442.826, ["y"]= 6010.925, ["z"]= 31.866,["locked"]= true,["txtX"]= -442.100,["txtY"]=6011.570,["txtZ"]=32.066},
  -- Paleto SO locker room
  [58] = { ["objName"] = -2023754432 , ["x"]= -450.72, ["y"]= 6016.37, ["z"]= 31.87,["locked"]= true,["txtX"]= -450.02,["txtY"]=6015.70,["txtZ"]=32.05},
}
local propertyDoors = {}

RegisterServerEvent('fsn_doormanager:unlockDoor')
AddEventHandler('fsn_doormanager:unlockDoor', function(doorType, doorID)
  if doorType == 'police' then
    local door = policeDoors[doorID]
    door["locked"] = false
    TriggerClientEvent('fsn_doormanager:doorUnlocked', -1, doorType, doorID)
  end
end)

RegisterServerEvent('fsn_doormanager:lockDoor')
AddEventHandler('fsn_doormanager:lockDoor', function(doorType, doorID)
  if doorType == 'police' then
    local door = policeDoors[doorID]
    door["locked"] = true
    TriggerClientEvent('fsn_doormanager:doorLocked', -1, doorType, doorID)
  end
end)

RegisterServerEvent('fsn_doormanager:requestDoors')
AddEventHandler('fsn_doormanager:requestDoors', function()
  TriggerClientEvent('fsn_doormanager:sendDoors', source, policeDoors, propertyDoors)
end)
