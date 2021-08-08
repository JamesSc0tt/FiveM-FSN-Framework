-- TODO: Use https://runtime.fivem.net/doc/natives/#_0x32CA01C3 instead
function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', ':FSN Framework: https://fsn.rocks/ ')
end)
