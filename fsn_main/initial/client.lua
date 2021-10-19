local fsn_spawned = false
local cur_char = {}

RegisterNetEvent('spawnme')
AddEventHandler('spawnme', function()
  print'spawned'
  fsn_spawned = true
end)

local function freezePlayer(id, freeze)
    local player = id
    SetPlayerControl(player, not freeze, false)

    local ped = GetPlayerPed(player)

    if not freeze then
        if not IsEntityVisible(ped) then
            --SetEntityVisible(ped, true)
        end

        if not IsPedInAnyVehicle(ped) then
            SetEntityCollision(ped, true)
        end

        FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    else
        if IsEntityVisible(ped) then
            SetEntityVisible(ped, false)
        end

        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, true)

        if not IsPedFatallyInjured(ped) then
            ClearPedTasksImmediately(ped)
        end
    end
end

function fsn_IPLManager()
  LoadMpDlcMaps()
  EnableMpDlcMaps(true)
  RequestIpl("chop_props")
  RequestIpl("FIBlobby")
  RemoveIpl("FIBlobbyfake")
  RequestIpl("FBI_colPLUG")
  RequestIpl("FBI_repair")
  RequestIpl("v_tunnel_hole")
  RequestIpl("TrevorsMP")
  RequestIpl("TrevorsTrailer")
  RequestIpl("TrevorsTrailerTidy")
  RemoveIpl("farm_burnt")
  RemoveIpl("farm_burnt_lod")
  RemoveIpl("farm_burnt_props")
  RemoveIpl("farmint_cap")
  RemoveIpl("farmint_cap_lod")
  RequestIpl("farm")
  RequestIpl("farmint")
  RequestIpl("farm_lod")
  RequestIpl("farm_props")
  RequestIpl("facelobby")
  RemoveIpl("CS1_02_cf_offmission")
  RequestIpl("CS1_02_cf_onmission1")
  RequestIpl("CS1_02_cf_onmission2")
  RequestIpl("CS1_02_cf_onmission3")
  RequestIpl("CS1_02_cf_onmission4")
  RequestIpl("v_rockclub")
  RemoveIpl("hei_bi_hw1_13_door")
  RequestIpl("bkr_bi_hw1_13_int")
  RequestIpl("ufo")
  RemoveIpl("v_carshowroom")
  RemoveIpl("shutter_open")
  RemoveIpl("shutter_closed")
  RemoveIpl("shr_int")
  RemoveIpl("csr_inMission")
  RequestIpl("v_carshowroom")
  RequestIpl("shr_int")
  RequestIpl("shutter_closed")
  RequestIpl("smboat")
  RequestIpl("cargoship")
  RequestIpl("railing_start")
  RemoveIpl("sp1_10_fake_interior")
  RemoveIpl("sp1_10_fake_interior_lod")
  RequestIpl("sp1_10_real_interior")
  RequestIpl("sp1_10_real_interior_lod")
  RemoveIpl("id2_14_during_door")
  RemoveIpl("id2_14_during1")
  RemoveIpl("id2_14_during2")
  RemoveIpl("id2_14_on_fire")
  RemoveIpl("id2_14_post_no_int")
  RemoveIpl("id2_14_pre_no_int")
  RemoveIpl("id2_14_during_door")
  RequestIpl("id2_14_during1")
  RequestIpl("coronertrash")
  RequestIpl("Coroner_Int_on")
  RemoveIpl("Coroner_Int_off")
  RemoveIpl("bh1_16_refurb")
  RemoveIpl("jewel2fake")
  RemoveIpl("bh1_16_doors_shut")
  RequestIpl("refit_unload")
  RequestIpl("post_hiest_unload")
  RequestIpl("Carwash_with_spinners")
  RequestIpl("ferris_finale_Anim")
  RemoveIpl("ch1_02_closed")
  RequestIpl("ch1_02_open")
  RequestIpl("AP1_04_TriAf01")
  RequestIpl("CS2_06_TriAf02")
  RequestIpl("CS4_04_TriAf03")
  RemoveIpl("scafstartimap")
  RequestIpl("scafendimap")
  RemoveIpl("DT1_05_HC_REMOVE")
  RequestIpl("DT1_05_HC_REQ")
  RequestIpl("DT1_05_REQUEST")
  RequestIpl("FINBANK")
  RemoveIpl("DT1_03_Shutter")
  RemoveIpl("DT1_03_Gr_Closed")
  RequestIpl("ex_sm_13_office_01a")
  RequestIpl("ex_sm_13_office_01b")
  RequestIpl("ex_sm_13_office_02a")
  RequestIpl("ex_sm_13_office_02b")
  RequestIpl("rc12b_hospitalinterior")
  RequestIpl("rc12b_hospitalinterior_lod")
  --RequestIpl("rc12b_fixed")
  RequestIpl("CS3_05_water_grp1")
  RequestIpl("CS3_05_water_grp2")
  RequestIpl("canyonriver01")
  RequestIpl("canyonrvrdeep")
