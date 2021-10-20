-- export for getting description of current clothing!
local ped = PlayerPedId()
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
		GetPedDrawableVariation(PlayerPedId(), 11),
		GetPedTextureVariation(PlayerPedId(), 11),
	}

	if sex then
		if sex == 'm' then
			--print(comp[1]..comp[2])
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
		GetPedDrawableVariation(PlayerPedId(), 3),
		GetPedTextureVariation(PlayerPedId(), 3),
	}

	if sex then
		if sex == 'm' then
			--print(comp[1]..comp[2])
			top = tostring(MALE.undershirts[tostring(comp[1])][tostring(comp[2])].Localized)
		elseif sex == 'f' then
			top = tostring(FEMALE.undershirts[tostring(comp[1])][tostring(comp[2])].Localized)
		end
	end

	if not top then top = "I can't remember" end
	return top
end

function getPants()
	local sex = getSex()
	local pants = false
	local comp = {
		GetPedDrawableVariation(PlayerPedId(), 3),
		GetPedTextureVariation(PlayerPedId(), 3),
	}

	if sex then
		if sex == 'm' then
			--print(comp[1]..comp[2])
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
		Citizen.Wait(1)
	end
	ready = true
end)

RegisterCommand('evi_clothing', function()
	local sex = "Sex: "..getSex()
	local jacket = "Jacket: "..getJacket()
	local top = "Top: "..getTop()
	local pants = "Pants: "..getPants()

	print(sex)
	print(jacket)
	print(top)
	print(pants)
end)