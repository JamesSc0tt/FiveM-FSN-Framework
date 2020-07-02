-- export for getting description of current clothing!
local ped = GetPlayerPed(-1)
local ready = false

function getSex()
	local sex = false
	if GetEntityModel(ped) == GetHashKey('mp_m_freemode_01') then
		sex = 'm'
	elseif GetEntityModel(ped) == GetHashKey('mp_f_freemode_01') then
		sex = 'f'
	end
	return sex
end

function getJacket()
	local sex = getSex()
	local jacket = false
	local comp = {
		GetPedDrawableVariation(GetPlayerPed(-1), 11),
		GetPedTextureVariation(GetPlayerPed(-1), 11),
	}

	if sex then
		if sex == 'm' then
			print(comp[1]..comp[2])
			jacket = tostring(MALE.tops[tostring(comp[1])][tostring(comp[2])].Localized)
		elseif sex == 'f' then
			jacket = tostring(FEMALE.tops[tostring(comp[1])][tostring(comp[2])].Localized)
		end
	end

	if not jacket then jacket = "I can't remember" end
	return jacket
end

function getTop()
	local sex = getSex()
	local top = false
	local comp = {
		GetPedDrawableVariation(GetPlayerPed(-1), 3),
		GetPedTextureVariation(GetPlayerPed(-1), 3),
	}

	if sex then
		if sex == 'm' then
			print(comp[1]..comp[2])
			top = tostring(MALE.undershirt[tostring(comp[1])][tostring(comp[2])].Localized)
		elseif sex == 'f' then
			top = tostring(FEMALE.undershirt[tostring(comp[1])][tostring(comp[2])].Localized)
		end
	end

	if not top then top = "I can't remember" end
	return top
end

function getPants()
	local sex = getSex()
	local pants = false
	local comp = {
		GetPedDrawableVariation(GetPlayerPed(-1), 3),
		GetPedTextureVariation(GetPlayerPed(-1), 3),
	}

	if sex then
		if sex == 'm' then
			print(comp[1]..comp[2])
			pants = tostring(MALE.pants[tostring(comp[1])][tostring(comp[2])].Localized)
		elseif sex == 'f' then
			pants = tostring(FEMALE.pants[tostring(comp[1])][tostring(comp[2])].Localized)
		end
	end

	if not pants then pants = "I can't remember" end
	return pants
end

Citizen.CreateThread(function()
	while not MALE.tops do
		--print'notready'
		Citizen.Wait(1)
	end
	ready = true
	--for k,v in pairs(MALE.tops) do
		--print(k..' => '..tostring(v))
		--[[
		for key, value in pairs(v) do
			print("> "..key.." => "..tostring(value))
			for kee, val in pairs(value) do
				print(">> "..kee.." > "..tostring(value))
				for kk, vv in pairs(value) do
					print(">>> "..kk.." > "..tostring(vv))
				end
			end
		end
		]]
	--end
	print("Jacket: ".. getJacket())
end)