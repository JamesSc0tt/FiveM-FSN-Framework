-- Server browser
if IsDuplicityVersion() then
	SetGameType(":FSN: Framework")
	SetMapName("Los Santos")
	return
end

-- Pause menu
AddTextEntry('FE_THDR_GTAO', 'FusionRP: https://fsn.life/')

-- Discord & Steam
SetRichPresence("Cool I promise!")