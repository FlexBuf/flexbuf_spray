local QBCore = exports['qb-core']:GetCoreObject()
local isPainting = false

CreateThread(function()
    while true do
        local sleep = 1500
        if isPainting then
            sleep = 0
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('flexbuf_spray:startSpray')
AddEventHandler('flexbuf_spray:startSpray', function(item, color1, color2, sprayColor)
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped) then
        local vehicle = GetClosestVehicleToPlayer()
        if vehicle ~= 0 then
            local driverId = GetDriverOfVehicle(vehicle)
            if driverId == -1 then
                QBCore.Functions.TriggerCallback('flexbuf_spray:checkItem', function(cb)
                    if cb == true then
                        local animDict = loadDict('anim@mp_player_intupperwave')
                        local anim = 'idle_a'
                        local model = loadModel(`prop_cs_spray_can`)
                        local ptfxDict = loadPtfxDict('scr_paintnspray')
                        local ptfx = 'scr_respray_smoke'
                        local pos = GetEntityCoords(ped)
                        isPainting = true
                        ClearPedTasks(ped)
                        local obj = CreateObject(model, pos.x, pos.y, pos.z, true, true, true)
                        AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped,18905), 0.07, 0.0, 0.03, 0.0, 90.0, 300.0, true, true, false, true, 1, true)
                        TaskTurnPedToFaceEntity(ped, vehicle, 1000)
                        Wait(1000)
                        TaskPlayAnim(ped, animDict , anim, 8.0, -8.0, -1,49, 0, true, true, true)
                        SetPtfxAssetNextCall(ptfxDict)
                        local sprayPart = StartNetworkedParticleFxLoopedOnEntity(ptfx, obj, 0.0,0.0,-0.5, 0.0,0.0,0.0, 0.5, 1.0,1.0,1.0)   
                        SetParticleFxLoopedColour(sprayPart, sprayColor.r, sprayColor.g, sprayColor.b, 0)
                        Wait(Config.SprayTime*1000)
                        RemoveParticleFx(sprayPart)
                        ClearPedTasks(ped)
                        DeleteObject(obj)
                        isPainting = false
                        SetVehicleColours(vehicle, color1, color2)
                        RemoveAnimDict('anim@mp_player_intupperwave')
                        SetModelAsNoLongerNeeded('prop_cs_spray_can')
                    end
                end, item)
            else
                QBCore.Functions.Notify("Can not paint while someone is in driver seat", "error")
            end
        else
            QBCore.Functions.Notify("No nearby vehicle that you can paint", "error")
        end
    else
        QBCore.Functions.Notify("You can't do this right now", "error")
    end
end)