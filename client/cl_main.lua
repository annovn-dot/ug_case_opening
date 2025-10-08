local uiOpen = false

local function buildShopPayload(shop)
    local entries = {}
    if not shop or type(shop.cases) ~= "table" then
        return { entries = entries }
    end

    for _, caseKey in ipairs(shop.cases) do
        local def = Cases[caseKey]
        if def and def.items and def.price and def.price > 0 then
            entries[#entries + 1] = {
                key   = caseKey,
                label = def.label or caseKey,
                price = def.price,
                icon  = (Config.IconPath or ''):format(def.image or caseKey)
            }
        else
            print(('[ug_case_opening] WARNING: case "%s" missing definition or price'):format(caseKey))
        end
    end

    return { entries = entries }
end

CreateThread(function()
    for _, shop in ipairs(Config.Shops or {}) do
        exports.ox_target:addBoxZone({
            coords   = shop.coords,
            size     = shop.size or vec3(1.2, 1.2, 1.5),
            rotation = shop.rotation or 0.0,
            debug    = false,
            options  = {
                {
                    name     = ('ug_case_shop:%s'):format(shop.id),
                    label    = shop.label or 'Buy Cases',
                    icon     = shop.icon or 'fa-solid fa-box-open',
                    distance = 2.0,
                    onSelect = function()
                        local payload = buildShopPayload(shop)
                        SendNUIMessage({ action = 'shop_open', payload = payload })
                        SetNuiFocus(true, true)
                        uiOpen = true
                    end
                }
            }
        })
    end
end)

RegisterNUICallback('ug_case_opening:shop_buy', function(data, cb)
    if data and data.caseKey then
        SetNuiFocus(false, false)
        uiOpen = false
        SendNUIMessage({ action = 'shop_close' })

        local success = lib.progressBar({
            duration = 4000,
            label = ('Purchasing %s...'):format(Cases[data.caseKey].label or data.caseKey),
            useWhileDead = false,
            canCancel = true,
            disable = { move = true, car = true, combat = true },
        })

        if success then
            TriggerServerEvent('ug_case_opening:buyCase', data.caseKey)
        else
            lib.notify({
                title = 'Cancelled',
                description = 'Purchase cancelled.',
                type = 'error'
            })
        end
    end
    cb(true)
end)

RegisterNUICallback('ug_case_opening:close', function(_, cb)
    SetNuiFocus(false, false)
    uiOpen = false
    cb(true)
end)
