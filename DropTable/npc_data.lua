-- npc_data.lua

-- This table stores NPCs and their drop tables with item IDs and drop rates
NPCData = {
    -- IMP NPC (ID: 442293)
    [442293] = {
        name = "Imp",
        drops = {
            { itemID = 90830, dropRate = 5, quantity = "1" },  -- Fiendish ashes (1 in 5 = 20%)
            { itemID = 90831, dropRate = 10, quantity = "1"  }, -- Ashes (1 in 10 = 10%)
            { itemID = 90047, dropRate = 8, quantity = "1"  },  -- Bucket (1 in 8 = 12.5%)
            { itemID = 90142, dropRate = 4, quantity = "1"  },  -- Cooked Meat (1 in 4 = 25%)
            { itemID = 90161, dropRate = 15, quantity = "1"  }, -- Hammer (1 in 15 = 6.67%)
        }
    },

    -- MAN NPC (ID: 441831)
    [441831] = {
        name = "Man",
        drops = {
            { itemID = 90039, dropRate = 6, quantity = "1"  },  -- Bones (1 in 6 = 16.67%)
            { itemID = 90078, dropRate = 10, quantity = "1"  }, -- Grimy guam leaf (1 in 10 = 10%)
            { itemID = 90084, dropRate = 12, quantity = "1"  }, -- Grimy Rannar leaf (1 in 12 = 8.33%)
        }
    },

    -- Woman NPC (ID: 441832)
    [441832] = {
        name = "Woman",
        drops = {
            { itemID = 90039, dropRate = 6, quantity = "1"  },  -- Bones (1 in 6 = 16.67%)
            { itemID = 90050, dropRate = 5, quantity = "1"  },  -- Cabbage (1 in 5 = 20%)
            { itemID = 90633, dropRate = 20, quantity = "2-7"  },  -- Cabbage (1 in 5 = 20%)

        }
    }
}

-- This file doesn't return anything; the `NPCData` table is globally accessible
