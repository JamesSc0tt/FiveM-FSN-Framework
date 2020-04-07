--New custom animations based off DavesEmotes from @davewazere
--https://forum.fivem.net/t/release-daves-emotes/140216 
--Finger Pointing is taken from @Geekness and @Hallux
--https://forum.fivem.net/t/release-finger-pointing-by-geekness/103722
--Ragdoll is from here @callmejaf
--https://forum.fivem.net/t/release-toggle-ragdoll/53668
--Crouch is from wolfknights script @WolfKnight
--https://forum.fivem.net/t/release-crouch-script-1-0-1-now-button-based/14742


-- Commands
-- Salute: 		/e salute 		: Salute your commrads!
-- Bird 1: 		/e finger 		: One hand middle Finger
-- Bird 2: 		/e finger2 		: 2 hands middle finger
-- Surrender: 	/e surrender	: Kneeldown hands behind head surrender
-- Facepalm: 	/e palm			: Facepalm
-- Notes: 		/e notes		: Write down notes on paper
-- Brief:		/e brief		: Equip a tactical brief case
-- Brief2:		/e brief2		: Equip a leather brief case
-- Foldarms:	/e foldarms		: Cross your arms 
-- Foldarms2: 	/e foldarms2	: Cross arms v2
-- Damn:		/e damn			: Throw your arms in disbelief
-- Fail:		/e fail			: Become visibly dissapointed
-- Gang1:		/e gang1		: Gang sign 1
-- Gang2:		/e gang2		: Gang sign 2
-- No:			/e no			: Shake your head no
-- Pickbutt:	/e pickbutt		: Pick your butt
-- Grab Crotch:	/e grabcrotch	: Grab your crotch
-- Peace:		/e peace		: Hold peace sign
-- Cigar:		/e cigar		: Place cigar in your mouth
-- Cigar2:		/e cigar2		: Place a burnt cigar in your mouth
-- Joint:		/e joint		: Place a joint in your mouth
-- Cig:			/e cig			: Place a cig in your mouth
-- Holdcigar:	/e holdcigar	: Hold a cigar in your hand 
-- Holdcig:		/e holdcig		: Hold a cig in your hand 
-- Holdjoint:	/e holdjoint	: Hold a joint in your hand
-- Dead:		/e dead			: Play dead
-- Holster:		/e holster		: Hand hovers over holster 
-- Aim:			/e aim			: Aim a pistol at the floor 
-- Aim2:		/e aim2			: Aim a pistol up to your shoulder
-- 				/e slowclap		: Slowly clap your hands
--				/e box			: Pull out a box and walk around with it
--				/e cheer		: Cheer
--				/e bum			: Lay on the ground like a bum
--				/e leanwall		: Lean against a wall
--				/e copcrowd1	: Calm down a crowd like a cop
--				/e copcrowd2	: Control a scene like a cop
--				/e copidle		: idle like a cop


-- If you want ESX features enabled you can uncomment this stuff
--------------------------------------------------------------------------------------------- ESX SUPPORT ---------------------------------------------------------------------------------------------


--ESX 			    			= nil
--local PlayerData 				= {}

--Citizen.CreateThread(function()
--	while ESX == nil do
--		TriggerEvent('1a4d29ac-5c1a-427e-ab18-461ae6b76e8b', function(obj) ESX = obj end)
--		Citizen.Wait(0)
--	end
--end)

--RegisterNetEvent('321236ce-42a6-43d8-af3d-e0e30c9e66b7')
--AddEventHandler('321236ce-42a6-43d8-af3d-e0e30c9e66b7', function(xPlayer)
--  PlayerData = xPlayer
--end)

--RegisterNetEvent('394084c7-ac07-424a-982b-ab2267d8d55f')
--AddEventHandler('394084c7-ac07-424a-982b-ab2267d8d55f', function(job)
--  PlayerData.job = job
--end)

------------------------------------------------------------------------------------------ END ESX SUPPORT ------------------------------------------------------------------------------------------

local radioActive 				= false
local radioButton				= 303 --- U by default  -- use 57 for f10
local handsUpButton				= 74 --- H by default -- use 73 for X

