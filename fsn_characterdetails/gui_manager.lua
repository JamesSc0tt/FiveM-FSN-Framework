function ToggleActionMenu()
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then
		SetNuiFocus( true, true )
		SendNUIMessage({
			showmenu = true,
		})
	else
		SetNuiFocus( false )
		SendNUIMessage({
			hidemenu = true
		})
	end
end

function fsn_SplitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterNUICallback( "ButtonClick", function( data, cb )
	if ( data == "exit" ) then
		ToggleActionMenu()
		ExitTattooStore()
		return
	else
		local split = fsn_SplitString(data, '-')
		if split[1] == 'tattoos' then
			if split[2] == 'cat' then
				if split[3] == 'next' then
					NextCategory()
				end
				if split[3] == 'back' then
					BackCategory()
				end
			end
			if split[2] == 'tat' then
				if split[3] == 'back' then
					PreviousTattoo()
				end
				if split[3] == 'buy' then
					PurchaseTattoo()
					ToggleActionMenu()
					ExitTattooStore()
				end
				if split[3] == 'next' then
					NextTattoo()
				end
			end 
		end
	end
end)
