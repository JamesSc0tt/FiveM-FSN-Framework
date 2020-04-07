RegisterServerEvent('fsn_licenses:id:request')
AddEventHandler('fsn_licenses:id:request', function(tbl)
	local occu = 'Unemployed'
	if tbl.char_police > 0 then
		occu = 'Police'
	end
	if tbl.char_ems > 0 then
		occu = 'EMS'
	end
	TriggerClientEvent('fsn_inventory:items:add', source, {
		index="id",
		name='ID Card ('..tbl.char_fname..' '..tbl.char_lname..')',
		amt=1,
		customData = {
			Name = tbl.char_fname..' '..tbl.char_lname,
			Occupation = occu,
			DOB = tbl.char_dob,
			Issue = os.date("%x"),
			CharID = tbl.char_id
		},
	})
end)