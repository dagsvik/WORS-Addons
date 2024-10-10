-- npc_data.lua

-- This table stores NPCs and their drop tables with item IDs and drop rates
NPCData = {
    -- COW NPC (ID: 441777)
    [441777] = {
        name = "Cow",
        drops = {
			-- always
            { itemID = 90065, dropRate = 1, quantity = "1" },  -- Cowhide
            { itemID = 90096, dropRate = 1, quantity = "1" },  -- Raw beef
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
        }
    },
    -- GIANT RAT NPC (ID: 441804)
    [441804] = {
        name = "Giant Rat",
        drops = {
			-- always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
            { itemID = 90206, dropRate = 1, quantity = "1" },  -- Raw rat meat
        }
    },
    -- UNICORN NPC (ID: 441789)
    [441789] = {
        name = "Unicorn",
        drops = {
			-- always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
            { itemID = 90624, dropRate = 1, quantity = "1" },  -- Unicorn Horn
        }
    },
    -- FROG NPC (ID: 443084)
    [443084] = {
        name = "Frog",
        drops = {
			-- always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
        }
    },
    -- BIG FROG NPC (ID: 443084)
    [443084] = {
        name = "Big Frog",
        drops = {
			-- always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
        }
    },
    -- CHICKEN NPC (ID: 441387)
    [441387] = {
        name = "Chicken",
        drops = {
			-- always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
            { itemID = 90097, dropRate = 1, quantity = "1" },  -- Raw Chicken
            { itemID = 90069, dropRate = 2, quantity = "5" },  -- Feather
            { itemID = 90069, dropRate = 4, quantity = "15" },  -- Feather
        }
    },
    -- GOBLIN NPC (ID: 441845)
    [441845] = {
        name = "Goblin",
        drops = {
			-- always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
			-- Weapons and armour
			-- { itemID = 0, dropRate = 32, quantity = "1" },  -- Bronze Spear
			{ itemID = 90633, dropRate = 43, quantity = "7" },  -- Bronze Arrow
			{ itemID = 91072, dropRate = 64, quantity = "1" },  -- Black Cape
			{ itemID = 90009, dropRate = 43, quantity = "1" },  -- Bronze Axe
			{ itemID = 90033, dropRate = 128, quantity = "1" },  -- Bronze Scimitar
			-- { itemID = 0, dropRate = 43, quantity = "1" },  -- Bronze sq Shield
			-- Runes and ammunition
			{ itemID = 90107, dropRate = 22, quantity = "6" },  -- Water Runes
			{ itemID = 90038, dropRate = 43, quantity = "2" },  -- Body Runes
			{ itemID = 90067, dropRate = 43, quantity = "4" },  -- Earth Runes
			{ itemID = 90090, dropRate = 43, quantity = "2" },  -- Mind runes
			-- { itemID = 0, dropRate = 26, quantity = "7" },  -- bronze javelin
			{ itemID = 90052, dropRate = 128, quantity = "1" },  -- chaos runes
			{ itemID = 90091, dropRate = 128, quantity = "1" },  -- Nature Runes
			-- { itemID = 0, dropRate = 43, quantity = "8" },  -- Bronze bolts
			-- Other
			{ itemID = 90161, dropRate = 9, quantity = "1" },  -- Hammer
			{ itemID = 90073, dropRate = 26, quantity = "1" },  -- Goblin mail
			{ itemID = 90753, dropRate = 43, quantity = "1" },  -- Chef's Hat
			-- { itemID = 0, dropRate = 64, quantity = "1" },  -- Goblin book
			{ itemID = 90035, dropRate = 64, quantity = "1" },  -- Beer
			{ itemID = 90752, dropRate = 128, quantity = "1" },  -- Brass necklace
			-- { itemID = 0, dropRate = 128, quantity = "1" },  -- Air Talisman
        }
    },
    -- GOBLIN2 NPC (ID: 441845) --USING ONLY 1 LOOTTABLE AS THEY MIXED IT; IT SEEMS LIKE IT
    --[441845] = {
        --name = "Goblin #2",
        --drops = {
			-- always
            --{ itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
			-- Weapons and armour
			-- { itemID = 0, dropRate = 32, quantity = "1" },  -- Bronze Spear
			-- { itemID = 0, dropRate = 43, quantity = "1" },  -- Bronze Axe
			-- { itemID = 0, dropRate = 43, quantity = "1" },  -- Bronze Scimitar
			-- Runes and ammunition
			-- { itemID = 0, dropRate = 22, quantity = "6" },  -- Bronze arrow
			-- { itemID = 0, dropRate = 26, quantity = "7" },  -- Mind runes
			-- { itemID = 0, dropRate = 43, quantity = "4" },  -- Earth runes
			-- { itemID = 0, dropRate = 43, quantity = "8" },  -- Body runes
			-- { itemID = 0, dropRate = 26, quantity = "7" },  -- bronze javelin
			-- { itemID = 0, dropRate = 43, quantity = "4" },  -- chaos runes
			-- { itemID = 0, dropRate = 43, quantity = "8" },  -- Nature Runes
			-- Herbs
            --{ itemID = 90078, dropRate = 256, quantity = "1"  }, -- Grimy guam leaf
            --{ itemID = 90083, dropRate = 341, quantity = "1"  }, -- Grimy marrentill
            --{ itemID = 90207, dropRate = 455, quantity = "1"  }, -- Grimy Tarromin
            --{ itemID = 90079, dropRate = 585, quantity = "1"  }, -- Grimy harralander
            --{ itemID = 90084, dropRate = 744, quantity = "1"  }, -- Grimy ranarr weed
            --{ itemID = 90080, dropRate = 1024, quantity = "1"  }, -- Grimy irit leaf
            --{ itemID = 90075, dropRate = 1365, quantity = "1"  }, -- Grimy avantoe
            --{ itemID = 90081, dropRate = 1638, quantity = "1"  }, -- Grimy kwuarm
            --{ itemID = 90076, dropRate = 2048, quantity = "1"  }, -- Grimy cadantine
			--{ itemID = 90082, dropRate = 2731, quantity = "1"  }, -- Grimy lantadyme
			--{ itemID = 90077, dropRate = 2731, quantity = "1"  }, -- Grimy dwarf weed
			-- Other
			-- { itemID = 0, dropRate = 9, quantity = "1" },  -- Hammer
			-- { itemID = 0, dropRate = 26, quantity = "1" },  -- Goblin mail
			-- { itemID = 0, dropRate = 43, quantity = "1" },  -- Grapes
			-- { itemID = 0, dropRate = 64, quantity = "1" },  -- Goblin book
			-- { itemID = 0, dropRate = 64, quantity = "1" },  -- Red cape
			-- { itemID = 0, dropRate = 128, quantity = "1" },  -- Tin ore
       -- }
   -- },
    -- IMP NPC (ID: 442293)
    [442293] = {
        name = "Imp",
        drops = {
			--always
            { itemID = 90830, dropRate = 1, quantity = "1" },  -- Fiendish ashes
			--Beads
			{ itemID = 90037, dropRate = 26, quantity = "1"  }, -- Black Beads
			{ itemID = 90098, dropRate = 26, quantity = "1"  }, -- Red Beads
			{ itemID = 90108, dropRate = 26, quantity = "1"  }, -- White Beads
			{ itemID = 90032, dropRate = 26, quantity = "1"  }, -- Yellow Beads
			--Equipments
			--{ itemID = 0, dropRate = 128, quantity = "1"  }, -- Bronze bolts
			{ itemID = 90828, dropRate = 16, quantity = "1"  }, -- Blue Wizard Hat
			--Food
			{ itemID = 90068, dropRate = 26, quantity = "1"  }, -- Egg
			{ itemID = 90097, dropRate = 26, quantity = "1"  }, -- Raw Chicken
			--{ itemID = 0, dropRate = 32, quantity = "1"  }, -- Burnt Bread
			--{ itemID = 0, dropRate = 32, quantity = "1"  }, -- Burnt Meat
			{ itemID = 90050, dropRate = 64, quantity = "1"  }, -- Cabbage
			--{ itemID = 0, dropRate = 128, quantity = "1"  }, -- Bread dough
			{ itemID = 90126, dropRate = 128, quantity = "1"  }, -- Bread
			{ itemID = 90142, dropRate = 128, quantity = "1"  }, -- Cooked Meat
			--Tools
            { itemID = 90161, dropRate = 16, quantity = "1"  }, -- Hammer
			{ itemID = 90020, dropRate = 26, quantity = "1"  }, -- Tinderbox
			{ itemID = 90100, dropRate = 32, quantity = "1"  }, -- Shears
            { itemID = 90047, dropRate = 32, quantity = "1"  },  -- Bucket
			{ itemID = 90049, dropRate = 64, quantity = "1"  }, -- Bucket of water
			{ itemID = 90087, dropRate = 64, quantity = "1"  }, -- Jug
			{ itemID = 90088, dropRate = 64, quantity = "1"  }, -- Jug of water
			{ itemID = 90093, dropRate = 64, quantity = "1"  }, -- Pot
			{ itemID = 90095, dropRate = 64, quantity = "1"  }, -- Pot of flour
			--Other
			{ itemID = 90205, dropRate = 16, quantity = "1"  }, -- Ball of wool
			{ itemID = 90246, dropRate = 19, quantity = "1"  }, -- Mind Talisman
            { itemID = 90831, dropRate = 22, quantity = "1"  }, -- Ashes
			{ itemID = 90391, dropRate = 32, quantity = "1"  }, -- Clay
			--{ itemID = 0, dropRate = 32, quantity = "1"  }, -- Cadava berries
			{ itemID = 90074, dropRate = 43, quantity = "1"  }, -- Grain
			{ itemID = 90753, dropRate = 64, quantity = "1"  }, -- Chef's Hat
			--{ itemID = 0, dropRate = 64, quantity = "1"  }, -- Flyer
			--{ itemID = 0, dropRate = 128, quantity = "1"  }, -- Potion
        }
    },

    -- MAN NPC (ID: 441831)
    [441831] = {
        name = "Man",
        drops = {
            { itemID = 90039, dropRate = 1, quantity = "1"  },  -- Bones (1 in 1 = 100%)
            { itemID = 90086, dropRate = 128, quantity = "1"  },-- Iron Dagger
            { itemID = 90043, dropRate = 64, quantity = "1"  },	-- Bronze Med Helm
            { itemID = 90633, dropRate = 43, quantity = "7"  },  -- Bronze Arrows
            { itemID = 90067, dropRate = 64, quantity = "4"  },	-- Earth Runes
            { itemID = 90070, dropRate = 64, quantity = "6"  }, -- Fire Runes
            { itemID = 90090, dropRate = 64, quantity = "9"  },	-- Mind Runes
            { itemID = 90052, dropRate = 128, quantity = "2"  }, -- Chaos Runes
            { itemID = 90078, dropRate = 22, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 30, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 40, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 51, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 65, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 89, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 119, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 143, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 178, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 237, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 237, quantity = "1"  }, -- Grimy dwarf weed
			{ itemID = 90034, dropRate = 26, quantity = "1"  }, -- Fishing Bait
			{ itemID = 90024, dropRate = 64, quantity = "1"  }, -- Copper Ore
			{ itemID = 90208, dropRate = 64, quantity = "1"  }, -- Earth talisman
			{ itemID = 90050, dropRate = 128, quantity = "1"  }, -- Cabbage
        }
    },

    -- Woman NPC (ID: 441832)
    [441832] = {
        name = "Woman",
        drops = {
            { itemID = 90039, dropRate = 1, quantity = "1"  },  -- Bones (1 in 1 = 100%)
            { itemID = 90086, dropRate = 128, quantity = "1"  },-- Iron Dagger
            { itemID = 90043, dropRate = 64, quantity = "1"  },	-- Bronze Med Helm
            { itemID = 90633, dropRate = 43, quantity = "7"  },  -- Bronze Arrows
            { itemID = 90067, dropRate = 64, quantity = "4"  },	-- Earth Runes
            { itemID = 90070, dropRate = 64, quantity = "6"  }, -- Fire Runes
            { itemID = 90090, dropRate = 64, quantity = "9"  },	-- Mind Runes
            { itemID = 90052, dropRate = 128, quantity = "2"  }, -- Chaos Runes
            { itemID = 90078, dropRate = 22, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 30, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 40, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 51, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 65, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 89, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 119, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 143, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 178, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 237, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 237, quantity = "1"  }, -- Grimy dwarf weed
			{ itemID = 90034, dropRate = 26, quantity = "1"  }, -- Fishing Bait
			{ itemID = 90024, dropRate = 64, quantity = "1"  }, -- Copper Ore
			{ itemID = 90208, dropRate = 64, quantity = "1"  }, -- Earth talisman
			{ itemID = 90050, dropRate = 128, quantity = "1"  }, -- Cabbage
        }
    },
	
    -- Guard NPC (ID: 441467)
    [441467] = {
        name = "Guard",
        drops = {
            { itemID = 90039, dropRate = 1, quantity = "1"  },  -- Bones (1 in 1 = 100%)
            { itemID = 90633, dropRate = 43, quantity = "1"  },  -- Bronze Arrows
            { itemID = 90296, dropRate = 128, quantity = "1"  },  -- Steel Arrows
            { itemID = 90120, dropRate = 64, quantity = "6"  },  -- Air Runes
            { itemID = 90067, dropRate = 64, quantity = "3"  },  -- Earth Runes
            { itemID = 90070, dropRate = 64, quantity = "2"  },  -- Fire Runes
            { itemID = 90125, dropRate = 128, quantity = "1"  },  -- Blood Runes
            { itemID = 90052, dropRate = 128, quantity = "1"  },  -- Chaos Runes
            { itemID = 90091, dropRate = 128, quantity = "1"  },  -- Nature Runes
            { itemID = 90754, dropRate = 19, quantity = "4"  },  -- Potato Seeds
            { itemID = 90756, dropRate = 38, quantity = "4"  },  -- Cabbage Seeds
            { itemID = 90757, dropRate = 77, quantity = "3"  },  -- Tomato Seeds
            { itemID = 90758, dropRate = 155, quantity = "3"  },  -- Sweetcorn Seeds
            { itemID = 90074, dropRate = 128, quantity = "1"  },  -- Grain
            { itemID = 90086, dropRate = 21, quantity = "1"  },  -- Iron Dagger
            { itemID = 90822, dropRate = 43, quantity = "1"  },  -- Body Talisman
        }
    },
	
    -- Dark Wizard NPC (ID: 441174)
    [441174] = {
        name = "Dark Wizard",
        drops = {
            { itemID = 90039, dropRate = 1, quantity = "1"  },  -- Bones (1 in 1 = 100%)
            { itemID = 90067, dropRate = 32, quantity = "36"  },  -- Earth Runes
            { itemID = 90067, dropRate = 43, quantity = "10"  },  -- Earth Runes
            { itemID = 90067, dropRate = 64, quantity = "18"  },  -- Earth Runes
            { itemID = 90120, dropRate = 43, quantity = "10"  },  -- Air Runes
            { itemID = 90120, dropRate = 64, quantity = "18"  },  -- Air Runes
            { itemID = 90107, dropRate = 43, quantity = "10"  },  -- Water Runes
            { itemID = 90107, dropRate = 64, quantity = "18"  },  -- Water Runes
            { itemID = 90070, dropRate = 43, quantity = "10"  },  -- Fire Runes
            { itemID = 90070, dropRate = 64, quantity = "18"  },  -- Fire Runes
        }
    }
}

-- This file doesn't return anything; the `NPCData` table is globally accessible
