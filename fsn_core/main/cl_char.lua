Char = {}

function Char.OpenMenu()
	SetNuiFocus(true,true)
	SendNUIMessage({type='charMenu', enable=true})
end