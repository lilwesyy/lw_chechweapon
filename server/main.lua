ESX = nil 
        
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('inventory:checkweapon')
AddEventHandler('inventory:checkweapon', function(source)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
            
    if xPlayer.getInventoryItem('WEAPON_PISTOL').count >= 1 then
        
    else
        TriggerClientEvent('inventory:removegun', _source)
    end
end)