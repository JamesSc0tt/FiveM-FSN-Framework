--[[
	struct Color
		{r: number, g: number, b: number, a: number}
]]
Color = {}
Color.White = {255,255,255,255}

--[[
	Draw.DrawText(text: string, font: number, center: bool,
	              x: number, y: number, scale: number, col: Color)
]]
Draw = {}
function Draw.Text(text, font, center, x,y, scale, col)
	SetTextFont(font)
	SetTextScale(scale, scale)
	SetTextColour(col[1],col[2],col[3],col[4])
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow() -- Probably don't need both of these
	SetTextOutline()
	SetTextCentre(center)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end