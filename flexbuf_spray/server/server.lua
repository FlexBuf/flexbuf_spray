local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for i=1, #Config.Paint do
        QBCore.Functions.CreateUseableItem(Config.Paint[i].item, function(source)
            TriggerClientEvent('flexbuf_spray:startSpray', source, Config.Paint[i].item, Config.Paint[i].primary_color, Config.Paint[i].secondary_color, Config.Paint[i].particleColor)
        end)
    end
end)

QBCore.Functions.CreateCallback('flexbuf_spray:checkItem', function(source, cb, itemname)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = xPlayer.Functions.GetItemByName(itemname)
    if item ~= nill then
        xPlayer.Functions.RemoveItem(itemname, 1)
        cb(true)
    else
        TriggerClientEvent('QBCore:Notify', source, "Nice try", 'error')
        cb(false)
    end
end)