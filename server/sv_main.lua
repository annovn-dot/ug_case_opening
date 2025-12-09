local pendingSpins = {}

local function log(msg)
    if Config.Debug then
        print(('[CASE] %s'):format(msg))
    end
end

local function notify(src, msg, typ)
    TriggerClientEvent('ug_case_opening:notify', src, msg, typ or 'info')
end

-- ============= Discord Log Helpers =============

local function GetPlayerIdentity(src)
    local name = GetPlayerName(src) or ('Player ' .. tostring(src))
    local identifiers = GetPlayerIdentifiers(src) or {}
    local license, steam, discord, fivem, ip

    for _, id in ipairs(identifiers) do
        if id:sub(1, 8) == 'license:' then
            license = id
        elseif id:sub(1, 6) == 'steam:' then
            steam = id
        elseif id:sub(1, 8) == 'discord:' then
            discord = id
        elseif id:sub(1, 6) == 'fivem:' then
            fivem = id
        elseif id:sub(1, 3) == 'ip:' then
            ip = id
        end
    end

    local mainId = license or steam or discord or fivem or ip or identifiers[1] or 'unknown'
    return name, mainId, {
        license = license,
        steam   = steam,
        discord = discord,
        fivem   = fivem,
        ip      = ip
    }
end

local function SendCaseLog(title, description, color, fields, footer)
    local webhook = Config.CaseWebhook or Config.CaseOpeningWebhook or Config.DiscordWebhook
    if not webhook or webhook == '' then return end

    local embed = {
        title = title,
        description = description,
        color = color or 0x2f3136,
        footer = { text = footer or os.date('%Y-%m-%d %H:%M:%S') },
        fields = fields,
        timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ')
    }

    PerformHttpRequest(webhook, function() end, 'POST', json.encode({
        username = Config.CaseLogUsername or 'ug_case_opening',
        embeds = { embed }
    }), {
        ['Content-Type'] = 'application/json'
    })
end

-- ============= Logic =============

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

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Purchase Failed - Not Enough Funds',
            ('%s (%s) tried to buy case `%s` for $%d but only had $%d.'):format(
                name, identifier, caseKey, price, bal
            ),
            0xe74c3c,
            {
                { name = 'Case',    value = caseKey,               inline = true },
                { name = 'Price',   value = ('$%d'):format(price), inline = true },
                { name = 'Balance', value = ('$%d'):format(bal),   inline = true }
            }
        )
        return
    end

    if not UG.Money.Remove(src, Config.MoneyAccount, price) then
        notify(src, 'Payment failed.', 'error')

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Purchase Failed - Remove Money',
            ('%s (%s) tried to buy case `%s` for $%d but UG.Money.Remove failed.'):format(
                name, identifier, caseKey, price
            ),
            0xe74c3c,
            {
                { name = 'Case',  value = caseKey,               inline = true },
                { name = 'Price', value = ('$%d'):format(price), inline = true }
            }
        )
        return
    end

    if UG.Inventory.AddItem(src, itemName, 1) then
        notify(src, ('Purchased %s for $%d'):format(def.label or caseKey, price), 'success')
        log(('Player %d bought %s for $%d'):format(src, caseKey, price))

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Purchased',
            ('%s (%s) bought case `%s` for $%d.'):format(name, identifier, caseKey, price),
            0x2ecc71,
            {
                { name = 'Case',  value = caseKey,               inline = true },
                { name = 'Price', value = ('$%d'):format(price), inline = true }
            }
        )
    else
        notify(src, 'Could not add case to inventory.', 'error')

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Purchase Failed - AddItem',
            ('%s (%s) paid $%d for case `%s` but UG.Inventory.AddItem failed.'):format(
                name, identifier, price, caseKey
            ),
            0xe74c3c,
            {
                { name = 'Case',  value = caseKey,               inline = true },
                { name = 'Price', value = ('$%d'):format(price), inline = true }
            }
        )
    end
end)

RegisterNetEvent('ug_case_opening:requestSpin', function(caseItemName)
    local src = source
    local caseKey = caseItemName
    local def = Cases and Cases[caseKey]

    if not def then
        notify(src, ('Case "%s" not defined.'):format(caseItemName), 'error')

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Spin Failed - Undefined Case',
            ('%s (%s) tried to spin undefined case `%s`.'):format(name, identifier, caseItemName),
            0xe74c3c
        )
        return
    end

    if not UG.Inventory.RemoveItem(src, caseItemName, 1) then
        notify(src, 'You no longer have this case.', 'error')

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Spin Failed - No Case Item',
            ('%s (%s) tried to spin case `%s` but RemoveItem failed (no item?).'):format(
                name, identifier, caseItemName
            ),
            0xf1c40f
        )
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

    local name, identifier = GetPlayerIdentity(src)
    SendCaseLog(
        'Case Spin Started',
        ('%s (%s) started a spin for case `%s`.'):format(name, identifier, caseKey),
        0x3498db,
        {
            { name = 'Case',    value = caseKey, inline = true },
            { name = 'Spin ID', value = spinId,  inline = false },
            {
                name = 'Predetermined Reward',
                value = ('%s x%d (%s)'):format(
                    chosen.name or chosen.item or 'unknown',
                    chosen.amount or 1,
                    chosen.item or 'unknown'
                ),
                inline = false
            }
        }
    )
