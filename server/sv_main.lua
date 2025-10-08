local pendingSpins = {}

local function log(msg)
    if Config.Debug then
        print(('[CASE] %s'):format(msg))
    end
end

local function notify(src, msg, typ)
    TriggerClientEvent('ug_case_opening:notify', src, msg, typ or 'info')
end

local function weightedChoice(items)
    local total = 0
    for _, it in ipairs(items) do total = total + (it.chance or 0) end
    if total <= 0 then return 1, items[1] end
    local r = math.random() * total
    local acc = 0
    for i, it in ipairs(items) do
        acc = acc + (it.chance or 0)
        if r <= acc then return i, it end
    end
    return #items, items[#items]
end

RegisterNetEvent('ug_case_opening:buyCase', function(caseKey)
    local src = source
    local def = Cases and Cases[caseKey]
    if not def or not def.price or def.price <= 0 then return end

    local price = def.price
    local itemName = caseKey

    local bal = UG.Money.Get(src, Config.MoneyAccount)
    if bal < price then
        notify(src, ('Not enough funds. Need $%d'):format(price), 'error')
        return
    end

    if not UG.Money.Remove(src, Config.MoneyAccount, price) then
        notify(src, 'Payment failed.', 'error')
        return
    end

    if UG.Inventory.AddItem(src, itemName, 1) then
        notify(src, ('Purchased %s for $%d'):format(def.label or caseKey, price), 'success')
        log(('Player %d bought %s for $%d'):format(src, caseKey, price))
    else
        notify(src, 'Could not add case to inventory.', 'error')
    end
end)

RegisterNetEvent('ug_case_opening:requestSpin', function(caseItemName)
    local src = source
    local caseKey = caseItemName
    local def = Cases and Cases[caseKey]

    if not def then
        notify(src, ('Case "%s" not defined.'):format(caseItemName), 'error')
        return
    end

    if not UG.Inventory.RemoveItem(src, caseItemName, 1) then
        notify(src, 'You no longer have this case.', 'error')
        return
    end

    math.randomseed(GetGameTimer() + src)
    local _, chosen = weightedChoice(def.items)

    local reel, visible = {}, 45
    for i = 1, visible - 1 do
        reel[i] = def.items[math.random(1, #def.items)]
    end
    reel[visible] = chosen

    local colors = {}
    for k, v in pairs(Config.RarityColors or {}) do colors[k] = v end
    if def.rarities then
        for r, hex in pairs(def.rarities) do colors[r] = hex end
    end

    local spinId = ('%d:%s:%d'):format(src, caseKey, GetGameTimer())
    pendingSpins[spinId] = { src = src, caseKey = caseKey, resultItem = chosen }

    TriggerClientEvent('ug_case_opening:startRoll', src, {
        spinId       = spinId,
        caseKey      = caseKey,
        caseLabel    = def.label or caseKey,
        image        = def.image,
        reel         = reel,
        colors       = colors,

        rollDuration = Config.RollDuration or 6.5,
        spinPhases   = Config.SpinPhases or { rampIn = 0.10, easeOut = 0.18 },
        spinEasing   = Config.SpinEasing or {
            rampIn = 'cubic-bezier(.55,.06,.68,.19)',
            cruise = 'linear',
            easeOut = 'cubic-bezier(.12,.88,.08,1)'
        },
        revealHold   = Config.RevealHold or 1.0,
    })
end)

RegisterNetEvent('ug_case_opening:confirmReward', function(spinId)
    local src = source
    local p = pendingSpins[spinId]
    if not p or p.src ~= src then return end

    local it = p.resultItem
    if UG.Inventory.AddItem(src, it.item, it.amount or 1) then
        notify(src, ('Received: %s x%d'):format(it.name, it.amount or 1), 'success')
        log(('Player %d received %s x%d'):format(src, it.item, it.amount or 1))
    else
        notify(src, 'Inventory full or failed to add item.', 'error')
    end
    pendingSpins[spinId] = nil
end)

RegisterNetEvent('ug_case_opening:confirmPurchase', function(caseKey, itemName, price)
    local src = source
    local def = Cases and Cases[caseKey]
    if not def or not def.price or def.price <= 0 then return end

    local finalPrice = tonumber(price) or def.price

    local bal = UG.Money.Get(src, Config.MoneyAccount)
    if bal < finalPrice then
        notify(src, ('Not enough funds. Need $%d'):format(finalPrice), 'error')
        return
    end

    if not UG.Money.Remove(src, Config.MoneyAccount, finalPrice) then
        notify(src, 'Payment failed.', 'error')
        return
    end

    if UG.Inventory.AddItem(src, itemName or caseKey, 1) then
        notify(src, ('Purchased %s for $%d'):format(def.label or caseKey, finalPrice), 'success')
    else
        notify(src, 'Could not add case to inventory.', 'error')
    end
end)
