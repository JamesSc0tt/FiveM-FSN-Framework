curjob = 'Unemployed'

function fsn_GetJob()
  return curjob
end

function fsn_SetJob(job)
  curjob = job
end

RegisterNetEvent('fsn_jobs:quit')
AddEventHandler('fsn_jobs:quit', function()
  curjob = 'Unemployed'
end)

current_time = 0
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    current_time = current_time + 1
  end
end)

RegisterNetEvent('fsn_jobs:paycheck')
AddEventHandler('fsn_jobs:paycheck', function()
  
  if curjob == 'Police' then
    TriggerEvent('fsn_bank:change:bankAdd', 350)
    TriggerEvent('fsn_notify:displayNotification', 'Salary: $350', 'centerLeft', 5000, 'info')
  
  elseif curjob == 'EMS' then
    TriggerEvent('fsn_bank:change:bankAdd', 350)
    TriggerEvent('fsn_notify:displayNotification', 'Salary: $350', 'centerLeft', 5000, 'info')
  
  elseif curjob == 'Mechanic' then
    TriggerEvent('fsn_bank:change:bankAdd', 100)
    TriggerEvent('fsn_notify:displayNotification', 'Salary: $100', 'centerLeft', 5000, 'info')
  
  elseif curjob == 'CarDealer' then
    TriggerEvent('fsn_bank:change:bankAdd', 100)
    TriggerEvent('fsn_notify:displayNotification', 'Salary: $100', 'centerLeft', 5000, 'info')
  
  elseif curjob == 'BoatDealer' then
    TriggerEvent('fsn_bank:change:bankAdd', 100)
    TriggerEvent('fsn_notify:displayNotification', 'Salary: $100', 'centerLeft', 5000, 'info')

  elseif curjob == 'Rancher' then
    TriggerEvent('fsn_bank:change:bankAdd', 100)
    TriggerEvent('fsn_notify:displayNotification', 'Salary: $100', 'centerLeft', 5000, 'info')
  
  elseif curjob == 'Taxi Driver' then
    TriggerEvent('fsn_bank:change:bankAdd', 150)
    TriggerEvent('fsn_notify:displayNotification', 'Salary: $150', 'centerLeft', 5000, 'info')
  
  elseif curjob == 'Truck Driver' then
    TriggerEvent('fsn_bank:change:bankAdd', 100)
    TriggerEvent('fsn_notify:displayNotification', 'Salary: $100', 'centerLeft', 5000, 'info')
  
  elseif curjob == 'Unemployed' then
    TriggerEvent('fsn_bank:change:bankAdd', 50)
    TriggerEvent('fsn_notify:displayNotification', 'Salary: $50', 'centerLeft', 5000, 'info')
  end


end)

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end
