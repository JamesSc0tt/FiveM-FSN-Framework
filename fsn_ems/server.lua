 local onduty_ems = {}

 RegisterServerEvent('fsn_ems:update')
 RegisterServerEvent('fsn_ems:onDuty')
 AddEventHandler('fsn_ems:onDuty', function(emslevel)
   if emslevel > 2 then
     table.insert(onduty_ems, {ply_id = source, ply_lvl = emslevel})
     TriggerClientEvent('fsn_ems:update', -1, onduty_ems)
     TriggerEvent('fsn_ems:update', onduty_ems)
     print(':fsn_ems: '..source..' has clocked on duty at level '..emslevel)
   else
     print(':fsn_ems: '..source..' has clocked in as police, but is not high enough level to contribute.')
   end
 end)

 RegisterServerEvent('fsn_ems:offDuty')
 AddEventHandler('fsn_ems:offDuty', function()
   for k, v in pairs(onduty_ems) do
     if v.ply_id == source then
       table.remove(onduty_ems, k)
       print(':fsn_ems: '..source..' has clocked out.')
     end
   end
   TriggerClientEvent('fsn_ems:update', -1, onduty_ems)
   TriggerEvent('fsn_ems:update', onduty_ems)
 end)

 AddEventHandler('playerDropped', function()
   for k, v in pairs(onduty_ems) do
     if v.ply_id == source then
       table.remove(onduty_ems, k)
       print(':fsn_ems: '..source..' has clocked out and disconnected.')
     end
   end
   TriggerClientEvent('fsn_ems:update', -1, onduty_ems)
 end)

 RegisterServerEvent('fsn_ems:requestUpdate')
 AddEventHandler('fsn_ems:requestUpdate', function()
   TriggerClientEvent('fsn_ems:update', source, onduty_ems)
 end)
