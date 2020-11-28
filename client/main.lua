ESX = nil 
Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end 
end)

local weaponStealeableList = {453432689, 1593441988, 584646201, 2578377531, 324215364, 736523883, 4024951519, 3220176749, 2210333304, 2937143193, 2634544996, 2144741730, 487013001} -- https://www.se7ensins.com/forums/threads/weapon-and-explosion-hashes-list.1045035/ weapon's codes

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        for i=1, #weaponStealeableList do
            if GetCurrentPedWeapon(GetPlayerPed(-1), weaponStealeableList[i], false) then
               haveWeapon = true
            else
                haveWeapon = false
            end
        end

        if haveWeapon == true then
            TriggerServerEvent('inventory:checkweapon', GetPlayerServerId(PlayerId()))
        end
    end
end)

RegisterNetEvent("inventory:removegun")
AddEventHandler("inventory:removegun", function()
    playerPed = GetPlayerPed(-1)
    if playerPed then
        RemoveAllPedWeapons(playerPed, true)
    end
end)