--[[Function for radio chatter function
Citizen.CreateThread( function()

	while true do
		Citizen.Wait(0)
		-- if you use ESX Framework and want this to be a cop only thing then replace the line below this with the following:
		-- if (PlayerData.job ~= nil and PlayerData.job.name == 'police') and (IsControlJustPressed(0,radioButton)) then
		if (IsControlJustPressed(0,radioButton))  then
			local ped = PlayerPedId()
			--TriggerEvent('chatMessage', 'TESTING ANIMATION')
	
			if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
				radioActive = true
	
				if radioActive then
	
					RequestAnimDict( "random@arrests" )
	
					while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
						Citizen.Wait( 100 )
					end
	
					if IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_chatter", 3) then
						ClearPedSecondaryTask(ped)
					else
						TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
						local prop_name = prop_name
						local secondaryprop_name = secondaryprop_name
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						DetachEntity(secondaryprop, 1, 1)
						DeleteObject(secondaryprop)
						--SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
					end
				end
			end
		end
	end
end)
	
--- Broke this into two functions because it was bugging out for some reason.
	
Citizen.CreateThread( function()
	
	while true do
		Citizen.Wait(0)
		-- if you use ESX Framework and want this to be a cop only thing then replace the line below this with the following:
		-- if (PlayerData.job ~= nil and PlayerData.job.name == 'police') and (IsControlJustReleased(0,57))  and (radioActive) then
		if (IsControlJustReleased(0,raisehandbutton))  and (radioActive) then
			local ped = PlayerPedId()
	
			if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
				radioActive = false
				ClearPedSecondaryTask(ped)
				--SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
			end
		end

			
	end
	
end)


Citizen.CreateThread( function()

	while true do
		Citizen.Wait(0)
		if (IsControlJustPressed(0,handsUpButton))  then
			local ped = PlayerPedId()
	
			if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	
				RequestAnimDict( "random@mugging3" )
	
				while ( not HasAnimDictLoaded( "random@mugging3" ) ) do 
					Citizen.Wait( 100 )
				end
	
				if IsEntityPlayingAnim(ped, "random@mugging3", "handsup_standing_base", 3) then
					ClearPedSecondaryTask(ped)
				else
					TaskPlayAnim(ped, "random@mugging3", "handsup_standing_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
					local prop_name = prop_name
					local secondaryprop_name = secondaryprop_name
					DetachEntity(prop, 1, 1)
					DeleteObject(prop)
					DetachEntity(secondaryprop, 1, 1)
					DeleteObject(secondaryprop)
				end
			end
		end
	end
end)]]


RegisterCommand("ce",function(source, args)
	local player = PlayerPedId()
	if tostring(args[1]) == nil then
		print("Invalid syntax, correct syntax is: /e <animation> ")
		return
	else
		if tostring(args[1]) ~= nil then
            local argh = tostring(args[1])

			if argh == 'busted' then
				local surrendered = false
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( "random@arrests" )
					loadAnimDict( "random@arrests@busted" )
					if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
						TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (3000)
						TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
						surrendered = false
					else
						TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (4000)
						TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (500)
						TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (1000)
						TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
						Wait(100)
						surrendered = true
					end     
				end

				Citizen.CreateThread(function() --disabling controls while surrendured
					while surrendered do
						Citizen.Wait(0)
						if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
							DisableControlAction(1, 140, true)
							DisableControlAction(1, 141, true)
							DisableControlAction(1, 142, true)
							DisableControlAction(0,21,true)
						end
					end
				end)


			elseif argh == 'salute' then
				local ad = "anim@mp_player_intuppersalute"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (600)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'finger' then
				local ad = "anim@mp_player_intselfiethe_bird"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'finger2' then
				local ad = "anim@mp_player_intupperfinger"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'palm' then
				local ad = "anim@mp_player_intupperface_palm"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'notes' then
				local ad = "missheistdockssetup1clipboard@base"
				
				local prop_name = prop_name or 'prop_notepad_01'
				local secondaryprop_name = secondaryprop_name or 'prop_pencil_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						DetachEntity(secondaryprop, 1, 1)
						DeleteObject(secondaryprop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						secondaryprop = CreateObject(GetHashKey(secondaryprop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 18905), 0.1, 0.02, 0.05, 10.0, 0.0, 0.0, true, true, false, true, 1, true) -- notepad
						AttachEntityToEntity(secondaryprop, player, GetPedBoneIndex(player, 58866), 0.12, 0.0, 0.001, -150.0, 0.0, 0.0, true, true, false, true, 1, true) -- pencil
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'callphone' then
				local ad = "cellphone@"
				
				local prop_name = prop_name or 'prop_player_phone_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.15, 0.02, -0.01, 105.0, -20.0, 90.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "cellphone_call_listen_base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			elseif argh == 'foldarms2' then
				local ad = "missfbi_s4mop"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "guard_idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "guard_idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			elseif argh == 'umbrella' then
				local ad = "amb@world_human_drinking@coffee@male@base"
                
                local prop_name = prop_name or 'p_amb_brolly_01'
                
                if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
                    loadAnimDict( ad )
					
                    if prop then  -- CHECKS IF OBJECT IS THERE
                        TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
                        Wait (100)
                        DetachEntity(prop, 1, 1)
                        DeleteObject(prop)
                        ClearPedSecondaryTask(PlayerPedId())
						prop = nil -- MUST DEFINE IT AFTER DELETED IT AS IT STILL THINKS ITS THERE
                    else
                        local x,y,z = table.unpack(GetEntityCoords(player))
                        prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
                        AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.15, 0.005, -0.02, 80.0, -20.0, 175.0, true, true, false, true, 1, true)
                        TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
                    end 
                end
			elseif argh == 'brief' then
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					GiveWeaponToPed(player, 0x88C78EB7, 1, false, true);
				end
			elseif argh == 'brief2' then
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					GiveWeaponToPed(player, 0x01B79F17, 1, false, true);
				end
			elseif argh == 'foldarms' then
				local ad = "oddjobs@assassinate@construction@"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "unarmed_fold_arms", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "unarmed_fold_arms", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )

					end     
				end
			elseif argh == 'damn' then
				local ad = "gestures@m@standing@casual"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "gesture_damn", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "gesture_damn", 8.0, 1.0, -1, 120, 0, 0, 0, 0 )
					end     
				end
			--[[elseif argh == 'fail' then
				local ad = "random@car_thief@agitated@idle_a"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "agitated_idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "agitated_idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'gang1' then
				local ad = "mp_player_int_uppergang_sign_a"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_gang_sign_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_gang_sign_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'gang2' then
				local ad = "mp_player_int_uppergang_sign_b"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_gang_sign_b", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_gang_sign_b", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end --]]
			elseif argh == 'no' then
				local ad = "mp_player_int_upper_nod"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_nod_no", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_nod_no", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'pickbutt' then
				local ad = "mp_player_int_upperarse_pick"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_arse_pick", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_arse_pick", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'grabcrotch' then
				local ad = "mp_player_int_uppergrab_crotch"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_grab_crotch", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_grab_crotch", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'peace' then
				local ad = "mp_player_int_upperpeace_sign"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_peace_sign", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_peace_sign", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'cigar' then
				local cigar_name = cigar_name or 'prop_cigar_02' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.0001, 0.003, 55.0, 0.0, -85.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'cigar2' then
				local cigar_name = cigar_name or 'prop_cigar_01' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.0001, 0.003, 55.0, 0.0, -85.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'joint' then
				local cigar_name = cigar_name or 'p_cs_joint_02' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'cig' then
				local cigar_name = cigar_name or 'prop_amb_ciggy_01' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'holdcigar' then
				local cigar_name = cigar_name or 'prop_cigar_03' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 26611), 0.045, -0.05, -0.010, -75.0, 0.0, 65.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'holdcig' then
				local cigar_name = cigar_name or 'prop_amb_ciggy_01' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 26611), 0.035, -0.01, -0.010, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'holdjoint' then
				local cigar_name = cigar_name or 'p_cs_joint_02' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 26611), 0.035, -0.01, -0.010, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
					end     
				end
			elseif argh == 'dead' then
				local ad = "misslamar1dead_body"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "dead_idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "dead_idle", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'holster' then
				local ad = "move_m@intimidation@cop@unarmed"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'aim' then
				local ad = "move_weapon@pistol@copa"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'aim2' then
				local ad = "move_weapon@pistol@cope"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end

			elseif argh == 'guard' then
				local ad = "rcmepsilonism8"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "base_carrier", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "base_carrier", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end

			elseif argh == 'box' then
				local ad = "anim@heists@box_carry@"
				
				local prop_name = prop_name or 'hei_prop_heist_box'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			elseif argh == 'slowclap' then
				local ad = "anim@mp_player_intcelebrationmale@slow_clap"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
						loadAnimDict( ad )
						if ( IsEntityPlayingAnim( player, ad, "slow_clap", 3 ) ) then 
							TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							ClearPedSecondaryTask(player)
							Wait (100)
						else
							TaskPlayAnim( player, ad, "slow_clap", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							Wait (500)
						end       
					end
				end

			elseif argh == 'cheer' then
				local ad = "amb@world_human_cheering@male_a"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
						loadAnimDict( ad )
						if ( IsEntityPlayingAnim( player, ad, "base", 3 ) ) then 
							TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							ClearPedSecondaryTask(player)
							Wait (100)
						else
							TaskPlayAnim( player, ad, "base", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							Wait (500)
						end       
					end
				end

			elseif argh == 'bum' then
				local ad = "amb@lo_res_idles@"
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "world_human_bum_slumped_left_lo_res_base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (100)
					else
						TaskPlayAnim( player, ad, "world_human_bum_slumped_left_lo_res_base", 5.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (500)
					end     
				end
			elseif argh == 'leanwall' then
				local ad = "amb@lo_res_idles@"
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "world_human_lean_male_foot_up_lo_res_base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (100)
					else
						TaskPlayAnim( player, ad, "world_human_lean_male_foot_up_lo_res_base", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (500)
					end     
				end
			elseif argh == 'copcrowd' then
				local ad = "amb@code_human_police_crowd_control@idle_a" --- insert the animation dic here
				local anim = "idle_a" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			elseif argh == 'copcrowd2' then
				local ad = "amb@code_human_police_crowd_control@idle_b" --- insert the animation dic here
				local anim = "idle_d" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'copidle' then

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_COP_IDLES', 0, 1)   
					end 
				end
			
			-- Noobys Animations
			elseif argh == 'sit' then
				local ad = "anim@heists@prison_heistunfinished_biztarget_idle" --- insert the animation dic here
				local anim = "target_idle" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'sit2' then
				local ad = "rcm_barry3" --- insert the animation dic here
				local anim = "barry_3_sit_loop" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'hostage' then
				local ad = "anim@heists@fleeca_bank@hostages@ped_d@door" --- insert the animation dic here
				local anim = "loop" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
				
			elseif argh == 'sit3' then
				local ad = "anim@heists@fleeca_bank@ig_7_jetski_owner" --- insert the animation dic here
				local anim = "owner_idle" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'earpiece' then
				local ad = "oddjobs@assassinate@guard"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "unarmed_earpiece_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "unarmed_earpiece_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
				
		    --[[elseif argh == 'arrest' then
				local ad = "random@arrests@busted"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end 
				
			elseif argh == 'tied' then
				local ad = "mp_arresting"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end --]]
				
			elseif argh == 'shower' then
				local ad = "mp_safehouseshower@male@" --- insert the animation dic here
				local anim = "male_shower_idle_a" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'shower2' then
				local ad = "mp_safehouseshower@male@" --- insert the animation dic here
				local anim = "male_shower_idle_b" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'shower3' then
				local ad = "mp_safehouseshower@female@" --- insert the animation dic here
				local anim = "shower_idle_a" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				

			elseif argh == 'pizza' then
				local ad = "anim@heists@box_carry@"
				
				local prop_name = prop_name or 'prop_pizza_box_02'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.215, 0.05, 0.200, -50.0, 290.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
				
			
			elseif argh == 'drug' then
				local ad = "anim@heists@box_carry@"
				
				local prop_name = prop_name or 'prop_mp_drug_package'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.115, 0.12, 0.23, -50.0, 290.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
					
					
			elseif argh == 'wine' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'prop_wine_bot_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.16, -0.090, -0.08, 80.0, -20.0, 175.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
				
			elseif argh == 'beer' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'prop_amb_beer_bottle'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.15, 0.09, -0.02, 80.0, -20.0, 175.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
				
			elseif argh == 'shopping' then
				local cigar_name = cigar_name or 'prop_shopping_bags01' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 26611), 0.015, -0.05, -0.020, 10.0, -60.0, -65.0, true, true, false, true, 1, true)
					end 
				end
				
				
			elseif argh == 'aim3' then
				local ad = "move_weapon@pistol@copc"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
				
			elseif argh == 'lapdance' then
				local ad = "mp_safehouse" --- insert the animation dic here
				local anim = "lap_dance_girl" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			
			--New Animations
			
			--[[elseif argh == 'tst' then
				local ad = "missmic3"
				
				local prop_name = prop_name or 'prop_cs_newspaper'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 6286), 0.11, 0.248, -0.351, 14.0, 100.0, 15.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "newspaper_dialogue_idle_dave", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end --]]
			
			elseif argh == 'dice' then
				local ad = "mp_player_intwank"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_wank", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_wank", 8.0, 1.0, -1, 120, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'tablet2' then
				local ad = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a"
				
				local prop_name = prop_name or 'prop_cs_tablet'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.0, -0.01, -0.04, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle_b", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'tablet' then
				local ad = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a"
				
				local prop_name = prop_name or 'hei_prop_dlc_tablet'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.0, -0.01, -0.04, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle_b", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'pot' then

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_SMOKING_POT', 0, 1)   
					end 
				end
			
			elseif argh == 'layfront' then

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_SUNBATHE', 0, 1)   
					end 
				end
			
			elseif argh == 'layback' then

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_SUNBATHE_BACK', 0, 1)   
					end 
				end
			
			elseif argh == 'dead4' then
				local ad = "missprologueig_6"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "lying_dead_brad", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "lying_dead_brad", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'dead3' then
				local ad = "missprologueig_6"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "lying_dead_player0", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "lying_dead_player0", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'collect' then
				local ad = "anim@heists@money_grab@briefcase"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "loop", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "loop", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'tire2' then
				local ad = "anim@heists@money_grab@duffel"
				
				local object_name = object_name or 'prop_wheel_tyre'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if object then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(object, 1, 1)
						DeleteObject(object)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						object = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						TaskPlayAnim( player, ad, "enter", 3.0, -8, -1, 2, 0, 0, 0, 0 )
						Wait(800)
						object = CreateObject(GetHashKey(object_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(object, player, GetPedBoneIndex(player, 0x6e5c), 0.35, 0.22, -0.1, 40.0, 50.0, 0.0, true, true, false, true, 1, true)
					end 
				end
			
			elseif argh == 'bumper2' then
				local ad = "anim@heists@box_carry@"
				
				local prop_name = prop_name or 'prop_bumper_04'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.16, -0.27, 0.15, 185.0, 290.0, -20.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'bumper' then
				local ad = "anim@heists@box_carry@"
				
				local prop_name = prop_name or 'prop_bumper_02'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.16, -0.05, 0.15, -185.0, 290.0, -10.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'nod2' then
				local ad = "gestures@m@standing@casual"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "gesture_nod_yes_hard", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "gesture_nod_yes_hard", 8.0, 1.0, -1, 120, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'nod' then
				local ad = "gestures@m@standing@casual"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "gesture_nod_yes_soft", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "gesture_nod_yes_soft", 8.0, 1.0, -1, 120, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'toolbox3' then
				local ad = "move_m@brave@idle_a"
				local cigar_name = cigar_name or 'prop_toolchest_01' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 57005), 0.49, 0.0, -0.03, 0.0, -90.0, 80.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'toolbox2' then
				local ad = "move_m@brave@idle_a"
				local cigar_name = cigar_name or 'prop_tool_box_04' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 57005), 0.44, 0.0, -0.03, 0.0, -90.0, 80.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'toolbox' then
				local ad = "move_m@brave@idle_a"
				local cigar_name = cigar_name or 'prop_tool_box_02' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 57005), 0.54, 0.0, -0.03, 0.0, -90.0, 80.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'drug3' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'hei_prop_hei_drug_pack_02'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.14, 0.02, -0.06, 80.0, -40.0, 70.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'drug2' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'hei_prop_hei_drug_pack_01a'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.19, 0.02, -0.08, 80.0, -40.0, 70.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'tire' then
				local ad = "missfinale_c2mcs_1"
				
				local object_name = object_name or 'prop_wheel_tyre'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if object then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(object, 1, 1)
						DeleteObject(object)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						object = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						object = CreateObject(GetHashKey(object_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(object, player, GetPedBoneIndex(player, 40269), 0.2, 0.12, 0.04, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "fin_c2_mcs_1_camman", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'burger2' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'prop_cs_burger_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.16, 0.07, -0.02, 80.0, -40.0, 70.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'burgershot5' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'Prop_food_bs_coffee'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.16, 0.01, -0.05, 80.0, -40.0, 160.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'burger' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'Prop_food_bs_burg1'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.16, 0.07, -0.08, 80.0, -40.0, 70.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'burgershot4' then
				local cigar_name = cigar_name or 'prop_food_bs_bag_01' --noprop
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if IsCigar then
						Wait(500)
						DetachEntity(cigar, 1, 1)
						DeleteObject(cigar)
						IsCigar = false
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						cigar = CreateObject(GetHashKey(cigar_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(cigar, playerPed, GetPedBoneIndex(playerPed, 57005), 0.35, 0.0, -0.03, 0.0, -90.0, 50.0, true, true, false, true, 1, true)
					end 
				end
			
			elseif argh == 'dance39' then
				local ad = "misschinese2_crystalmazemcs1_ig"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "dance_loop_tao", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "dance_loop_tao", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'shot' then
				local ad = "anim@mini@yacht@bar@drink@three"
				
				local prop_name = prop_name or 'prop_whiskey_bottle'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						TaskPlayAnim( player, ad, "three_player", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait(5000)
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.1, -0.15, -0.13, 60.0, 0.0, 175.0, true, true, false, true, 1, true)
						Wait(5000)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
					end 
				end
			
			elseif argh == 'boxing' then
				local prop_name = prop_name or 'prop_boxing_glove_01' --noprop
				local secondaryprop_name = secondaryprop_name or 'prop_boxing_glove_01'
				local playerPed = PlayerPedId()
				
				if ( DoesEntityExist( playerPed ) and not IsEntityDead( playerPed )) then 
					if prop then
						Wait(0)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						DetachEntity(secondaryprop, 1, 1)
						DeleteObject(secondaryprop)
						prop = nil
					else
						IsCigar = true
						Wait(500)
						local x,y,z = table.unpack(GetEntityCoords(playerPed))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						secondaryprop = CreateObject(GetHashKey(secondaryprop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.0, 0.0, -0.03, 0.0, 90.0, 110.0, true, true, false, true, 1, true)
						AttachEntityToEntity(secondaryprop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.0, 0.0, 0.03, 0.0, 90.0, -110.0, true, true, false, true, 1, true)
					end 
				end
			
			elseif argh == 'tire3' then
				local ad = "missfinale_c2mcs_1"
				
				local object_name = object_name or 'prop_rub_tyre_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if object then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(object, 1, 1)
						DeleteObject(object)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						object = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						object = CreateObject(GetHashKey(object_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(object, player, GetPedBoneIndex(player, 40269), 0.2, 0.05, 0.1, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "fin_c2_mcs_1_camman", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'burgershot3' then
				local ad = "anim@heists@box_carry@"
				
				local object_name = object_name or 'prop_food_bs_tray_03'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if object then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(object, 1, 1)
						DeleteObject(object)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						object = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						object = CreateObject(GetHashKey(object_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(object, player, GetPedBoneIndex(player, 60309), 0.24, 0.05, 0.200, -50.0, 290.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'burgershot2' then
				local ad = "anim@heists@box_carry@"
				
				local object_name = object_name or 'prop_food_bs_tray_02'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if object then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(object, 1, 1)
						DeleteObject(object)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						object = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						object = CreateObject(GetHashKey(object_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(object, player, GetPedBoneIndex(player, 60309), 0.24, 0.05, 0.200, -50.0, 290.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'swing4' then
				local ad = "anim@deathmatch_intros@melee@2h"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "intro_male_melee_2h_d", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "intro_male_melee_2h_d", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'swing3' then
				local ad = "anim@deathmatch_intros@melee@2h"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "intro_male_melee_2h_c", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "intro_male_melee_2h_c", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'swing2' then
				local ad = "anim@deathmatch_intros@melee@2h"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "intro_male_melee_2h_e", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "intro_male_melee_2h_e", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'swing' then
				local ad = "anim@deathmatch_intros@melee@2h"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "intro_male_melee_2h_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "intro_male_melee_2h_a", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'mechanic2' then
				local ad = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "machinic_loop_mechandplayer", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "machinic_loop_mechandplayer", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'mechanic' then
				local ad = "amb@world_human_vehicle_mechanic@male@idle_a"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			--[[elseif argh == 'drill' then
				local ad = "anim@heists@fleeca_bank@drilling"
				
				local object_name = object_name or 'hei_prop_heist_drill'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if object then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(object, 1, 1)
						DeleteObject(object)
						ClearPedSecondaryTask(PlayerPedId())
						object = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						object = CreateObject(GetHashKey(object_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(object, player, GetPedBoneIndex(player, 57005), 0.13, 0.02, -0.04, 110.0, -90.0, 160.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "drill_straight_start", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end 
				end--]]
			
			elseif argh == 'talk4' then
				local ad = "rcmepsilonism8"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "think", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "think", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'wave2' then
				local ad = "rcmepsilonism8"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "security_greet", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "security_greet", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'meditate' then
				local ad = "rcmcollect_paperleadinout@"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "meditiate_idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "meditiate_idle", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'hurt3' then
				local ad = "rcm_fanatic2"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "ef_2_rcm_cyclist_punched_out", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "ef_2_rcm_cyclist_punched_out", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'impatient4' then
				local ad = "rcm_epsilonism4"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "hippy_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "hippy_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'squat2' then
				local ad = "rcm_epsilonism4"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "ep_4_rcm_marnie_lookaround_marnie", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "ep_4_rcm_marnie_lookaround_marnie", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'gang3' then
				local ad = "rcm_epsilonism4"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "ep_4_rcm_jimmyboston_base_jb", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "ep_4_rcm_jimmyboston_base_jb", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'streetrace' then
				local ad = "random@street_race"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "grid_girl_race_start", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "grid_girl_race_start", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
						Wait(10100)
						ClearPedTasks(PlayerPedId())
					end     
				end
			
			elseif argh == 'help' then
				local ad = "random@hitch_lift"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "carjack_mainloop_female", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "carjack_mainloop_female", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'scared' then
				local ad = "random@domestic"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "f_distressed_loop", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "f_distressed_loop", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'taxi' then
				local ad = "rcmnigel1c"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "hailing_whistle_waive_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "hailing_whistle_waive_a", 8.0, 1.0, -1, 120, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'hurt2' then
				local ad = "random@dealgonewrong"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_b", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle_b", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'preach2' then
				local ad = "random@bus_tour_guide@idle_a"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'preach' then
				local ad = "random@bus_tour_guide@idle_a"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_c", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle_c", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'impatient3' then
				local ad = "oddjobs@taxi@gyn@cc@intro"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "m_impatient_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "m_impatient_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'impatient2' then
				local ad = "oddjobs@taxi@gyn@cc@intro"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "f_impatient_c", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "f_impatient_c", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'impatient' then
				local ad = "oddjobs@taxi@gyn@cc@intro"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "f_impatient_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "f_impatient_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'callphone2' then
				local ad = "oddjobs@bailbond_quarry"
				
				local prop_name = prop_name or 'prop_player_phone_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.15, 0.02, -0.01, 105.0, -20.0, 90.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "prem_producer_argue_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'crazy3' then
				local ad = "oddjobs@bailbond_mountain"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "base_jump_idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "base_jump_idle", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'crazy2' then
				local ad = "oddjobs@bailbond_hobotwitchy"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_b", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle_b", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'crazy' then
				local ad = "oddjobs@bailbond_hobotwitchy"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'talk3' then
				local ad = "oddjobs@bailbond_mountain"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "excited_idle_b", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "excited_idle_b", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'talk2' then
				local ad = "oddjobs@bailbond_hobohang_out_street_c"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait(4000)
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait(4000)
						TaskPlayAnim( player, ad, "idle_c", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait(8000)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'talk' then
				local ad = "oddjobs@bailbond_hobohang_out_street_b"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_c", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle_c", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'sad' then
				local ad = "oddjobs@bailbond_hobodepressed"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'kick2' then
				local ad = "missheistdockssetup1ig_13@kick_idle"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "guard_beatup_kickidle_guard1", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "guard_beatup_kickidle_guard1", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'kick' then
				local ad = "missheistdockssetup1ig_13@kick_idle"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "guard_beatup_kickidle_guard2", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "guard_beatup_kickidle_guard2", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'dead2' then
				local ad = "misssolomon_5@end"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "dead_black_ops", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "dead_black_ops", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'wipe' then
				local ad = "missheistpaletoscore1leadinout"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "trv_upperbody_leadout", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "trv_upperbody_leadout", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'leanwall2' then
				local ad = "missheistdockssetup1ig_10@base"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "talk_pipe_base_worker2", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "talk_pipe_base_worker2", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'hurt' then
				local ad = "missheistdockssetup1ig_13@exit"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "guard_beatup_rollidle_dockworker", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "guard_beatup_rollidle_dockworker", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'hunchback' then
				local ad = "missfbi3ig_0"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "shit_loop_trev", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "shit_loop_trev", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			
			--[[elseif argh == 'squat' then
				local ad = "missfbi3ig_0"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "shit_loop_trev", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "shit_loop_trev", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end--]]
			
			elseif argh == 'car' then
				local ad = "missarmenian1driving_taunts@franklin"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "heymotherfuckayoudriveslowasfuck", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "heymotherfuckayoudriveslowasfuck", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'salsa2' then
				local ad = "anim@mp_player_intcelebrationfemale@salsa_roll"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "salsa_roll", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "salsa_roll", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'salsa' then
				local ad = "anim@mp_player_intcelebrationmale@salsa_roll"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "salsa_roll", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "salsa_roll", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
				
			elseif argh == 'coffee' then

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'world_human_aa_coffee', 0, 1)   
					end 
				end
			
			elseif argh == 'key' then
				local ad = "anim@mp_player_intmenu@key_fob@"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "fob_click", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "fob_click", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'piss' then
				local ad = "missbigscore1switch_trevor_piss"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "piss_loop", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "piss_loop", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'id' then
				local ad = "random@atmrobbery1"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "return_wallet_positive_a_player", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "return_wallet_positive_a_player", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'lockpick' then
				local ad = "missheistfbisetup1"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "hassle_intro_loop_f", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "hassle_intro_loop_f", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'tiedfloor' then
				local ad = "random@burial"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "b_burial", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "b_burial", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'burgershot' then
				local ad = "anim@heists@box_carry@"
				
				local prop_name = prop_name or 'prop_food_bs_tray_01'
				local secondaryprop_name = secondaryprop_name or 'prop_cs_bs_cup'
				local thirdprop_name = thirdprop_name or 'prop_cs_burger_01'
				local fourthprop_name = fourthprop_name or 'prop_cs_burger_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						DetachEntity(secondaryprop, 1, 1)
						DeleteObject(secondaryprop)
						DetachEntity(thirdprop, 1, 1)
						DeleteObject(thirdprop)
						DetachEntity(fourthprop, 1, 1)
						DeleteObject(fourthprop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						secondaryprop = CreateObject(GetHashKey(secondaryprop_name), x, y, z+0.2,  true,  true, true)
						thirdprop = CreateObject(GetHashKey(thirdprop_name), x, y, z+0.2,  true,  true, true)
						fourthprop = CreateObject(GetHashKey(fourthprop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 60309), 0.24, 0.05, 0.200, -50.0, 290.0, 0.0, true, true, false, true, 1, true)
						AttachEntityToEntity(secondaryprop, player, GetPedBoneIndex(player, 60309), 0.24, 0.15, 0.17, -50.0, 290.0, 0.0, true, true, false, true, 1, true)
						AttachEntityToEntity(thirdprop, player, GetPedBoneIndex(player, 60309), 0.3, 0.11, 0.34, -50.0, 290.0, 0.0, true, true, false, true, 1, true)
						AttachEntityToEntity(fourthprop, player, GetPedBoneIndex(player, 60309), 0.16, 0.06, 0.14, -50.0, 290.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'soda' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'prop_cs_bs_cup'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.13, -0.02, -0.04, 80.0, -20.0, 175.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'check' then
				local surrendered = false
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( "clothingtie" )
					loadAnimDict( "clothingtrousers" )
					loadAnimDict( "clothingshirt" )
					if ( IsEntityPlayingAnim( player, "clothingtie", "try_tie_positive_a", 3 ) ) then 
						TaskPlayAnim( player, "clothingtrousers", "try_trousers_positive_b", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (1000)
						surrendered = false
					else
						TaskPlayAnim( player, "clothingtie", "try_tie_positive_a", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
						Wait (6000)
						TaskPlayAnim( player, "clothingtrousers", "try_trousers_positive_a", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
						Wait (4000)
						TaskPlayAnim( player, "clothingtrousers", "try_trousers_positive_b", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
						Wait (4000)
						surrendered = true
					end     
				end
			
			elseif argh == 'sniff' then
				local surrendered = false
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( "safe@trevor@ig_8" )
					if ( IsEntityPlayingAnim( player, "safe@trevor@ig_8", "ig_8_huff_gas_player", 3 ) ) then 
						TaskPlayAnim( player, "safe@trevor@ig_8", "ig_8_wake_up_front_player", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
						Wait (1000)
						surrendered = false
					else
						TaskPlayAnim( player, "safe@trevor@ig_8", "ig_8_huff_gas_player", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait (12000)
						TaskPlayAnim( player, "safe@trevor@ig_8", "ig_8_wake_up_front_player", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait (4000)
						surrendered = true
					end     
				end
			
			elseif argh == 'bong' then
				local ad = "anim@safehouse@bong"
				
				local prop_name = prop_name or 'prop_sh_bong_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "bong_stage2", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 18905), 0.10, -0.2, 0.11, -110.0, 0.0, 0.0, true, true, false, true, 1, true) -- notepad
						TaskPlayAnim( player, ad, "bong_stage2", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
						Wait (12000)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
					end     
				end
			
			elseif argh == 'rose' then
				local ad = "amb@world_human_drinking@coffee@male@base"
                
                local prop_name = prop_name or 'prop_single_rose'
                
                if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
                    loadAnimDict( ad )
					
                    if prop then  -- CHECKS IF OBJECT IS THERE
                        TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
                        Wait (100)
                        DetachEntity(prop, 1, 1)
                        DeleteObject(prop)
                        ClearPedSecondaryTask(PlayerPedId())
						prop = nil -- MUST DEFINE IT AFTER DELETED IT AS IT STILL THINKS ITS THERE
                    else
                        local x,y,z = table.unpack(GetEntityCoords(player))
                        prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
                        AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.15, 0.005, -0.02, 80.0, -20.0, 175.0, true, true, false, true, 1, true)
                        TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
                    end 
                end
			
			elseif argh == 'sassy2' then
				local ad = "anim@mp_player_intcelebrationpaired@f_f_sarcastic"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "sarcastic_left", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "sarcastic_left", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'sassy' then
				local ad = "anim@mp_player_intcelebrationpaired@f_f_sarcastic"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "sarcastic_right", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "sarcastic_right", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'tired' then
				local ad = "re@construction"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "out_of_breath", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "out_of_breath", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'wave' then
				local ad = "gestures@m@standing@casual"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "gesture_hello", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "gesture_hello", 8.0, 1.0, -1, 0, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'smoke' then

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_SMOKING', 0, 1)   
					end 
				end
			
			elseif argh == 'kneel' then

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'CODE_HUMAN_MEDIC_KNEEL', 0, 1)   
					end 
				end
				
			elseif argh == 'lean' then

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'prop_human_bum_shopping_cart', 0, 1)   
					end 
				end
			
			elseif argh == 'cane' then
				local ad = "missheist_jewellester_waitidles"
				
				local prop_name = prop_name or 'prop_cs_walking_stick'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.10, 0.02, -0.07, 70.0, 15.0, -100.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "lester_waitidle_1", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'protest' then
				local ad = "amb@world_human_drinking@coffee@male@base"
				
				local prop_name = prop_name or 'prop_cs_protest_sign_01'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (100)
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 57005), 0.15, 0.09, 0.02, 120.0, -120.0, 175.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			
			elseif argh == 'backpack' then
				local ad = "move_m@hiking"
				
				local prop_name = prop_name or 'prop_michael_backpack'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 24818), 0.1, -0.18, -0.04, -170.0, 270.0, 0.0, true, true, false, true, 1, true)
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end
				
			--[[elseif argh == 'hiking' then
				local ad = "move_m@hiking"
				
				local prop_name = prop_name or 'prop_luggage_09a'
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if prop then
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						Wait(1000)
						ClearPedSecondaryTask(PlayerPedId())
						prop = nil
					else
						local x,y,z = table.unpack(GetEntityCoords(player))
						prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
						AttachEntityToEntity(prop, player, GetPedBoneIndex(player, 24818), -0.05, -0.28, -0.0, 370.0, -270.0, 0.0, true, true, false, true, 1, true)
						SetEntityNoCollisionEntity(prop, prop, false)
						print(HasCollisionLoadedAroundEntity(prop))
						print(GetEntityCollisonDisabled(prop))
						TaskPlayAnim( player, ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
					end 
				end--]]
			
			elseif argh == 'think' then
				local ad = "anim@amb@board_room@whiteboard@"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "think_01_amy_skater_01", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "think_01_amy_skater_01", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			
			elseif argh == 'rally' then
				local ad = "swat"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "rally_point", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "rally_point", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					end     
				end
				
			elseif argh == 'freeze' then
				local ad = "swat"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "freeze", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "freeze", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					end     
				end
				
			elseif argh == 'come' then
				local ad = "swat"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "come", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "come", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					end     
				end
				
			elseif argh == 'go' then
				local ad = "swat"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "go_fwd", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "go_fwd", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					end     
				end
				
			elseif argh == 'yes' then
				local ad = "swat"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "understood", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "understood", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					end     
				end
				
			elseif argh == 'fwd' then
				local ad = "swat"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "you_fwd", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "you_fwd", 8.0, 1.0, -1, 32, 0, 0, 0, 0 )
					end     
				end

			--Dance Animations
				
			elseif argh == 'dance2' then
				local ad = "anim@amb@nightclub@djs@black_madonna@" --- insert the animation dic here
				local anim = "dance_a_loop_blamadon" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance3' then
				local ad = "anim@amb@nightclub@djs@black_madonna@" --- insert the animation dic here
				local anim = "dance_b_idle_a_blamadon" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance4' then
				local ad = "anim@amb@nightclub@djs@black_madonna@" --- insert the animation dic here
				local anim = "dance_b_idle_b_blamadon" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance5' then
				local ad = "anim@amb@nightclub@djs@black_madonna@" --- insert the animation dic here
				local anim = "dance_b_idle_c_blamadon" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance6' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_li_06_base_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance7' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_hi_11_buttwiggle_b_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance8' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_hi_11_buttwiggle_f_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance9' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_hi_11_turnaround_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance10' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_hi_13_crotchgrab_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance11' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_hi_13_flyingv_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance12' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_hi_15_crazyrobot_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance13' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_hi_17_smackthat_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance14' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_hi_17_spiderman_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance15' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_li_11_pointcrowd_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance16' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_li_13_hipswivel_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance17' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_li_13_turnaround_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance18' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_li_15_flyingv_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance19' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_li_15_sexygrind_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance20' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_li_17_ethereal_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance21' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_mi_09_pointdj_r_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance22' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_mi_11_pointthrust_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance23' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_mi_11_simplepoint_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance24' then
				local ad = "anim@amb@nightclub@lazlow@hi_podium@" --- insert the animation dic here
				local anim = "danceidle_mi_17_teapotthrust_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance25' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" --- insert the animation dic here
				local anim = "high_center" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance26' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" --- insert the animation dic here
				local anim = "high_center_down" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance27' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" --- insert the animation dic here
				local anim = "high_left_up" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance28' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" --- insert the animation dic here
				local anim = "low_center_down" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance29' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" --- insert the animation dic here
				local anim = "med_center" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance30' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" --- insert the animation dic here
				local anim = "high_center" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance31' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" --- insert the animation dic here
				local anim = "med_center" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance32' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" --- insert the animation dic here
				local anim = "high_center" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance33' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" --- insert the animation dic here
				local anim = "low_center" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance34' then
				local ad = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" --- insert the animation dic here
				local anim = "med_center" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance35' then
				local ad = "anim@amb@nightclub@lazlow@hi_dancefloor@" --- insert the animation dic here
				local anim = "crowddance_hi_15_shimmyya_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance36' then
				local ad = "anim@amb@nightclub@lazlow@hi_dancefloor@" --- insert the animation dic here
				local anim = "crowddance_hi_17_highhorse_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance37' then
				local ad = "anim@amb@nightclub@lazlow@hi_dancefloor@" --- insert the animation dic here
				local anim = "crowddance_mi_17_buckingbronco_laz" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'dance38' then
				local ad = "misscarsteal4leadinoutcar_4_ext"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "leadin_loop_devin", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "leadin_loop_devin", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
					end     
				end
				
			end
		end
	end
end, false)

----Use /testanimation command, you can use this to easily test new animations---

--[[RegisterCommand("testanimation",function(source, args)

	local ad = "amb@code_human_police_crowd_control@idle_b" --- insert the animation dic here
	local anim = "idle_d" --- insert the animation name here
	local player = PlayerPedId()
	

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		TriggerEvent('chatMessage', '^2 Testing Animation')
		if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
			TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
		end       
	end
end, false)
--]]
	
----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ functions -----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function(prop_name, secondaryprop_name)
	while true do
		Citizen.Wait(500)
		if IsPedRagdoll(PlayerPedId()) then 
			local playerPed = PlayerPedId()
			local prop_name = prop_name
			local secondaryprop_name = secondaryprop_name
			DetachEntity(prop, 1, 1)
			DeleteObject(prop)
			DetachEntity(secondaryprop, 1, 1)
			DeleteObject(secondaryprop)
		end
	end
end)	

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/ce', 'Plays a custom animation', { { name = 'animation', help = 'The animation name' } } )
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        TriggerEvent('chat:removeSuggestion', '/n')
    end
end)