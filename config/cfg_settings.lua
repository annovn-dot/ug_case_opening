Config                = {}

Config.Debug          = false
Config.Framework      = 'esx' -- 'esx' | 'qb' | 'qbox'

-- Item icon URL template (OX default)
-- '%s' will be replaced with the item name
Config.IconPath       = 'nui://ox_inventory/web/images/%s.png'
Config.CaseWebhook    = ''

-- Which account to charge:
-- ESX: 'money' or a named account (if you use them, e.g. 'bank')
-- QB/QBOX: 'cash' or 'bank' (if you pick 'money' we auto-map to 'cash')
Config.MoneyAccount   = 'money'

Config.RollDuration   = 5.0 -- seconds to spin (used by UI)
Config.RevealHold     = 1.0 -- seconds before 'Confirm' becomes clickable

-- Spin speed profile (fractions must sum <= 1; cruise = 1 - rampIn - easeOut)
Config.SpinPhases     = {
    rampIn  = 0.07, -- fast acceleration at the start (10% of total)
    easeOut = 0.25, -- short gentle slowdown at the end (18% of total)
    -- cruise = 0.72 here
}

-- Easing per phase
Config.SpinEasing     = {
    rampIn  = 'cubic-bezier(.55,.06,.68,.19)', -- snappy accel
    cruise  = 'linear',                        -- constant speed
    easeOut = 'cubic-bezier(.12,.88,.08,1)',   -- quick then settle
}

-- Global rarity colors
Config.RarityColors   = {
    common        = '#b0c3d9',
    uncommon      = '#5e98d9',
    rare          = '#4b69ff',
    mythical      = '#8847ff',
    legendary     = '#d32ce6',
    ancient       = '#eb4b4b',
    extraordinary = '#ffd700'
}

Config.NotifyPosition = 'top-right' -- or 'center-left', etc.
Config.NotifyDuration = 5000

