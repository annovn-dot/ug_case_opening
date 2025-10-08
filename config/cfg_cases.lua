-- Each case defines its own rarity list and item pool.
-- item fields: name, item, rarity, chance (weight), amount
Cases = {
    rarity_list = { 'common', 'uncommon', 'rare', 'mythical', 'legendary', 'ancient', 'extraordinary' },

    ['case_engine'] = {
        label = 'Engine Upgrade Case',
        image = 'case_engine',           -- optional: used for shop/icon
        rarities = { rare = '#4b69ff' }, -- optional: override global colors
        price = 21000,
        items = {
            { name = 'Engine level S2', item = 'engine_s_2', image = 'engine.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Engine level S3', item = 'engine_s_3', image = 'engine.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Engine level S4', item = 'engine_s_4', image = 'engine.png', rarity = 'ancient',       chance = 3,  amount = 1 },
            { name = 'Engine level S5', item = 'engine_s_5', image = 'engine.png', rarity = 'extraordinary', chance = 2,  amount = 1 },

            { name = 'Engine level A2', item = 'engine_a_2', image = 'engine.png', rarity = 'common',        chance = 15, amount = 1 },
            { name = 'Engine level A3', item = 'engine_a_3', image = 'engine.png', rarity = 'uncommon',      chance = 10, amount = 1 },
            { name = 'Engine level A4', item = 'engine_a_4', image = 'engine.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Engine level A5', item = 'engine_a_5', image = 'engine.png', rarity = 'mythical',      chance = 4,  amount = 1 },

            { name = 'Engine level B2', item = 'engine_b_2', image = 'engine.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Engine level B3', item = 'engine_b_3', image = 'engine.png', rarity = 'uncommon',      chance = 30, amount = 1 },
            { name = 'Engine level B4', item = 'engine_b_4', image = 'engine.png', rarity = 'uncommon',      chance = 30, amount = 1 },
            { name = 'Engine level B5', item = 'engine_b_5', image = 'engine.png', rarity = 'rare',          chance = 30, amount = 1 },

            { name = 'Engine level C2', item = 'engine_c_2', image = 'engine.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Engine level C3', item = 'engine_c_3', image = 'engine.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Engine level C4', item = 'engine_c_4', image = 'engine.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Engine level C5', item = 'engine_c_5', image = 'engine.png', rarity = 'common',        chance = 25, amount = 1 },

            { name = 'Engine level D2', item = 'engine_d_2', image = 'engine.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Engine level D3', item = 'engine_d_3', image = 'engine.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Engine level D4', item = 'engine_d_4', image = 'engine.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Engine level D5', item = 'engine_d_5', image = 'engine.png', rarity = 'common',        chance = 30, amount = 1 },
        }
    },
    ['case_transmission'] = {
        label = 'Transmission Upgrade Case',
        image = 'case_transmission',
        rarities = { rare = '#4b69ff' },
        price = 15000,
        items = {
            { name = 'Transmission level S2', item = 'transmission_s_2', image = 'transmission.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Transmission level S3', item = 'transmission_s_3', image = 'transmission.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Transmission level S4', item = 'transmission_s_4', image = 'transmission.png', rarity = 'ancient',       chance = 3,  amount = 1 },
            { name = 'Transmission level S5', item = 'transmission_s_5', image = 'transmission.png', rarity = 'extraordinary', chance = 2,  amount = 1 },

            { name = 'Transmission level A2', item = 'transmission_a_2', image = 'transmission.png', rarity = 'common',        chance = 15, amount = 1 },
            { name = 'Transmission level A3', item = 'transmission_a_3', image = 'transmission.png', rarity = 'uncommon',      chance = 10, amount = 1 },
            { name = 'Transmission level A4', item = 'transmission_a_4', image = 'transmission.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Transmission level A5', item = 'transmission_a_5', image = 'transmission.png', rarity = 'mythical',      chance = 4,  amount = 1 },

            { name = 'Transmission level B2', item = 'transmission_b_2', image = 'transmission.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Transmission level B3', item = 'transmission_b_3', image = 'transmission.png', rarity = 'uncommon',      chance = 30, amount = 1 },
            { name = 'Transmission level B4', item = 'transmission_b_4', image = 'transmission.png', rarity = 'uncommon',      chance = 30, amount = 1 },
            { name = 'Transmission level B5', item = 'transmission_b_5', image = 'transmission.png', rarity = 'rare',          chance = 30, amount = 1 },

            { name = 'Transmission level C2', item = 'transmission_c_2', image = 'transmission.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Transmission level C3', item = 'transmission_c_3', image = 'transmission.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Transmission level C4', item = 'transmission_c_4', image = 'transmission.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Transmission level C5', item = 'transmission_c_5', image = 'transmission.png', rarity = 'common',        chance = 25, amount = 1 },

            { name = 'Transmission level D2', item = 'transmission_d_2', image = 'transmission.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Transmission level D3', item = 'transmission_d_3', image = 'transmission.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Transmission level D4', item = 'transmission_d_4', image = 'transmission.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Transmission level D5', item = 'transmission_d_5', image = 'transmission.png', rarity = 'common',        chance = 30, amount = 1 },
        }
    },

    ['case_suspension'] = {
        label = 'Suspension Upgrade Case',
        image = 'case_suspension',
        rarities = { rare = '#4b69ff' },
        price = 10000,
        items = {
            { name = 'Suspension level S2', item = 'suspension_s_2', image = 'suspension.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Suspension level S3', item = 'suspension_s_3', image = 'suspension.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Suspension level S4', item = 'suspension_s_4', image = 'suspension.png', rarity = 'ancient',       chance = 3,  amount = 1 },
            { name = 'Suspension level S5', item = 'suspension_s_5', image = 'suspension.png', rarity = 'extraordinary', chance = 2,  amount = 1 },

            { name = 'Suspension level A2', item = 'suspension_a_2', image = 'suspension.png', rarity = 'common',        chance = 15, amount = 1 },
            { name = 'Suspension level A3', item = 'suspension_a_3', image = 'suspension.png', rarity = 'uncommon',      chance = 10, amount = 1 },
            { name = 'Suspension level A4', item = 'suspension_a_4', image = 'suspension.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Suspension level A5', item = 'suspension_a_5', image = 'suspension.png', rarity = 'mythical',      chance = 4,  amount = 1 },

            { name = 'Suspension level B2', item = 'suspension_b_2', image = 'suspension.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Suspension level B3', item = 'suspension_b_3', image = 'suspension.png', rarity = 'uncommon',      chance = 30, amount = 1 },
            { name = 'Suspension level B4', item = 'suspension_b_4', image = 'suspension.png', rarity = 'uncommon',      chance = 30, amount = 1 },
            { name = 'Suspension level B5', item = 'suspension_b_5', image = 'suspension.png', rarity = 'rare',          chance = 30, amount = 1 },

            { name = 'Suspension level C2', item = 'suspension_c_2', image = 'suspension.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Suspension level C3', item = 'suspension_c_3', image = 'suspension.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Suspension level C4', item = 'suspension_c_4', image = 'suspension.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Suspension level C5', item = 'suspension_c_5', image = 'suspension.png', rarity = 'common',        chance = 25, amount = 1 },

            { name = 'Suspension level D2', item = 'suspension_d_2', image = 'suspension.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Suspension level D3', item = 'suspension_d_3', image = 'suspension.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Suspension level D4', item = 'suspension_d_4', image = 'suspension.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Suspension level D5', item = 'suspension_d_5', image = 'suspension.png', rarity = 'common',        chance = 30, amount = 1 },
        }
    },

    ['case_brakes'] = {
        label = 'Brakes Upgrade Case',
        image = 'case_brakes',
        rarities = { rare = '#4b69ff' },
        price = 12000,
        items = {
            { name = 'Brakes level S2', item = 'brakes_s_2', image = 'brakes.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Brakes level S3', item = 'brakes_s_3', image = 'brakes.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Brakes level S4', item = 'brakes_s_4', image = 'brakes.png', rarity = 'ancient',       chance = 3,  amount = 1 },
            { name = 'Brakes level S5', item = 'brakes_s_5', image = 'brakes.png', rarity = 'extraordinary', chance = 2,  amount = 1 },

            { name = 'Brakes level A2', item = 'brakes_a_2', image = 'brakes.png', rarity = 'common',        chance = 15, amount = 1 },
            { name = 'Brakes level A3', item = 'brakes_a_3', image = 'brakes.png', rarity = 'uncommon',      chance = 10, amount = 1 },
            { name = 'Brakes level A4', item = 'brakes_a_4', image = 'brakes.png', rarity = 'rare',          chance = 5,  amount = 1 },
            { name = 'Brakes level A5', item = 'brakes_a_5', image = 'brakes.png', rarity = 'mythical',      chance = 4,  amount = 1 },

            { name = 'Brakes level B2', item = 'brakes_b_2', image = 'brakes.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Brakes level B3', item = 'brakes_b_3', image = 'brakes.png', rarity = 'uncommon',      chance = 30, amount = 1 },
            { name = 'Brakes level B4', item = 'brakes_b_4', image = 'brakes.png', rarity = 'uncommon',      chance = 30, amount = 1 },
            { name = 'Brakes level B5', item = 'brakes_b_5', image = 'brakes.png', rarity = 'rare',          chance = 30, amount = 1 },

            { name = 'Brakes level C2', item = 'brakes_c_2', image = 'brakes.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Brakes level C3', item = 'brakes_c_3', image = 'brakes.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Brakes level C4', item = 'brakes_c_4', image = 'brakes.png', rarity = 'common',        chance = 25, amount = 1 },
            { name = 'Brakes level C5', item = 'brakes_c_5', image = 'brakes.png', rarity = 'common',        chance = 25, amount = 1 },

            { name = 'Brakes level D2', item = 'brakes_d_2', image = 'brakes.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Brakes level D3', item = 'brakes_d_3', image = 'brakes.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Brakes level D4', item = 'brakes_d_4', image = 'brakes.png', rarity = 'common',        chance = 30, amount = 1 },
            { name = 'Brakes level D5', item = 'brakes_d_5', image = 'brakes.png', rarity = 'common',        chance = 30, amount = 1 },
        }
    },

    ['case_turbo'] = {
        label = 'Turbo Upgrade Case',
        image = 'case_turbo',
        rarities = { rare = '#4b69ff' },
        price = 20000,
        items = {
            -- Using weighted chances roughly based on your engine totals per class
            -- D (30*4=120), C (25*4=100), B (30*4=120), A (15+10+5+4=34), S (5+5+3+2=15), X (very rare)
            { name = 'Turbo class D', item = 'turbo_d', image = 'turbo.png', rarity = 'common',        chance = 120, amount = 1 },
            { name = 'Turbo class C', item = 'turbo_c', image = 'turbo.png', rarity = 'common',        chance = 100, amount = 1 },
            { name = 'Turbo class B', item = 'turbo_b', image = 'turbo.png', rarity = 'uncommon',      chance = 120, amount = 1 },
            { name = 'Turbo class A', item = 'turbo_a', image = 'turbo.png', rarity = 'rare',          chance = 34,  amount = 1 },
            { name = 'Turbo class S', item = 'turbo_s', image = 'turbo.png', rarity = 'ancient',       chance = 15,  amount = 1 },
            { name = 'Turbo class X', item = 'turbo_x', image = 'turbo.png', rarity = 'extraordinary', chance = 2,   amount = 1 },
        }
    },

    ['case_performance'] = {
        label = 'Performance Upgrade Case',
        image = 'case_performance',
        rarities = { rare = '#4b69ff' },
        price = 5000,
        items = {
            -- ENGINE
            { name = 'Engine level S2',       item = 'engine_s_2',       image = 'engine.png',       rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Engine level S3',       item = 'engine_s_3',       image = 'engine.png',       rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Engine level S4',       item = 'engine_s_4',       image = 'engine.png',       rarity = 'ancient',       chance = 3,   amount = 1 },
            { name = 'Engine level S5',       item = 'engine_s_5',       image = 'engine.png',       rarity = 'extraordinary', chance = 2,   amount = 1 },

            { name = 'Engine level A2',       item = 'engine_a_2',       image = 'engine.png',       rarity = 'common',        chance = 15,  amount = 1 },
            { name = 'Engine level A3',       item = 'engine_a_3',       image = 'engine.png',       rarity = 'uncommon',      chance = 10,  amount = 1 },
            { name = 'Engine level A4',       item = 'engine_a_4',       image = 'engine.png',       rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Engine level A5',       item = 'engine_a_5',       image = 'engine.png',       rarity = 'mythical',      chance = 4,   amount = 1 },

            { name = 'Engine level B2',       item = 'engine_b_2',       image = 'engine.png',       rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Engine level B3',       item = 'engine_b_3',       image = 'engine.png',       rarity = 'uncommon',      chance = 30,  amount = 1 },
            { name = 'Engine level B4',       item = 'engine_b_4',       image = 'engine.png',       rarity = 'uncommon',      chance = 30,  amount = 1 },
            { name = 'Engine level B5',       item = 'engine_b_5',       image = 'engine.png',       rarity = 'rare',          chance = 30,  amount = 1 },

            { name = 'Engine level C2',       item = 'engine_c_2',       image = 'engine.png',       rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Engine level C3',       item = 'engine_c_3',       image = 'engine.png',       rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Engine level C4',       item = 'engine_c_4',       image = 'engine.png',       rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Engine level C5',       item = 'engine_c_5',       image = 'engine.png',       rarity = 'common',        chance = 25,  amount = 1 },

            { name = 'Engine level D2',       item = 'engine_d_2',       image = 'engine.png',       rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Engine level D3',       item = 'engine_d_3',       image = 'engine.png',       rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Engine level D4',       item = 'engine_d_4',       image = 'engine.png',       rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Engine level D5',       item = 'engine_d_5',       image = 'engine.png',       rarity = 'common',        chance = 30,  amount = 1 },

            -- TRANSMISSION
            { name = 'Transmission level S2', item = 'transmission_s_2', image = 'transmission.png', rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Transmission level S3', item = 'transmission_s_3', image = 'transmission.png', rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Transmission level S4', item = 'transmission_s_4', image = 'transmission.png', rarity = 'ancient',       chance = 3,   amount = 1 },
            { name = 'Transmission level S5', item = 'transmission_s_5', image = 'transmission.png', rarity = 'extraordinary', chance = 2,   amount = 1 },

            { name = 'Transmission level A2', item = 'transmission_a_2', image = 'transmission.png', rarity = 'common',        chance = 15,  amount = 1 },
            { name = 'Transmission level A3', item = 'transmission_a_3', image = 'transmission.png', rarity = 'uncommon',      chance = 10,  amount = 1 },
            { name = 'Transmission level A4', item = 'transmission_a_4', image = 'transmission.png', rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Transmission level A5', item = 'transmission_a_5', image = 'transmission.png', rarity = 'mythical',      chance = 4,   amount = 1 },

            { name = 'Transmission level B2', item = 'transmission_b_2', image = 'transmission.png', rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Transmission level B3', item = 'transmission_b_3', image = 'transmission.png', rarity = 'uncommon',      chance = 30,  amount = 1 },
            { name = 'Transmission level B4', item = 'transmission_b_4', image = 'transmission.png', rarity = 'uncommon',      chance = 30,  amount = 1 },
            { name = 'Transmission level B5', item = 'transmission_b_5', image = 'transmission.png', rarity = 'rare',          chance = 30,  amount = 1 },

            { name = 'Transmission level C2', item = 'transmission_c_2', image = 'transmission.png', rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Transmission level C3', item = 'transmission_c_3', image = 'transmission.png', rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Transmission level C4', item = 'transmission_c_4', image = 'transmission.png', rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Transmission level C5', item = 'transmission_c_5', image = 'transmission.png', rarity = 'common',        chance = 25,  amount = 1 },

            { name = 'Transmission level D2', item = 'transmission_d_2', image = 'transmission.png', rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Transmission level D3', item = 'transmission_d_3', image = 'transmission.png', rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Transmission level D4', item = 'transmission_d_4', image = 'transmission.png', rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Transmission level D5', item = 'transmission_d_5', image = 'transmission.png', rarity = 'common',        chance = 30,  amount = 1 },

            -- SUSPENSION
            { name = 'Suspension level S2',   item = 'suspension_s_2',   image = 'suspension.png',   rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Suspension level S3',   item = 'suspension_s_3',   image = 'suspension.png',   rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Suspension level S4',   item = 'suspension_s_4',   image = 'suspension.png',   rarity = 'ancient',       chance = 3,   amount = 1 },
            { name = 'Suspension level S5',   item = 'suspension_s_5',   image = 'suspension.png',   rarity = 'extraordinary', chance = 2,   amount = 1 },

            { name = 'Suspension level A2',   item = 'suspension_a_2',   image = 'suspension.png',   rarity = 'common',        chance = 15,  amount = 1 },
            { name = 'Suspension level A3',   item = 'suspension_a_3',   image = 'suspension.png',   rarity = 'uncommon',      chance = 10,  amount = 1 },
            { name = 'Suspension level A4',   item = 'suspension_a_4',   image = 'suspension.png',   rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Suspension level A5',   item = 'suspension_a_5',   image = 'suspension.png',   rarity = 'mythical',      chance = 4,   amount = 1 },

            { name = 'Suspension level B2',   item = 'suspension_b_2',   image = 'suspension.png',   rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Suspension level B3',   item = 'suspension_b_3',   image = 'suspension.png',   rarity = 'uncommon',      chance = 30,  amount = 1 },
            { name = 'Suspension level B4',   item = 'suspension_b_4',   image = 'suspension.png',   rarity = 'uncommon',      chance = 30,  amount = 1 },
            { name = 'Suspension level B5',   item = 'suspension_b_5',   image = 'suspension.png',   rarity = 'rare',          chance = 30,  amount = 1 },

            { name = 'Suspension level C2',   item = 'suspension_c_2',   image = 'suspension.png',   rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Suspension level C3',   item = 'suspension_c_3',   image = 'suspension.png',   rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Suspension level C4',   item = 'suspension_c_4',   image = 'suspension.png',   rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Suspension level C5',   item = 'suspension_c_5',   image = 'suspension.png',   rarity = 'common',        chance = 25,  amount = 1 },

            { name = 'Suspension level D2',   item = 'suspension_d_2',   image = 'suspension.png',   rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Suspension level D3',   item = 'suspension_d_3',   image = 'suspension.png',   rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Suspension level D4',   item = 'suspension_d_4',   image = 'suspension.png',   rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Suspension level D5',   item = 'suspension_d_5',   image = 'suspension.png',   rarity = 'common',        chance = 30,  amount = 1 },

            -- BRAKES
            { name = 'Brakes level S2',       item = 'brakes_s_2',       image = 'brakes.png',       rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Brakes level S3',       item = 'brakes_s_3',       image = 'brakes.png',       rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Brakes level S4',       item = 'brakes_s_4',       image = 'brakes.png',       rarity = 'ancient',       chance = 3,   amount = 1 },
            { name = 'Brakes level S5',       item = 'brakes_s_5',       image = 'brakes.png',       rarity = 'extraordinary', chance = 2,   amount = 1 },

            { name = 'Brakes level A2',       item = 'brakes_a_2',       image = 'brakes.png',       rarity = 'common',        chance = 15,  amount = 1 },
            { name = 'Brakes level A3',       item = 'brakes_a_3',       image = 'brakes.png',       rarity = 'uncommon',      chance = 10,  amount = 1 },
            { name = 'Brakes level A4',       item = 'brakes_a_4',       image = 'brakes.png',       rarity = 'rare',          chance = 5,   amount = 1 },
            { name = 'Brakes level A5',       item = 'brakes_a_5',       image = 'brakes.png',       rarity = 'mythical',      chance = 4,   amount = 1 },

            { name = 'Brakes level B2',       item = 'brakes_b_2',       image = 'brakes.png',       rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Brakes level B3',       item = 'brakes_b_3',       image = 'brakes.png',       rarity = 'uncommon',      chance = 30,  amount = 1 },
            { name = 'Brakes level B4',       item = 'brakes_b_4',       image = 'brakes.png',       rarity = 'uncommon',      chance = 30,  amount = 1 },
            { name = 'Brakes level B5',       item = 'brakes_b_5',       image = 'brakes.png',       rarity = 'rare',          chance = 30,  amount = 1 },

            { name = 'Brakes level C2',       item = 'brakes_c_2',       image = 'brakes.png',       rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Brakes level C3',       item = 'brakes_c_3',       image = 'brakes.png',       rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Brakes level C4',       item = 'brakes_c_4',       image = 'brakes.png',       rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Brakes level C5',       item = 'brakes_c_5',       image = 'brakes.png',       rarity = 'common',        chance = 25,  amount = 1 },

            { name = 'Brakes level D2',       item = 'brakes_d_2',       image = 'brakes.png',       rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Brakes level D3',       item = 'brakes_d_3',       image = 'brakes.png',       rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Brakes level D4',       item = 'brakes_d_4',       image = 'brakes.png',       rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Brakes level D5',       item = 'brakes_d_5',       image = 'brakes.png',       rarity = 'common',        chance = 30,  amount = 1 },

            -- TURBO
            { name = 'Turbo class D',         item = 'turbo_d',          image = 'turbo.png',        rarity = 'common',        chance = 120, amount = 1 },
            { name = 'Turbo class C',         item = 'turbo_c',          image = 'turbo.png',        rarity = 'common',        chance = 100, amount = 1 },
            { name = 'Turbo class B',         item = 'turbo_b',          image = 'turbo.png',        rarity = 'uncommon',      chance = 120, amount = 1 },
            { name = 'Turbo class A',         item = 'turbo_a',          image = 'turbo.png',        rarity = 'rare',          chance = 34,  amount = 1 },
            { name = 'Turbo class S',         item = 'turbo_s',          image = 'turbo.png',        rarity = 'ancient',       chance = 15,  amount = 1 },
            { name = 'Turbo class X',         item = 'turbo_x',          image = 'turbo.png',        rarity = 'extraordinary', chance = 2,   amount = 1 },
        }
    },
    ['case_misc'] = {
        label = 'Misc Upgrade Case',
        image = 'case_misc',
        rarities = { rare = '#4b69ff' },
        price = 7500,
        items = {

            -- ECU
            { name = 'ECU class D',                 item = 'ecu_d',               image = 'ecu.png',               rarity = 'common',        chance = 120, amount = 1 },
            { name = 'ECU class C',                 item = 'ecu_c',               image = 'ecu.png',               rarity = 'common',        chance = 100, amount = 1 },
            { name = 'ECU class B',                 item = 'ecu_b',               image = 'ecu.png',               rarity = 'uncommon',      chance = 120, amount = 1 },
            { name = 'ECU class A',                 item = 'ecu_a',               image = 'ecu.png',               rarity = 'rare',          chance = 34,  amount = 1 },
            { name = 'ECU class S',                 item = 'ecu_s',               image = 'ecu.png',               rarity = 'ancient',       chance = 15,  amount = 1 },
            { name = 'ECU class X',                 item = 'ecu_x',               image = 'ecu.png',               rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Nitro Hoses
            { name = 'Nitro Hoses class D',         item = 'nitro_hoses_d',       image = 'nitro_hoses.png',       rarity = 'common',        chance = 120, amount = 1 },
            { name = 'Nitro Hoses class C',         item = 'nitro_hoses_c',       image = 'nitro_hoses.png',       rarity = 'common',        chance = 100, amount = 1 },
            { name = 'Nitro Hoses class B',         item = 'nitro_hoses_b',       image = 'nitro_hoses.png',       rarity = 'uncommon',      chance = 120, amount = 1 },
            { name = 'Nitro Hoses class A',         item = 'nitro_hoses_a',       image = 'nitro_hoses.png',       rarity = 'rare',          chance = 34,  amount = 1 },
            { name = 'Nitro Hoses class S',         item = 'nitro_hoses_s',       image = 'nitro_hoses.png',       rarity = 'ancient',       chance = 15,  amount = 1 },
            { name = 'Nitro Hoses class X',         item = 'nitro_hoses_x',       image = 'nitro_hoses.png',       rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Drift Kit
            { name = 'Drift Kit class D',           item = 'drift_kit_d',         image = 'drift_kit.png',         rarity = 'common',        chance = 120, amount = 1 },
            { name = 'Drift Kit class C',           item = 'drift_kit_c',         image = 'drift_kit.png',         rarity = 'common',        chance = 100, amount = 1 },
            { name = 'Drift Kit class B',           item = 'drift_kit_b',         image = 'drift_kit.png',         rarity = 'uncommon',      chance = 120, amount = 1 },
            { name = 'Drift Kit class A',           item = 'drift_kit_a',         image = 'drift_kit.png',         rarity = 'rare',          chance = 34,  amount = 1 },
            { name = 'Drift Kit class S',           item = 'drift_kit_s',         image = 'drift_kit.png',         rarity = 'ancient',       chance = 15,  amount = 1 },
            { name = 'Drift Kit class X',           item = 'drift_kit_x',         image = 'drift_kit.png',         rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Gearbox (Automatic)
            { name = 'Gearbox (Automatic) class D', item = 'gearbox_automatic_d', image = 'gearbox_automatic.png', rarity = 'common',        chance = 120, amount = 1 },
            { name = 'Gearbox (Automatic) class C', item = 'gearbox_automatic_c', image = 'gearbox_automatic.png', rarity = 'common',        chance = 100, amount = 1 },
            { name = 'Gearbox (Automatic) class B', item = 'gearbox_automatic_b', image = 'gearbox_automatic.png', rarity = 'uncommon',      chance = 120, amount = 1 },
            { name = 'Gearbox (Automatic) class A', item = 'gearbox_automatic_a', image = 'gearbox_automatic.png', rarity = 'rare',          chance = 34,  amount = 1 },
            { name = 'Gearbox (Automatic) class S', item = 'gearbox_automatic_s', image = 'gearbox_automatic.png', rarity = 'ancient',       chance = 15,  amount = 1 },
            { name = 'Gearbox (Automatic) class X', item = 'gearbox_automatic_x', image = 'gearbox_automatic.png', rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Gearbox (Manual)
            { name = 'Gearbox (Manual) class D',    item = 'gearbox_manual_d',    image = 'gearbox_manual.png',    rarity = 'common',        chance = 120, amount = 1 },
            { name = 'Gearbox (Manual) class C',    item = 'gearbox_manual_c',    image = 'gearbox_manual.png',    rarity = 'common',        chance = 100, amount = 1 },
            { name = 'Gearbox (Manual) class B',    item = 'gearbox_manual_b',    image = 'gearbox_manual.png',    rarity = 'uncommon',      chance = 120, amount = 1 },
            { name = 'Gearbox (Manual) class A',    item = 'gearbox_manual_a',    image = 'gearbox_manual.png',    rarity = 'rare',          chance = 34,  amount = 1 },
            { name = 'Gearbox (Manual) class S',    item = 'gearbox_manual_s',    image = 'gearbox_manual.png',    rarity = 'ancient',       chance = 15,  amount = 1 },
            { name = 'Gearbox (Manual) class X',    item = 'gearbox_manual_x',    image = 'gearbox_manual.png',    rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Harness
            { name = 'Harness class D',             item = 'harness_d',           image = 'harness.png',           rarity = 'common',        chance = 120, amount = 1 },
            { name = 'Harness class C',             item = 'harness_c',           image = 'harness.png',           rarity = 'common',        chance = 100, amount = 1 },
            { name = 'Harness class B',             item = 'harness_b',           image = 'harness.png',           rarity = 'uncommon',      chance = 120, amount = 1 },
            { name = 'Harness class A',             item = 'harness_a',           image = 'harness.png',           rarity = 'rare',          chance = 34,  amount = 1 },
            { name = 'Harness class S',             item = 'harness_s',           image = 'harness.png',           rarity = 'ancient',       chance = 15,  amount = 1 },
            { name = 'Harness class X',             item = 'harness_x',           image = 'harness.png',           rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- GPS
            { name = 'GPS class D',                 item = 'gps_d',               image = 'gps.png',               rarity = 'common',        chance = 120, amount = 1 },
            { name = 'GPS class C',                 item = 'gps_c',               image = 'gps.png',               rarity = 'common',        chance = 100, amount = 1 },
            { name = 'GPS class B',                 item = 'gps_b',               image = 'gps.png',               rarity = 'uncommon',      chance = 120, amount = 1 },
            { name = 'GPS class A',                 item = 'gps_a',               image = 'gps.png',               rarity = 'rare',          chance = 34,  amount = 1 },
            { name = 'GPS class S',                 item = 'gps_s',               image = 'gps.png',               rarity = 'ancient',       chance = 15,  amount = 1 },
            { name = 'GPS class X',                 item = 'gps_x',               image = 'gps.png',               rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Door Lock (Class D)
            { name = 'Door Lock level D2',          item = 'door_lock_d_2',       image = 'door_lock.png',         rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Door Lock level D3',          item = 'door_lock_d_3',       image = 'door_lock.png',         rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Door Lock level D4',          item = 'door_lock_d_4',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Door Lock level D5',          item = 'door_lock_d_5',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Door Lock level D6',          item = 'door_lock_d_6',       image = 'door_lock.png',         rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Door Lock level D7',          item = 'door_lock_d_7',       image = 'door_lock.png',         rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Door Lock level D8',          item = 'door_lock_d_8',       image = 'door_lock.png',         rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Door Lock level D9',          item = 'door_lock_d_9',       image = 'door_lock.png',         rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Door Lock (Class C)
            { name = 'Door Lock level C2',          item = 'door_lock_c_2',       image = 'door_lock.png',         rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Door Lock level C3',          item = 'door_lock_c_3',       image = 'door_lock.png',         rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Door Lock level C4',          item = 'door_lock_c_4',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Door Lock level C5',          item = 'door_lock_c_5',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Door Lock level C6',          item = 'door_lock_c_6',       image = 'door_lock.png',         rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Door Lock level C7',          item = 'door_lock_c_7',       image = 'door_lock.png',         rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Door Lock level C8',          item = 'door_lock_c_8',       image = 'door_lock.png',         rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Door Lock level C9',          item = 'door_lock_c_9',       image = 'door_lock.png',         rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Door Lock (Class B)
            { name = 'Door Lock level B2',          item = 'door_lock_b_2',       image = 'door_lock.png',         rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Door Lock level B3',          item = 'door_lock_b_3',       image = 'door_lock.png',         rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Door Lock level B4',          item = 'door_lock_b_4',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Door Lock level B5',          item = 'door_lock_b_5',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Door Lock level B6',          item = 'door_lock_b_6',       image = 'door_lock.png',         rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Door Lock level B7',          item = 'door_lock_b_7',       image = 'door_lock.png',         rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Door Lock level B8',          item = 'door_lock_b_8',       image = 'door_lock.png',         rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Door Lock level B9',          item = 'door_lock_b_9',       image = 'door_lock.png',         rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Door Lock (Class A)
            { name = 'Door Lock level A2',          item = 'door_lock_a_2',       image = 'door_lock.png',         rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Door Lock level A3',          item = 'door_lock_a_3',       image = 'door_lock.png',         rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Door Lock level A4',          item = 'door_lock_a_4',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Door Lock level A5',          item = 'door_lock_a_5',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Door Lock level A6',          item = 'door_lock_a_6',       image = 'door_lock.png',         rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Door Lock level A7',          item = 'door_lock_a_7',       image = 'door_lock.png',         rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Door Lock level A8',          item = 'door_lock_a_8',       image = 'door_lock.png',         rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Door Lock level A9',          item = 'door_lock_a_9',       image = 'door_lock.png',         rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Door Lock (Class S)
            { name = 'Door Lock level S2',          item = 'door_lock_s_2',       image = 'door_lock.png',         rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Door Lock level S3',          item = 'door_lock_s_3',       image = 'door_lock.png',         rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Door Lock level S4',          item = 'door_lock_s_4',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Door Lock level S5',          item = 'door_lock_s_5',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Door Lock level S6',          item = 'door_lock_s_6',       image = 'door_lock.png',         rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Door Lock level S7',          item = 'door_lock_s_7',       image = 'door_lock.png',         rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Door Lock level S8',          item = 'door_lock_s_8',       image = 'door_lock.png',         rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Door Lock level S9',          item = 'door_lock_s_9',       image = 'door_lock.png',         rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Door Lock (Class X)
            { name = 'Door Lock level X2',          item = 'door_lock_x_2',       image = 'door_lock.png',         rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Door Lock level X3',          item = 'door_lock_x_3',       image = 'door_lock.png',         rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Door Lock level X4',          item = 'door_lock_x_4',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Door Lock level X5',          item = 'door_lock_x_5',       image = 'door_lock.png',         rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Door Lock level X6',          item = 'door_lock_x_6',       image = 'door_lock.png',         rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Door Lock level X7',          item = 'door_lock_x_7',       image = 'door_lock.png',         rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Door Lock level X8',          item = 'door_lock_x_8',       image = 'door_lock.png',         rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Door Lock level X9',          item = 'door_lock_x_9',       image = 'door_lock.png',         rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Ignition Lock (Class D)
            { name = 'Ignition Lock level D2',      item = 'ignition_lock_d_2',   image = 'ignition_lock.png',     rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Ignition Lock level D3',      item = 'ignition_lock_d_3',   image = 'ignition_lock.png',     rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Ignition Lock level D4',      item = 'ignition_lock_d_4',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Ignition Lock level D5',      item = 'ignition_lock_d_5',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Ignition Lock level D6',      item = 'ignition_lock_d_6',   image = 'ignition_lock.png',     rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Ignition Lock level D7',      item = 'ignition_lock_d_7',   image = 'ignition_lock.png',     rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Ignition Lock level D8',      item = 'ignition_lock_d_8',   image = 'ignition_lock.png',     rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Ignition Lock level D9',      item = 'ignition_lock_d_9',   image = 'ignition_lock.png',     rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Ignition Lock (Class C)
            { name = 'Ignition Lock level C2',      item = 'ignition_lock_c_2',   image = 'ignition_lock.png',     rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Ignition Lock level C3',      item = 'ignition_lock_c_3',   image = 'ignition_lock.png',     rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Ignition Lock level C4',      item = 'ignition_lock_c_4',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Ignition Lock level C5',      item = 'ignition_lock_c_5',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Ignition Lock level C6',      item = 'ignition_lock_c_6',   image = 'ignition_lock.png',     rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Ignition Lock level C7',      item = 'ignition_lock_c_7',   image = 'ignition_lock.png',     rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Ignition Lock level C8',      item = 'ignition_lock_c_8',   image = 'ignition_lock.png',     rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Ignition Lock level C9',      item = 'ignition_lock_c_9',   image = 'ignition_lock.png',     rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Ignition Lock (Class B)
            { name = 'Ignition Lock level B2',      item = 'ignition_lock_b_2',   image = 'ignition_lock.png',     rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Ignition Lock level B3',      item = 'ignition_lock_b_3',   image = 'ignition_lock.png',     rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Ignition Lock level B4',      item = 'ignition_lock_b_4',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Ignition Lock level B5',      item = 'ignition_lock_b_5',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Ignition Lock level B6',      item = 'ignition_lock_b_6',   image = 'ignition_lock.png',     rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Ignition Lock level B7',      item = 'ignition_lock_b_7',   image = 'ignition_lock.png',     rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Ignition Lock level B8',      item = 'ignition_lock_b_8',   image = 'ignition_lock.png',     rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Ignition Lock level B9',      item = 'ignition_lock_b_9',   image = 'ignition_lock.png',     rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Ignition Lock (Class A)
            { name = 'Ignition Lock level A2',      item = 'ignition_lock_a_2',   image = 'ignition_lock.png',     rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Ignition Lock level A3',      item = 'ignition_lock_a_3',   image = 'ignition_lock.png',     rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Ignition Lock level A4',      item = 'ignition_lock_a_4',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Ignition Lock level A5',      item = 'ignition_lock_a_5',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Ignition Lock level A6',      item = 'ignition_lock_a_6',   image = 'ignition_lock.png',     rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Ignition Lock level A7',      item = 'ignition_lock_a_7',   image = 'ignition_lock.png',     rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Ignition Lock level A8',      item = 'ignition_lock_a_8',   image = 'ignition_lock.png',     rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Ignition Lock level A9',      item = 'ignition_lock_a_9',   image = 'ignition_lock.png',     rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Ignition Lock (Class S)
            { name = 'Ignition Lock level S2',      item = 'ignition_lock_s_2',   image = 'ignition_lock.png',     rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Ignition Lock level S3',      item = 'ignition_lock_s_3',   image = 'ignition_lock.png',     rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Ignition Lock level S4',      item = 'ignition_lock_s_4',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Ignition Lock level S5',      item = 'ignition_lock_s_5',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Ignition Lock level S6',      item = 'ignition_lock_s_6',   image = 'ignition_lock.png',     rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Ignition Lock level S7',      item = 'ignition_lock_s_7',   image = 'ignition_lock.png',     rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Ignition Lock level S8',      item = 'ignition_lock_s_8',   image = 'ignition_lock.png',     rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Ignition Lock level S9',      item = 'ignition_lock_s_9',   image = 'ignition_lock.png',     rarity = 'extraordinary', chance = 2,   amount = 1 },

            -- Ignition Lock (Class X)
            { name = 'Ignition Lock level X2',      item = 'ignition_lock_x_2',   image = 'ignition_lock.png',     rarity = 'common',        chance = 30,  amount = 1 },
            { name = 'Ignition Lock level X3',      item = 'ignition_lock_x_3',   image = 'ignition_lock.png',     rarity = 'common',        chance = 25,  amount = 1 },
            { name = 'Ignition Lock level X4',      item = 'ignition_lock_x_4',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 20,  amount = 1 },
            { name = 'Ignition Lock level X5',      item = 'ignition_lock_x_5',   image = 'ignition_lock.png',     rarity = 'uncommon',      chance = 15,  amount = 1 },
            { name = 'Ignition Lock level X6',      item = 'ignition_lock_x_6',   image = 'ignition_lock.png',     rarity = 'rare',          chance = 10,  amount = 1 },
            { name = 'Ignition Lock level X7',      item = 'ignition_lock_x_7',   image = 'ignition_lock.png',     rarity = 'ancient',       chance = 7,   amount = 1 },
            { name = 'Ignition Lock level X8',      item = 'ignition_lock_x_8',   image = 'ignition_lock.png',     rarity = 'mythical',      chance = 5,   amount = 1 },
            { name = 'Ignition Lock level X9',      item = 'ignition_lock_x_9',   image = 'ignition_lock.png',     rarity = 'extraordinary', chance = 2,   amount = 1 },
        }
    }

}
