--
--Variables
--
ESX = nil
local PlayerData = {}
local job1 = false
local job2 = false
local jobActive = true

--
--Blip
--

local blips = {
     {title="Pizzeria", colour=25, id=267, x = -1194.46, y = -1547.46, z = 4.37}
  }
  Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


--
--Citizens
--
casas = {}
for i = 1, 11 do
    casas[i] = false
end

Citizen.CreateThread(function()
    while ESX == nil do
     TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
        while true do 
            Citizen.Wait(100)
        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(100)
        end
        PlayerData = ESX.GetPlayerData()
    end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        local distance = GetDistanceBetweenCoords(vector3(-1194.46, -1547.46, 4.37), coords, true)
    
        if PlayerData.job ~= nil and PlayerData.job.name == "pizzero" then
            if jobActive == true then
            DrawMarker(1, vector3(-1194.46, -1547.46, 3.37), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(vector3(-1194.46, -1547.46, 4.37), GetEntityCoords(PlayerPedId(), true)) < 1 then
                drawTxt("Presiona E para empezar a trabajar", 2, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
                if IsControlJustPressed(1, 38) then
                    jobActive = false
                    ESX.Game.SpawnVehicle("faggio", vector3(-1194.46, -1547.46, 4.37), 120, function(vehicle)
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                       

                        rand = math.random(1,9)

                        while casas[rand] == false do
                            casas[rand] = true
                            
                            print(casas[rand])
                            print(rand)
                        end

                    end)
                    ESX.ShowNotification("Ve al sitio indicado en el gps")

                      
                end
            end
        end
    end
        if casas[1] == true then
            SetNewWaypoint(-1001.93, -1228.99, 5.57)
            DrawMarker(1, vector3(-1001.93, -1228.99, 4.57), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0) 
            if GetDistanceBetweenCoords(vector3(-1001.93, -1228.99, 5.57),GetEntityCoords(PlayerPedId(), true)) < 1 then
                drawTxt("Presiona E para cargar la moto", 2, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)

                if IsControlJustPressed(1, 38) then
                    casas[1] = false
                    job2 = true
                    ESX.ShowNotification("¡Pizza entregada! Ahora vuelve a la pizzeria")
                    local vehicleplayer = GetVehiclePedIsIn(PlayerPedId())
                    FreezeEntityPosition(vehicleplayer, true)
                    Wait(3000)
                    FreezeEntityPosition(vehicleplayer, false)
                    SetNewWaypoint(-1194.46, -1547.46, 4.37)
                end
            end
        end

        if casas[2] == true then
            SetNewWaypoint(-642.11, 32.29, 39.57)
            DrawMarker(1, vector3(-642.11, 32.29, 38.57), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0) 
            if GetDistanceBetweenCoords(vector3(-642.11, 32.29, 39.57),GetEntityCoords(PlayerPedId(), true)) < 1 then
                
                if IsControlJustPressed(1, 38) then
                    casas[2] = false
                    job2 = true
                    ESX.ShowNotification("Pizza entregada! Ahora vuelve a la pizzeria")
                    local vehicleplayer = GetVehiclePedIsIn(PlayerPedId())
                    FreezeEntityPosition(vehicleplayer, true)
                    Wait(3000)
                    FreezeEntityPosition(vehicleplayer, false)
                    SetNewWaypoint(-1194.46, -1547.46, 4.37)
                end
            end
        end

        if casas[3] == true then 
            SetNewWaypoint(-550.78, -825.72, 27.42)
            DrawMarker(1, vector3(-550.78, -825.72, 26.42), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0) 
            if GetDistanceBetweenCoords(vector3(-550.78, -825.72, 27.42),GetEntityCoords(PlayerPedId(), true)) < 1 then
               
                if IsControlJustPressed(1, 38) then
                    casas[3] = false
                    job2 = true
                    ESX.ShowNotification("Pizza entregada! Ahora vuelve a la pizzeria")
                    local vehicleplayer = GetVehiclePedIsIn(PlayerPedId())
                    FreezeEntityPosition(vehicleplayer, true)
                    Wait(3000)
                    FreezeEntityPosition(vehicleplayer, false)
                    SetNewWaypoint(-1194.46, -1547.46, 4.37)
                end
            end
        end

        if casas[4] == true then
            SetNewWaypoint(-1102.02, 286.39, 64.01)
            DrawMarker(1, vector3(-1102.02, 286.39, 63.01), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0) 
            if GetDistanceBetweenCoords(vector3(-1102.02, 286.39, 64.01),GetEntityCoords(PlayerPedId(), true)) < 1 then
                
                if IsControlJustPressed(1, 38) then
                    casas[4] = false
                    job2 = true
                    ESX.ShowNotification("Pizza entregada! Ahora vuelve a la pizzeria")
                    local vehicleplayer = GetVehiclePedIsIn(PlayerPedId())
                    FreezeEntityPosition(vehicleplayer, true)
                    Wait(3000)
                    FreezeEntityPosition(vehicleplayer, false)
                    SetNewWaypoint(-1194.46, -1547.46, 4.37)
                end
            end
        end

        if casas[5] == true then
            SetNewWaypoint(-1581.24, -267.14, 48.28)
            DrawMarker(1, vector3(-1581.24, -267.14, 47.28), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0) 
            if GetDistanceBetweenCoords(vector3(-1581.24, -267.14, 48.28),GetEntityCoords(PlayerPedId(), true)) < 1 then
               
                if IsControlJustPressed(1, 38) then
                    casas[5] = false
                    job2 = true
                    ESX.ShowNotification("Pizza entregada! Ahora vuelve a la pizzeria")
                    local vehicleplayer = GetVehiclePedIsIn(PlayerPedId())
                    FreezeEntityPosition(vehicleplayer, true)
                    Wait(3000)
                    FreezeEntityPosition(vehicleplayer, false)
                    SetNewWaypoint(-1194.46, -1547.46, 4.37)
                end
            end
        end

        if casas[6] == true then
            SetNewWaypoint(972.97, -572.55, 58.98)
            DrawMarker(1, vector3(972.97, -572.55, 57.98), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0) 
            if GetDistanceBetweenCoords(vector3(972.97, -572.55, 58.98),GetEntityCoords(PlayerPedId(), true)) < 1 then
                
                if IsControlJustPressed(1, 38) then
                    casas[6] = false
                    job2 = true
                    ESX.ShowNotification("Pizza entregada! Ahora vuelve a la pizzeria")
                    local vehicleplayer = GetVehiclePedIsIn(PlayerPedId())
                    FreezeEntityPosition(vehicleplayer, true)
                    Wait(3000)
                    FreezeEntityPosition(vehicleplayer, false)
                    SetNewWaypoint(-1194.46, -1547.46, 4.37)
                end
            end
        end

        if casas[7] == true then
            SetNewWaypoint(1009.15, -524.8, 60.48)
            DrawMarker(1, vector3(1009.15, -524.8, 59.48), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0) 
            if GetDistanceBetweenCoords(vector3(1009.15, -524.8, 60.48),GetEntityCoords(PlayerPedId(), true)) < 1 then
               
                if IsControlJustPressed(1, 38) then
                    casas[7] = false
                    job2 = true
                    ESX.ShowNotification("Pizza entregada! Ahora vuelve a la pizzeria")
                    local vehicleplayer = GetVehiclePedIsIn(PlayerPedId())
                    FreezeEntityPosition(vehicleplayer, true)
                    Wait(3000)
                    FreezeEntityPosition(vehicleplayer, false)
                    SetNewWaypoint(-1194.46, -1547.46, 4.37)
                end
            end
        end
    
        if casas[8] == true then
            SetNewWaypoint(-307.31, 386.0, 110.11)
            DrawMarker(1, vector3(-307.31, 386.0, 109.11), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0) 
            if GetDistanceBetweenCoords(vector3(-307.31, 386.0, 110.11),GetEntityCoords(PlayerPedId(), true)) < 1 then
                
                if IsControlJustPressed(1, 38) then
                    casas[8] = false
                    job2 = true
                    ESX.ShowNotification("Pizza entregada! Ahora vuelve a la pizzeria")
                    local vehicleplayer = GetVehiclePedIsIn(PlayerPedId())
                    FreezeEntityPosition(vehicleplayer, true)
                    Wait(3000)
                    FreezeEntityPosition(vehicleplayer, false)
                    SetNewWaypoint(-1194.46, -1547.46, 4.37)
                end
            end
        end

        if casas[9] == true then
            SetNewWaypoint(-380.43, 352.88, 109.03)
            DrawMarker(1, vector3(-380.43, 352.88, 108.03), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0) 
            if GetDistanceBetweenCoords(vector3-380.43, 352.88, 109.03),GetEntityCoords(PlayerPedId(), true)) < 1 then
                
                if IsControlJustPressed(1, 38) then
                    casas[9] = false
                    job2 = true
                    ESX.ShowNotification("Pizza entregada! Ahora vuelve a la pizzeria")
                    local vehicleplayer = GetVehiclePedIsIn(PlayerPedId())
                    FreezeEntityPosition(vehicleplayer, true)
                    Wait(3000)
                    FreezeEntityPosition(vehicleplayer, false)
                    SetNewWaypoint(-1194.46, -1547.46, 4.37)
                end
            end
        end

        
        




        if job2 == true then
            DrawMarker(1, vector3(-1192, -1550.46, 3.37), 0, 0, 0, 0, 0, 0, 1.0000, 1.0000, 0.6001,0,255,123, 200, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(vector3(-1192, -1550.46, 4.37),GetEntityCoords(PlayerPedId(), true)) < 1 then
                drawTxt("Presiona E para terminar", 2, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
                if IsControlJustPressed(1, 38) then
                    ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                    ESX.ShowNotification("Has completado el trabajo, aqui tienes tu dinero")
                    TriggerServerEvent("pizzero:addThings")
                    job2 = false
                    jobActive = true


                end
            end
        end
    end
end)


--
--Funciones
--

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

--
--Net Events
--
RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
    PlayerData = xPlayer
end)


RegisterNetEvent("esx:SetJob")
AddEventHandler("esx:setJob", function(job)
    PlayerData.job = job
end)


