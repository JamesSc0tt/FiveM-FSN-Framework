function buildTrevor()
	SetEntityCoords(PlayerPedId(),-1153.18300000 ,-1518.34800000, 9.63082300)
	--Wait(1200)
	
	local items = {'V_61_shell_walls', 'V_61_bd1_mesh_delta', 'V_61_bd1_over_normal', 'V_Res_Tre_lightFan'}
	for k,v in pairs(items) do
		RequestModel(GetHashKey(v))
        while not HasModelLoaded(GetHashKey(v)) do
			print('loading '..v)
            Citizen.Wait(1)
        end
		print('loaded: '..v)
	end
	
	local generator = { x = curHouseCoords["x"] , y = curHouseCoords["y"], z = curHouseCoords["z"] - 35.0}
	SetEntityCoords(PlayerPedId(), generator.x, generator.y-4,generator.z+3.0)
	FreezeEntityPosition(PlayerPedId(), true)
	local building = CreateObject(GetHashKey("V_61_shell_walls"),generator.x+0.42222900,generator.y-0.13131700,generator.z+1.18855100,false,false,false)
	FreezeEntityPosition(building,true)

CreateObject(GetHashKey("V_61_bd1_mesh_delta"),generator.x+6.58658700,generator.y+1.90211400,generator.z+1.40669800,false,false,false)
CreateObject(GetHashKey("V_61_bd1_over_normal"),generator.x+6.90869900,generator.y+1.90231200,generator.z+1.41739500,false,false,false)

CreateObject(GetHashKey("V_Res_Tre_lightFan"),generator.x+6.92140500,generator.y+1.75621500,generator.z+3.91411600,false,false,false)

CreateObject(GetHashKey("V_61_bd2_mesh_delta"),generator.x+7.45918600,generator.y-2.23859200,generator.z+1.40669800,false,false,false)
CreateObject(GetHashKey("V_61_bed2_over_normal"),generator.x+7.39488900,generator.y-2.23812300,generator.z+1.41739900,false,false,false)
CreateObject(GetHashKey("V_Res_Tre_lightFan"),generator.x+7.43066600,generator.y-2.13224100,generator.z+3.91411600,false,false,false)



CreateObject(GetHashKey("V_61_bd1_mesh_curtains"),generator.x+9.47294700,generator.y+2.01390900,generator.z+1.40529700,false,false,false)
CreateObject(GetHashKey("V_61_bd2_mesh_curtains"),generator.x+7.45918600,generator.y-2.23859100,generator.z+1.40669800,false,false,false)

CreateObject(GetHashKey("V_61_bth_mesh_delta"),generator.x+2.90302400,generator.y-3.25595700,generator.z+1.40669900,false,false,false)
CreateObject(GetHashKey("V_61_bth_mesh_window"),generator.x+2.54372400,generator.y-4.20030900,generator.z+2.59330000,false,false,false)
CreateObject(GetHashKey("V_61_bth_mesh_sink"),generator.x+3.63269400,generator.y-3.89074800,generator.z+1.44331700,false,false,false)
CreateObject(GetHashKey("V_61_bth_mesh_bath"),generator.x+4.62711300,generator.y-3.17999400,generator.z+1.40002500,false,false,false)
CreateObject(GetHashKey("V_61_bth_mesh_mirror"),generator.x+3.63412700,generator.y-4.18290000,generator.z+1.69656600,false,false,false)

CreateObject(GetHashKey("v_serv_bs_cond"),generator.x+4.96474600,generator.y-4.15317100,generator.z+1.27547500,false,false,false)
CreateObject(GetHashKey("v_ret_ps_toiletry_02"),generator.x+5.04444800,generator.y-4.10563800,generator.z+1.18004900,false,false,false)
CreateObject(GetHashKey("v_ret_ps_toiletry_01"),generator.x+5.05485300,generator.y-2.21447100,generator.z+0.63780390,false,false,false)

