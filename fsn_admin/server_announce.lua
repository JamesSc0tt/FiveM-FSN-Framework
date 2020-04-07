--[[ local restarts = {};
restarts[#restarts + 1] = {23, 00};
restarts[#restarts + 1] = {05, 00};
restarts[#restarts + 1] = {11, 00};
restarts[#restarts + 1] = {17, 00};

function announceRestart()
 local hour = os.date("%H");
 local minute = os.date("%M");
 local second = os.date("%S");
 local timeInMinutes = (hour * 60 + minute);

 for i=1, #restarts do
   local restartInMinutes = (restarts[i][1]*60 + restarts[i][2]);
   local timeUntil = (restartInMinutes - timeInMinutes);
   if (restartInMinutes > timeInMinutes and tonumber(second) == 00 and (timeUntil == 01 or timeUntil == 05 or timeUntil == 15 or timeUntil == 30)) then
     print(":fsn_admin: Server restart in " .. (timeUntil) .. " minutes");
     if (timeUntil == 01) then
       TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1:FSN:^0^r The server will be restarting in ^4'..timeUntil..'^0 minutes!')
     else
       TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^1:FSN:^0^r The server will be restarting in ^4'..timeUntil..'^0 minutes!')
     end
     break;
   end
 end
 SetTimeout(1000, announceRestart)
end
SetTimeout(1000, announceRestart) --]]
