UG = UG or {}
UG.Inventory = {}
UG.Money = {}

function UG.Inventory.AddItem(src, name, amount, metadata)
    amount = amount or 1
    metadata = metadata or {}
    return exports.ox_inventory:AddItem(src, name, amount, metadata)
end

function UG.Inventory.RemoveItem(src, name, amount)
    amount = amount or 1
    return exports.ox_inventory:RemoveItem(src, name, amount)
end

local fw = Config.Framework

if fw == 'esx' then
    local ESX = exports['es_extended']:getSharedObject()
    function UG.Money.Get(src, account)
        local xP = ESX.GetPlayerFromId(src)
        if not xP then return 0 end
        if account == 'money' then return xP.getMoney() end
        local acc = xP.getAccount(account)
        return acc and acc.money or 0
    end

    function UG.Money.Remove(src, account, amount)
        local xP = ESX.GetPlayerFromId(src)
        if not xP then return false end
        amount = math.floor(tonumber(amount) or 0)
        if amount <= 0 then return false end
        if account == 'money' then
            if xP.getMoney() < amount then return false end
            xP.removeMoney(amount)
            return true
        else
            local bal = (xP.getAccount(account) or {}).money or 0
            if bal < amount then return false end
            xP.removeAccountMoney(account, amount)
            return true
        end
    end
elseif fw == 'qb' or fw == 'qbox' then
    local QBCore = exports['qb-core']:GetCoreObject()
    local function mapAccount(acc) return (acc == 'money') and 'cash' or acc end

    function UG.Money.Get(src, account)
        local P = QBCore.Functions.GetPlayer(src)
        if not P then return 0 end
        account = mapAccount(account)
        return (P.PlayerData.money and P.PlayerData.money[account]) or 0
    end

    function UG.Money.Remove(src, account, amount)
        local P = QBCore.Functions.GetPlayer(src)
        if not P then return false end
        amount = math.floor(tonumber(amount) or 0)
        if amount <= 0 then return false end
        account = mapAccount(account)
        local cur = (P.PlayerData.money and P.PlayerData.money[account]) or 0
        if cur < amount then return false end
        P.Functions.RemoveMoney(account, amount, 'ug_case_opening-buy')
        return true
    end
else
    function UG.Money.Get(src, account) return 999999999 end

    function UG.Money.Remove(src, account, amount) return true end
end