end

function fsn_mainSpawn()
  fsn_spawned = false
  local spawncoords = {x = -931.23278808594, y= 5587.6728515625, z= 91.584693908691}
  DoScreenFadeOut(500)
  --NetworkResurrectLocalPlayer(spawncoords.x, spawncoords.y, spawncoords.z, Citizen.PointerValueVector(), true, true, false)
  --TriggerEvent('PlayerSpawned')
  SetEntityCoords(PlayerPedId(), spawncoords.x, spawncoords.y, spawncoords.z)
  freezePlayer(-1, true)
  --Citizen.CreateThread(function()
    Citizen.Wait(2000)
    DoScreenFadeIn(3500)

    -- TODO: Investigate if DisableInputGroup can be used instead
    -- TODO: DisableControlAction(0, x, true) might not need to be in a loop
    local controls = {1,2,142,106,24,140,141,257,263,264,25,50}
    while not fsn_spawned do
      HideHudAndRadarThisFrame()
      --ShowCursorThisFrame()
      for _, control in pairs(controls) do
        DisableControlAction(0, control, true)
      end
      Citizen.Wait(0)
    end

    freezePlayer(-1, false)
    for _, control in pairs(controls) do
      DisableControlAction(0, control, false)
    end
  --end)
end
----------------------- Character Shit
RegisterNetEvent('fsn_main:charMenu')
AddEventHandler('fsn_main:charMenu', function()
  SetNuiFocus(true,true)
  SendNUIMessage({type='charMenu', enable=true})
  TriggerServerEvent('fsn_main:requestCharacters')
  fsn_mainSpawn()
end)

RegisterNetEvent('fsn_main:character')
RegisterNetEvent('fsn_main:initiateCharacter')
AddEventHandler('fsn_main:initiateCharacter', function(char)
  char = char[1] -- lol MySQL shit
  cur_char = char

  fsn_IPLManager()

  SetNuiFocus(false,false)
  SendNUIMessage({type='charMenu', enable=false})
  
  TriggerEvent('fsn_spawnmanager:start', char)
end)

RegisterNetEvent('fsn_main:sendCharacters')
AddEventHandler('fsn_main:sendCharacters', function(chars)
  local msg = {type = "characterInfo"}
  for i=1,3 do
    local prefix = "char"..i
    local exists = chars[i]
    msg[prefix.."_id"]    = exists and chars[i].char_id    or "nothing"
    msg[prefix.."_fname"] = exists and chars[i].char_fname or "nothing"
    msg[prefix.."_lname"] = exists and chars[i].char_lname or "nothing"
    msg[prefix.."_dob"]   = exists and chars[i].char_dob   or "nothing"
  end
  SendNUIMessage(msg)
end)

RegisterNUICallback('spawnCharacter', function(data, cb)
  TriggerServerEvent('fsn_main:getCharacter', data.character_id)
  TriggerServerEvent('fsn:playerReady')
end)