end)

RegisterNetEvent('ug_case_opening:confirmReward', function(spinId)
    local src = source
    local p = pendingSpins[spinId]

    if not p then
        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Reward Confirm Failed - Unknown Spin',
            ('%s (%s) tried to confirm reward for unknown spinId `%s`.'):format(
                name, identifier, tostring(spinId)
            ),
            0xe74c3c
        )
        return
    end

    if p.src ~= src then
        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Reward Confirm Failed - Source Mismatch',
            ('%s (%s) tried to confirm reward for spinId `%s` that belongs to another player.'):format(
                name, identifier, tostring(spinId)
            ),
            0xe74c3c,
            {
                { name = 'Spin Owner',     value = tostring(p.src), inline = true },
                { name = 'Attempting Src', value = tostring(src),   inline = true }
            }
        )
        return
    end

    local it = p.resultItem
    pendingSpins[spinId] = nil

    if UG.Inventory.AddItem(src, it.item, it.amount or 1) then
        notify(src, ('Received: %s x%d'):format(it.name, it.amount or 1), 'success')
        log(('Player %d received %s x%d'):format(src, it.item, it.amount or 1))

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Reward Granted',
            ('%s (%s) received `%s` x%d from spin.'):format(
                name, identifier, it.item, it.amount or 1
            ),
            0x2ecc71,
            {
                { name = 'Case',    value = p.caseKey or 'unknown',   inline = true },
                { name = 'Item',    value = it.item or 'unknown',     inline = true },
                { name = 'Amount',  value = tostring(it.amount or 1), inline = true },
                { name = 'Spin ID', value = tostring(spinId),         inline = false }
            }
        )
    else
        notify(src, 'Inventory full or failed to add item.', 'error')

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Reward Failed - AddItem',
            ('%s (%s) should have received `%s` x%d from spin but AddItem failed.'):format(
                name, identifier, it.item or 'unknown', it.amount or 1
            ),
            0xe74c3c,
            {
                { name = 'Case',    value = p.caseKey or 'unknown',   inline = true },
                { name = 'Item',    value = it.item or 'unknown',     inline = true },
                { name = 'Amount',  value = tostring(it.amount or 1), inline = true },
                { name = 'Spin ID', value = tostring(spinId),         inline = false }
            }
        )
    end
end)

RegisterNetEvent('ug_case_opening:confirmPurchase', function(caseKey, itemName, price)
    local src = source
    local def = Cases and Cases[caseKey]
    if not def or not def.price or def.price <= 0 then return end

    local finalPrice = tonumber(price) or def.price
    local targetItem = itemName or caseKey

    local bal = UG.Money.Get(src, Config.MoneyAccount)
    if bal < finalPrice then
        notify(src, ('Not enough funds. Need $%d'):format(finalPrice), 'error')

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Confirm Purchase Failed - Not Enough Funds',
            ('%s (%s) tried to confirm-purchase `%s` for $%d but only had $%d.'):format(
                name, identifier, targetItem, finalPrice, bal
            ),
            0xe74c3c,
            {
                { name = 'Case',    value = caseKey,                    inline = true },
                { name = 'Item',    value = targetItem,                 inline = true },
                { name = 'Price',   value = ('$%d'):format(finalPrice), inline = true },
                { name = 'Balance', value = ('$%d'):format(bal),        inline = true },
            }
        )
        return
    end

    if not UG.Money.Remove(src, Config.MoneyAccount, finalPrice) then
        notify(src, 'Payment failed.', 'error')

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Confirm Purchase Failed - Remove Money',
            ('%s (%s) tried to confirm-purchase `%s` for $%d but UG.Money.Remove failed.'):format(
                name, identifier, targetItem, finalPrice
            ),
            0xe74c3c,
            {
                { name = 'Case',  value = caseKey,                    inline = true },
                { name = 'Item',  value = targetItem,                 inline = true },
                { name = 'Price', value = ('$%d'):format(finalPrice), inline = true },
            }
        )
        return
    end

    if UG.Inventory.AddItem(src, targetItem, 1) then
        notify(src, ('Purchased %s for $%d'):format(def.label or caseKey, finalPrice), 'success')

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Confirm Purchase',
            ('%s (%s) confirm-purchased item `%s` (case `%s`) for $%d.'):format(
                name, identifier, targetItem, caseKey, finalPrice
            ),
            0x2ecc71,
            {
                { name = 'Case',  value = caseKey,                    inline = true },
                { name = 'Item',  value = targetItem,                 inline = true },
                { name = 'Price', value = ('$%d'):format(finalPrice), inline = true },
            }
        )
    else
        notify(src, 'Could not add case to inventory.', 'error')

        local name, identifier = GetPlayerIdentity(src)
        SendCaseLog(
            'Case Confirm Purchase Failed - AddItem',
            ('%s (%s) paid $%d for `%s` (case `%s`) but UG.Inventory.AddItem failed.'):format(
                name, identifier, finalPrice, targetItem, caseKey
            ),
            0xe74c3c,
            {
                { name = 'Case',  value = caseKey,                    inline = true },
                { name = 'Item',  value = targetItem,                 inline = true },
                { name = 'Price', value = ('$%d'):format(finalPrice), inline = true },
            }
        )
    end
end)
