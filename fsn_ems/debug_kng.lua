local realWait = Citizen.Wait

function newWait(msec)
    local info = debug.getinfo(2,"nSl")
    local msg = ("%s:%d (%s[%d-%d])"):format(
        info.source, info.currentline, info.name,
        info.linedefined, info.lastlinedefined
    )
    print("Yielding @ "..msg)
    realWait(msec)
    print("Resuming @ "..msg)
end

Citizen.Wait = newWait
Wait = newWait