RegisterNUICallback('createCharacter', function(data, cb)
  TriggerServerEvent('fsn_main:createCharacter', data)
end)
-------------------------------------------- Store stuffs
AddEventHandler('fsn_inventory:buyItem', function(item, price, amount)
  if fsn_CanAfford(price) then
    TriggerEvent('fsn_inventory:item:add', item, amount)
    TriggerEvent('fsn_bank:change:walletMinus', price)
  else
    TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
  end
end)
-------------------------------------------- Character Saving
RegisterNetEvent('fsn_main:characterSaving')
AddEventHandler('fsn_main:characterSaving', function()
  --  Weapons
  local weapons = json.encode(exports["fsn_criminalmisc"]:GetWeapons())
  --  Clothing
  local model = json.encode(exports["fsn_clothing"]:GetOutfit())
  local vars = 'unused'
  TriggerServerEvent('fsn_main:saveCharacter', fsn_CharID(), model, vars, weapons)
end)
-------------------------------------------------------------

NetworkSetFriendlyFireOption(true)
SetCanAttackFriendly(PlayerPedId(), true, true)
------------------------------------------------------------- character changer
--[[llocal function char_change_timeout()
	local when = GetGameTimer() + 30*1000
	while not IsControlJustPressed(0,177) do
		local left = when-GetGameTimer()

		-- Some fancy message
		local text = '~r~DO NOT SWAP CHARACTER IN A ROLEPLAY SITUATION'
		Util.DrawText(text, 4, 1, 0.5,0.25, 0.6, Color.White)

		text = ("Changing character in ~b~%d~w~ seconds...")
			:format(math.ceil(left/1000))
		Util.DrawText(text, 4, 1, 0.5,0.35, 0.6, Color.White)

		text = "PRESS ~g~BACKSPACE~w~ TO CANCEL CHARACTER SWAPPING"
		Util.DrawText(text, 4, 1, 0.5,0.45, 0.6, Color.White)

		if left <= 0 then
			TriggerEvent('fsn_main:charMenu')
			return
		end
		Citizen.Wait(0)
	end
end

local char_changer = vector3(-219.72131347656, -1054.1688232422, 30.14019203186)
Util.Tick(function()
	local dist = #(char_changer-GetEntityCoords(PlayerPedId()))

	if dist < 10 then
		DrawMarker(1,pos-vector3(0,0,1),0,0,0,0,0,0,3.001,3.0001,0.4001,0,155,255,175,0,0,0,0)

		if dist < 3 then
			SetTextComponentFormat("STRING")
			AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~change character")
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustPressed(0,38) then
				char_change_timeout()
			end
		end
	end
end)

ocal char_changer = vector3(-219.72131347656, -1054.1688232422, 30.14019203186)
local midswap = false
local swapstart = 0
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    local dist = #(char_changer-GetEntityCoords(PlayerPedId()))
    if dist < 10 then
      DrawMarker(1,char_changer-vector3(0,0,1),0,0,0,0,0,0,3.001,3.0001,0.4001,0,155,255,175,0,0,0,0)
      if dist < 3 then
        if midswap then
          local rem = swapstart + 30000
          if rem < GetNetworkTime() then
            TriggerEvent('fsn_main:charMenu')
            midswap = false
            swapstart = 0
          else
            local text = "PRESS ~g~BACKSPACE~w~ TO CANCEL CHARACTER SWAPPING"
            Util.DrawText(text, 4, 1, 0.5,0.45, 0.6, Color.White)

            text = ("Changing character in ~b~%d~w~ seconds...")
              :format((rem-GetNetworkTime())/1000)
            Util.DrawText(text, 4, 1, 0.5,0.35, 0.6, Color.White)

            text = '~r~DO NOT SWAP CHARACTER IN A ROLEPLAY SITUATION'
            Util.DrawText(text, 4, 1, 0.5,0.25, 0.6, Color.White)
            if IsControlJustPressed(0,177) then
              midswap = false
              swapstart = 0
            end
          end
        else
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~change character")
          DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
            midswap = true
            swapstart = GetNetworkTime()
            --TriggerEvent('fsn_notify:displayNotification', 'This feature has been temporarily disabled.', 'centerRight', 4000, 'error')
          end
        end
      end
    end
  end
end)]]
------------------------------------------------------------- export stuff
function fsn_CharID()
  return cur_char.char_id
end
print(" ")
print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
print(":::::::::::::::::: FSN :: fsn_main loaded ::::::::::::::::::")
print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
print("::::::::: FSN framework by JamesSc0tt licensed to ::::::::::")
print("::::::::::: ****************** (Fusion Roleplay) :::::::::::")
print("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
print(" ")