CreateObject(GetHashKey("V_Res_Tre_lightFan"),generator.x-1.78290200,generator.y+1.75875700,generator.z+3.91411600,false,false,false)
CreateObject(GetHashKey("V_Res_Tre_lightFan"),generator.x-6.62357700,generator.y+1.83180300,generator.z+3.91411600,false,false,false)
CreateObject(GetHashKey("V_Res_Tre_lightFan"),generator.x-6.62351200,generator.y-1.99185700,generator.z+3.91411600,false,false,false)
CreateObject(GetHashKey("V_61_lng_over_normal"),generator.x-4.57882400,generator.y-0.13147000,generator.z+1.55739500,false,false,false)
CreateObject(GetHashKey("V_61_lng_over_decal"),generator.x-4.53859100,generator.y-0.13131600,generator.z+1.40719200,false,false,false)
CreateObject(GetHashKey("V_61_lng_mesh_delta"),generator.x-4.52318900,generator.y-0.12544300,generator.z+1.40691200,false,false,false)


CreateObject(GetHashKey("V_61_lng_mesh_curtains"),generator.x-8.64869900,generator.y-0.14242800,generator.z+1.39529700,false,false,false)


CreateObject(GetHashKey("V_61_lng_mesh_windows2"),generator.x-1.81416800,generator.y+3.99466500,generator.z+1.91970800,false,false,false)
CreateObject(GetHashKey("V_61_hlw_mesh_delta"),generator.x+2.25451900,generator.y-0.11426500,generator.z+1.40669900,false,false,false)

CreateObject(GetHashKey("V_61_hlw_over_normals"),generator.x+2.29985700,generator.y-1.19603700,generator.z+1.41739400,false,false,false)
CreateObject(GetHashKey("V_Res_Tre_lightFan"),generator.x+2.31997200,generator.y-0.08653700,generator.z+3.91411600,false,false,false)

CreateObject(GetHashKey("V_61_fnt_mesh_delta"),generator.x+0.60459100,generator.y-3.17859000,generator.z+1.40669800,false,false,false)
CreateObject(GetHashKey("V_61_fnt_over_normal"),generator.x+0.60557090,generator.y-3.17862900,generator.z+1.41739300,false,false,false)
CreateObject(GetHashKey("V_61_fdr_over_decal"),generator.x+2.27650100,generator.y-1.13863200,generator.z+1.40569900,false,false,false)


CreateObject(GetHashKey("V_61_ktm_mesh_delta"),generator.x-2.52016200,generator.y-2.09838000,generator.z+1.40605500,false,false,false)

CreateObject(GetHashKey("V_61_ktn_mesh_windows"),generator.x-2.28900200,generator.y-4.23605800,generator.z+2.6737700,false,false,false)
CreateObject(GetHashKey("V_61_ktn_mesh_delta"),generator.x-2.51330800,generator.y-2.07973900,generator.z+1.40688100,false,false,false)
CreateObject(GetHashKey("V_61_ktn_over_normal"),generator.x-4.57882400,generator.y-0.13147000,generator.z+1.52539500,false,false,false)
CreateObject(GetHashKey("V_61_ktn_mesh_lights"),generator.x-2.62422800,generator.y-2.19258700,generator.z+4.10724400,false,false,false)

CreateObject(GetHashKey("V_61_shell_doorFrames"),generator.x+5.16617300,generator.y-1.16292300,generator.z+1.40882800,false,false,false)
CreateObject(GetHashKey("V_61_shell_FdFrame"),generator.x+0.61957400,generator.y-4.27097800,generator.z+1.39039500,false,false,false)

CreateObject(GetHashKey("V_61_Bath_over_dec"),generator.x+2.66080000,generator.y-3.60888800,generator.z+0.01784800,false,false,false)
SetEntityHeading(PlayerPedId(),267.0)
SetGameplayCamRelativeHeading(0.0)

end