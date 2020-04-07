local isDisplayed = false
local displayStart = 0

local pulsing = '.'

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end
local UI = {
	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y
}
function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(9)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextJustification(0.0)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function fsn_ProgressBar(r,g,b,title,length)
	if not isDisplayed then
		isDisplayed = true
		displayStart = exports["fsn_main"]:fsn_GetTime()
		Citizen.CreateThread(function()
			while isDisplayed do
				Citizen.Wait(0)
				local maff = displayStart + length
				if maff <= exports["fsn_main"]:fsn_GetTime() then
					-- completed
					isDisplayed = false
					break
				else
					-- during
					drawRct(0.4, 0.828, 0.16938, 0.04, 81,81,81,140)
					
					drawRct(0.4025, 0.832, 0.16408, 0.0313, 255,255,255,50)
					
					local remaining = maff - exports["fsn_main"]:fsn_GetTime()
					local mainsize = 0.16408 / length
					local draw = mainsize * remaining
					--local mafff  = length / 100 * 0.16408
					--local draw = mafff * 0.16408
					--draw = draw / remaining
					--local draw = 0.16408 - remaining
					drawRct(0.4025, 0.832, draw, 0.0313, r,g,b,50)
					drawTxt(UI.x + 0.560, UI.y + 1.399, 0.15,1.135,0.3, string.upper(title)..pulsing, 255, 255, 255, 255)
					--drawTxt(UI.x + 0.560, UI.y + 1.399, 0.15,1.135,0.3, string.upper(title), 255, 255, 255, 255)
				end
			end
		end)
	else
		print 'you cannot display two progress bars'
	end
end

function removeBar()
	isDisplayed = false
end

--fsn_ProgressBar(255,0,0,'a',300)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		if isDisplayed then
			if pulsing == '.' then
				pulsing = '..'
			elseif pulsing == '..' then
				pulsing = '...'
			elseif pulsing == '...' then
				pulsing = '.'
			end
		end
	end
end)