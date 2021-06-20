local IPLs = {
	request = {
		"chop_props", "FIBlobby", "FIBlobbyfake", "FBI_colPLUG", "FBI_repair", "v_tunnel_hole", "TrevorsMP", "TrevorsTrailer", "TrevorsTrailerTidy", "farm", 
		"farmint", "farm_lod", "farm_props", "facelobby", "CS1_02_cf_onmission1", "CS1_02_cf_onmission2", "CS1_02_cf_onmission3", "CS1_02_cf_onmission4", 
		"v_rockclub", "bkr_bi_hw1_13_int", "ufo", "v_carshowroom", "shr_int", "shutter_closed", "smboat", "cargoship", "railing_start", "sp1_10_real_interior", 
		"sp1_10_real_interior_lod", "id2_14_during1", "coronertrash", "Coroner_Int_on", "refit_unload", "post_hiest_unload", "Carwash_with_spinners", "ferris_finale_Anim", 
		"ch1_02_open", "AP1_04_TriAf01", "CS2_06_TriAf02", "CS4_04_TriAf03", "scafendimap", "DT1_05_HC_REQ", "DT1_05_REQUEST", "FINBANK","ex_sm_13_office_01a", 
		"ex_sm_13_office_01b", "ex_sm_13_office_02a", "ex_sm_13_office_02b", "rc12b_hospitalinterior", "rc12b_hospitalinterior_lod", "rc12b_fixed", "CS3_05_water_grp1", 
		"CS3_05_water_grp2", "canyonriver01", "canyonrvrdeep", 'prologue01'
	},
	remove = {
		"farm_burnt", "farm_burnt_lod", "farm_burnt_props", "farmint_cap", "farmint_cap_lod", "hei_bi_hw1_13_door", "CS1_02_cf_offmission", "v_carshowroom", "shutter_open", 
		"shutter_closed", "shr_int", "csr_inMission", "sp1_10_fake_interior", "sp1_10_fake_interior_lod", "id2_14_during_door", "id2_14_during1", "id2_14_during2", 
		"id2_14_on_fire", "id2_14_post_no_int", "id2_14_pre_no_int", "id2_14_during_door", "Coroner_Int_off", "bh1_16_refurb", "jewel2fake", "bh1_16_doors_shut", "ch1_02_closed", 
		"scafstartimap", "DT1_05_HC_REMOVE", "DT1_03_Shutter", "DT1_03_Gr_Closed"
	}
}

AddEventHandler("onResourceStart", function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			LoadMpDlcMaps()
		 	EnableMpDlcMaps(true)
		 	for k,v in pairs(IPLs.request) do
		 		RequestIpl(v)
		 	end
		 	for k,v in pairs(IPLs.remove) do
		 		RemoveIpl(v)
		 	end
		end)
	end
end)