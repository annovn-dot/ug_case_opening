local uiOpen = false

RegisterNetEvent('ug_case_opening', function(a, b)
    if uiOpen then return end

    local itemName

    local function findName(tbl)
        if type(tbl) ~= 'table' then return nil end
        return tbl.name
            or tbl.item
            or (tbl.data and (tbl.data.name or tbl.data.item))
    end

    if type(a) == 'string' then
        itemName = a
    elseif type(a) == 'table' then
        itemName = findName(a)
    end

    if not itemName and type(b) == 'table' then
        itemName = findName(b)
    end

    if not itemName then
        return
    end

    TriggerServerEvent('ug_case_opening:requestSpin', itemName)
end)

RegisterNetEvent('ug_case_opening:startRoll', function(payload)
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'open', payload = payload })
    uiOpen = true
end)

RegisterNUICallback('ug_case_opening:close', function(_, cb)
    SetNuiFocus(false, false)
    uiOpen = false
    cb(true)
end)

RegisterNUICallback('ug_case_opening:confirm', function(data, cb)
    if data and data.spinId then
        TriggerServerEvent('ug_case_opening:confirmReward', data.spinId)
    end
    cb(true)
end)

RegisterNetEvent('ug_case_opening:notify', function(msg, typ)
    if not msg then return end

    local nType = typ or 'info'
    if not lib or not lib.notify then
        print(('[ug_case_opening] %s: %s'):format(nType, msg))
        return
    end

    lib.notify({
        title       = 'Case Opening',
        description = msg,
        type        = nType,
        position    = 'top-right',
        duration    = 5000
    })
end)

if Config.Debug then
    RegisterCommand('case_test', function(_, args)
        local fakeItemName = args[1] or 'engine_case'
        TriggerEvent('ug_case_opening', fakeItemName)
    end)
end
