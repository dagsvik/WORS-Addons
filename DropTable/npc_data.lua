-- npc_data.lua

-- This table stores NPCs and their drop tables with item IDs and drop rates
NPCData = {
    -- SKELETON(UNARMED) NPC (ID: 441021)
    [441021] = {
        name = "Skeleton (Unarmed)",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1"  },  -- Bones (1 in 1 = 100%)
			-- Runes and Ammunition
            { itemID = 90633, dropRate = 18, quantity = "2"  },  -- Bronze Arrows
            { itemID = 90633, dropRate = 32, quantity = "5"  },  -- Bronze Arrows
            { itemID = 90257, dropRate = 32, quantity = "1"  },  -- Iron Arrows
			{ itemID = 90120, dropRate = 64, quantity = "15" },  -- Air Runes
			{ itemID = 90067, dropRate = 64, quantity = "3" },  -- Earth Runes
            { itemID = 90070, dropRate = 64, quantity = "2"  }, -- Fire Runes
			{ itemID = 90052, dropRate = 64, quantity = "3"  },  -- Chaos Runes
			{ itemID = 90091, dropRate = 128, quantity = "3" },  -- Nature Runes
            { itemID = 90296, dropRate = 128, quantity = "1"  },  -- Steel Arrow
			-- Herbs
            { itemID = 90078, dropRate = 24, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 32, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 43, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 56, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 71, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 97, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 130, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 156, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 195, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 260, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 260, quantity = "1"  }, -- Grimy dwarf weed
			-- Other
            { itemID = 90043, dropRate = 21, quantity = "1"  },-- Iron Dagger
			{ itemID = 90822, dropRate = 64, quantity = "1" },  -- Fire Talisman
			{ itemID = 90026, dropRate = 128, quantity = "1" },  -- Iron Ore
			{ itemID = 90074, dropRate = 128, quantity = "1"  }, -- Grain
        }
    },
    -- ZOMBIE(UNARMED) NPC (ID: 441009)
    [441009] = {
        name = "Zombie (Unarmed)",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1"  },  -- Bones (1 in 1 = 100%)
			-- Weapons and Armour
            { itemID = 90043, dropRate = 32, quantity = "1"  },-- Bronze Med Helm
            -- { itemID = ITEM_ID, dropRate = 128, quantity = "1"  },-- Bronze longsword
            -- { itemID = ITEM_ID, dropRate = 128, quantity = "1"  },-- Iron Axe
			-- Runes and Ammunition
            { itemID = 90257, dropRate = 18, quantity = "5"  },  -- Iron Arrows
            { itemID = 90038, dropRate = 26, quantity = "6"  },  -- Body Runes
            { itemID = 90090, dropRate = 26, quantity = "5"  },	-- Mind Runes
			{ itemID = 90120, dropRate = 32, quantity = "13" },  -- Air Runes
            { itemID = 90257, dropRate = 32, quantity = "8"  },  -- Iron Arrows
            { itemID = 90296, dropRate = 64, quantity = "5"  },  -- Steel Arrow
			{ itemID = 90091, dropRate = 128, quantity = "6" },  -- Nature Runes
			-- Herbs
            { itemID = 90078, dropRate = 20, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 27, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 36, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 47, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 60, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 82, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 109, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 131, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 164, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 218, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 218, quantity = "1"  }, -- Grimy dwarf weed
			-- Other
			{ itemID = 90034, dropRate = 3, quantity = "1"  }, -- Fishing Bait
			{ itemID = 90024, dropRate = 64, quantity = "1" },  -- Copper Ore
        }
    },
    -- HILL GIANT NPC (ID: 441615)
    [441615] = {
        name = "Hill Giant",
        drops = {
			-- Always
            { itemID = 90036, dropRate = 1, quantity = "1"  },  -- Giant Bones (1 in 1 = 100%)
			-- Weapons and Armour
            { itemID = 90189, dropRate = 26, quantity = "1"  },-- Iron Full Helm
            { itemID = 90086, dropRate = 32, quantity = "1"  },-- Iron Dagger
            { itemID = 90194, dropRate = 43, quantity = "1"  },-- Iron Kiteshield
			{ itemID = 90274, dropRate = 64, quantity = "1"  },-- Steel Longsword
			-- Runes and Ammunition
            { itemID = 90257, dropRate = 21, quantity = "3"  },  -- Iron Arrows
            { itemID = 90070, dropRate = 43, quantity = "15"  }, -- Fire Runes
			{ itemID = 90107, dropRate = 43, quantity = "7" },  -- Water Runes
			{ itemID = 90139, dropRate = 43, quantity = "2" },  -- Law Runes
            { itemID = 90296, dropRate = 64, quantity = "10"  },  -- Steel Arrows
            { itemID = 90090, dropRate = 64, quantity = "3"  },	-- Mind Runes
            { itemID = 90130, dropRate = 64, quantity = "2"  },  -- Cosmic Runes
			{ itemID = 90091, dropRate = 64, quantity = "6" },  -- Nature Runes
			{ itemID = 90052, dropRate = 128, quantity = "2"  },  -- Chaos Runes
			-- { itemID = ITEM_ID, dropRate = 128, quantity = "2"  },  -- Death Runes
			-- Herbs
            { itemID = 90078, dropRate = 73, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 97, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 130, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 167, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 213, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 293, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 390, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 468, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 585, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 780, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 780, quantity = "1"  }, -- Grimy dwarf weed
			-- Seeds
            { itemID = 90754, dropRate = 19, quantity = "4"  }, -- Potato Seeds
            { itemID = 90755, dropRate = 25, quantity = "4"  }, -- Onion Seeds
            { itemID = 90756, dropRate = 38, quantity = "4"  }, -- Cabbage Seeds
            { itemID = 90757, dropRate = 76, quantity = "3"  }, -- Tomato Seeds
            { itemID = 90758, dropRate = 155, quantity = "3"  }, -- Sweetcorn Seeds
            -- { itemID = 0, dropRate = 311, quantity = "2"  }, -- Starwbeery Seeds
			-- { itemID = 0, dropRate = 651, quantity = "2"  }, -- Watermelon Seeds
			-- { itemID = 0, dropRate = 896, quantity = "2"  }, -- Snape Grass Seeds
			-- Other
			{ itemID = 90616, dropRate = 12, quantity = "1"  }, -- Limpwurt Root
			{ itemID = 90035, dropRate = 21, quantity = "1" },  -- Beer
            { itemID = 90822, dropRate = 64, quantity = "1"  },  -- Body Talisman
            -- { itemID = ITEM_ID, dropRate = 128, quantity = "1"  },  -- Giant Key
        }
    },
    -- HOBGOBLIN NPC (ID: 441851)
    [441851] = {
        name = "Hobgoblin",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1"  },  -- Bones (1 in 1 = 100%)
			-- Weapons and Armour
            -- { itemID = ITEM_ID, dropRate = 43, quantity = "1"  },-- Bronze Spear
            { itemID = 90086, dropRate = 43, quantity = "1"  },-- Iron Dagger
            { itemID = 90267, dropRate = 43, quantity = "1"  },-- Steel Dagger
            -- { itemID = ITEM_ID, dropRate = 64, quantity = "1"  },-- Iron Spear
            -- { itemID = ITEM_ID, dropRate = 64, quantity = "1"  },-- Steel Spear
			{ itemID = 90274, dropRate = 64, quantity = "1"  },-- Steel Longsword
			-- Runes
			{ itemID = 90139, dropRate = 43, quantity = "2" },  -- Law Runes
			{ itemID = 90107, dropRate = 64, quantity = "2" },  -- Water Runes
            { itemID = 90070, dropRate = 64, quantity = "7"  }, -- Fire Runes
            { itemID = 90038, dropRate = 64, quantity = "6"  },  -- Body Runes
			{ itemID = 90052, dropRate = 64, quantity = "3"  },  -- Chaos Runes
			{ itemID = 90091, dropRate = 64, quantity = "4" },  -- Nature Runes
            { itemID = 90130, dropRate = 128, quantity = "2"  },  -- Cosmic Runes
			-- Herbs
            { itemID = 90078, dropRate = 73, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 97, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 130, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 167, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 213, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 293, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 390, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 468, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 585, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 780, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 780, quantity = "1"  }, -- Grimy dwarf weed
			-- Seeds
            { itemID = 90754, dropRate = 19, quantity = "4"  }, -- Potato Seeds
            { itemID = 90755, dropRate = 25, quantity = "4"  }, -- Onion Seeds
            { itemID = 90756, dropRate = 38, quantity = "4"  }, -- Cabbage Seeds
            { itemID = 90757, dropRate = 76, quantity = "3"  }, -- Tomato Seeds
            { itemID = 90758, dropRate = 155, quantity = "3"  }, -- Sweetcorn Seeds
            --{ itemID = 0, dropRate = 311, quantity = "2"  }, -- Starwbeery Seeds
			--{ itemID = 0, dropRate = 651, quantity = "2"  }, -- Watermelon Seeds
			--{ itemID = 0, dropRate = 896, quantity = "2"  }, -- Snape Grass Seeds
			-- Other
			{ itemID = 90616, dropRate = 6, quantity = "1"  }, -- Limpwurt Root
			{ itemID = 90073, dropRate = 26, quantity = "1"  }, -- Goblin Mail
			--{ itemID = 0, dropRate = 6, quantity = "1"  }, -- Trading Sticks???
        }
    },
    -- THIEF NPC (ID: 441457)
    [441457] = {
        name = "Thief",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1"  },  -- Bones (1 in 1 = 100%)
			-- Weapons and Armour
            { itemID = 90086, dropRate = 64, quantity = "1"  },-- Iron Dagger
            { itemID = 90043, dropRate = 128, quantity = "1"  },-- Bronze Med Helm
			-- Runes and Ammunition
            --{ itemID = ITEMID, dropRate = 6, quantity = "2-12"  },  -- Bronze Bolts
            { itemID = 90633, dropRate = 43, quantity = "7"  },  -- Bronze Arrows
			{ itemID = 90067, dropRate = 64, quantity = "4" },  -- Earth Runes
            { itemID = 90070, dropRate = 64, quantity = "6"  }, -- Fire Runes
            { itemID = 90090, dropRate = 64, quantity = "9"  },	-- Mind Runes
			{ itemID = 90052, dropRate = 128, quantity = "2"  },  -- Chaos Runes
			-- Herbs
            { itemID = 90078, dropRate = 22, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 30, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 40, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 51, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 65, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 89, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 119, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 142, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 178, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 237, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 237, quantity = "1"  }, -- Grimy dwarf weed
			-- Other
            { itemID = 90034, dropRate = 26, quantity = "1"  }, -- Fishing Bait
			{ itemID = 90024, dropRate = 64, quantity = "1" },  -- Copper Ore
			{ itemID = 90208, dropRate = 64, quantity = "1" },  -- Earth Talisman
			{ itemID = 90050, dropRate = 128, quantity = "1"  }, -- Cabbage
        }
    },
    -- BLACK GUARD NPC (ID: 441451)
    [441451] = {
        name = "Black Guard lv.25 (WIP)",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
			-- Weapon and Armour
			{ itemID = 90044, dropRate = 10, quantity = "1" },  -- Bronze Pickaxe
			{ itemID = 90043, dropRate = 32, quantity = "1" },  -- Bronze Med Helm
			{ itemID = 90171, dropRate = 64, quantity = "1" },  -- Bronze Battleaxe
			{ itemID = 90085, dropRate = 128, quantity = "1" },  -- Iron Battleaxe
			-- Runes and Ammunition
			-- { itemID = ITEMID, dropRate = 19, quantity = "2-12" },  -- Bronze Bolts
			{ itemID = 90052, dropRate = 32, quantity = "2" },  -- Chaos Runes
			{ itemID = 90091, dropRate = 32, quantity = "2" },  -- Nature Runes
			-- Other
			{ itemID = 90161, dropRate = 13, quantity = "1" },  -- Hammer
			{ itemID = 90153, dropRate = 18, quantity = "1" },  -- Bronze Bar
			{ itemID = 90026, dropRate = 32, quantity = "1" },  -- Iron Ore
			{ itemID = 90030, dropRate = 43, quantity = "1" },  -- Tin Ore
			{ itemID = 90024, dropRate = 43, quantity = "1" },  -- Copper Ore
			{ itemID = 90155, dropRate = 43, quantity = "1" },  -- Iron Bar
			{ itemID = 90023, dropRate = 64, quantity = "1" },  -- Coal
        }
    },
    -- DWARF NPC (ID: 441089)
    [441089] = {
        name = "Dwarf",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
			-- Weapon and Armour
			{ itemID = 90044, dropRate = 10, quantity = "1" },  -- Bronze Pickaxe
			{ itemID = 90043, dropRate = 32, quantity = "1" },  -- Bronze Med Helm
			{ itemID = 90171, dropRate = 64, quantity = "1" },  -- Bronze Battleaxe
			{ itemID = 90085, dropRate = 128, quantity = "1" },  -- Iron Battleaxe
			-- Runes and Ammunition
			-- { itemID = ITEMID, dropRate = 19, quantity = "2-12" },  -- Bronze Bolts
			{ itemID = 90052, dropRate = 32, quantity = "2" },  -- Chaos Runes
			{ itemID = 90091, dropRate = 32, quantity = "2" },  -- Nature Runes
			-- Other
			{ itemID = 90161, dropRate = 13, quantity = "1" },  -- Hammer
			{ itemID = 90153, dropRate = 18, quantity = "1" },  -- Bronze Bar
			{ itemID = 90026, dropRate = 32, quantity = "1" },  -- Iron Ore
			{ itemID = 90030, dropRate = 43, quantity = "1" },  -- Tin Ore
			{ itemID = 90024, dropRate = 43, quantity = "1" },  -- Copper Ore
			{ itemID = 90155, dropRate = 43, quantity = "1" },  -- Iron Bar
			{ itemID = 90023, dropRate = 64, quantity = "1" },  -- Coal
			
        }
    },
    -- AIR WIZARD NPC (ID: 441472)
    [441472] = {
        name = "Air Wizard",
        drops = {
			-- Always
            { itemID = 90831, dropRate = 1, quantity = "1" },  -- Ashes
			-- Runes
			{ itemID = 90120, dropRate = 1.053, quantity = "5-10" },  -- Air Runes
			-- Other
			{ itemID = 90105, dropRate = 20, quantity = "1" },  -- Air Talisman
        }
    },
    -- EARTH WIZARD NPC (ID: 441469)
    [441471] = {
        name = "Earth Wizard",
        drops = {
			-- Always
            { itemID = 90831, dropRate = 1, quantity = "1" },  -- Ashes
			-- Runes
			{ itemID = 90067, dropRate = 1.053, quantity = "5-10" },  -- Earth Runes
			-- Other
			{ itemID = 90208, dropRate = 20, quantity = "1" },  -- Earth Talisman
        }
    },
    -- FIRE WIZARD NPC (ID: 441469)
    [441469] = {
        name = "Fire Wizard",
        drops = {
			-- Always
            { itemID = 90831, dropRate = 1, quantity = "1" },  -- Ashes
			-- Runes
			{ itemID = 90070, dropRate = 1.053, quantity = "5-10" },  -- Fire Runes
			-- Other
			{ itemID = 90822, dropRate = 20, quantity = "1" },  -- Fire Talisman
        }
    },
    -- WATER WIZARD NPC (ID: 441470)
    [441470] = {
        name = "Water Wizard",
        drops = {
			-- Always
            { itemID = 90831, dropRate = 1, quantity = "1" },  -- Ashes
			-- Runes
			{ itemID = 90107, dropRate = 1.053, quantity = "5-10" },  -- Water Runes
			-- Other
			{ itemID = 90260, dropRate = 20, quantity = "1" },  -- Water Talisman
        }
    },
    -- HIGHWAYMAN NPC (ID: 441180)
    [441180] = {
        name = "Highwayman",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
            { itemID = 91072, dropRate = 1, quantity = "1" },  -- Black Cape
			-- { itemID = 0, dropRate = 20, quantity = "2-12" },  -- Iron Bolts
        }
    },
    -- GARDENER NPC (ID: 441952)
    [441952] = {
        name = "Gardener",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
        }
    },
    -- HERO NPC (ID: 441965)
    [441965] = {
        name = "Hero",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
        }
    },
    -- WHITE KNIGHT NPC (ID: 441562)
    [441562] = {
        name = "White Knight",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
			-- Weapons and armour
            { itemID = 90271, dropRate = 64, quantity = "1" },  -- Steel Sword
            { itemID = 90274, dropRate = 128, quantity = "1" },  -- Steel Longsword
            { itemID = 90269, dropRate = 128, quantity = "1" },  -- Steel Med Helm
			-- Runes
            { itemID = 90090, dropRate = 12, quantity = "5"  },	-- Mind Runes
            { itemID = 90091, dropRate = 32, quantity = "4"  },  -- Nature Runes
            { itemID = 90038, dropRate = 43, quantity = "9-13"  },  -- Body Runes
			{ itemID = 90052, dropRate = 43, quantity = "2"  },  -- Chaos Runes
			{ itemID = 90107, dropRate = 43, quantity = "25-30" },  -- Water Runes
			{ itemID = 90328, dropRate = 64, quantity = "5" },  -- Mithril Arrows
			{ itemID = 90359, dropRate = 128, quantity = "2" },  -- Adamant Arrows
			{ itemID = 90125, dropRate = 128, quantity = "2" },  -- Blood Runes
			{ itemID = 90139, dropRate = 128, quantity = "2" },  -- Law Runes
			-- Herbs
            { itemID = 90078, dropRate = 102, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 136, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 182, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 234, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 298, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 410, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 546, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 655, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 819, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 1092, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 1092, quantity = "1"  }, -- Grimy dwarf weed
        }
    },
    -- PALADIN NPC (ID: 441963)
    [441963] = {
        name = "Paladin",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
			-- Weapons and armour
            { itemID = 90271, dropRate = 64, quantity = "1" },  -- Steel Sword
            { itemID = 90274, dropRate = 128, quantity = "1" },  -- Steel Longsword
            { itemID = 90275, dropRate = 128, quantity = "1" },  -- Steel Full Helm
			-- Runes
			{ itemID = 90107, dropRate = 10, quantity = "30" },  -- Water Runes
			{ itemID = 90125, dropRate = 128, quantity = "1" },  -- Blood Runes
			-- Materials
            { itemID = 90155, dropRate = 15, quantity = "1" },  -- Iron Bar
            { itemID = 90156, dropRate = 128, quantity = "1" },  -- Mithril Bar
            { itemID = 90154, dropRate = 128, quantity = "1" },  -- Steel Bar
			-- Herbs
            { itemID = 90078, dropRate = 64, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 85, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 114, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 146, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 186, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 256, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 341, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 410, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 512, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 683, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 683, quantity = "1"  }, -- Grimy dwarf weed
        }
    },
    -- KNIGHT OF FALADOR NPC (ID: 443100)
    [443100] = {
        name = "Knight of Falador/Ardougne",
        drops = {
			-- NO DROPS
        }
    },
    -- SEAGULL NPC (ID: 441432)
    [441432] = {
        name = "Seagull",
        drops = {
			-- Empty
        }
    },
    -- KING SCORPION NPC (ID: 441844)
    [441844] = {
        name = "King Scorpion",
        drops = {
			-- Empty
        }
    },
    -- SCORPION NPC (ID: 441841)
    [441841] = {
        name = "Scorpion",
        drops = {
			-- Empty
        }
    },
    -- MONK NPC (ID: 441741)
    [441741] = {
        name = "Monk",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
        }
    },
    -- FARMER NPC (ID: 441879)
    [441879] = {
        name = "Farmer",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
			-- Weapons and armour
            { itemID = 90043, dropRate = 64, quantity = "1"  },	-- Bronze Med Helm
            { itemID = 90086, dropRate = 128, quantity = "1"  },-- Iron Dagger
			-- Runes and ammunition
            { itemID = 90633, dropRate = 43, quantity = "7"  },  -- Bronze Arrows
			{ itemID = 90067, dropRate = 64, quantity = "4" },  -- Earth Runes
            { itemID = 90070, dropRate = 64, quantity = "6"  }, -- Fire Runes
            { itemID = 90090, dropRate = 64, quantity = "9"  },	-- Mind Runes
			{ itemID = 90052, dropRate = 128, quantity = "2"  },  -- Chaos Runes
			-- Talismans
			{ itemID = 90246, dropRate = 32, quantity = "1-5" },  -- Mind Talisman
			{ itemID = 90260, dropRate = 43, quantity = "2" },  -- Water Talisman
			-- Herbs
            { itemID = 90078, dropRate = 46, quantity = "1"  }, -- Grimy guam leaf
            { itemID = 90083, dropRate = 62, quantity = "1"  }, -- Grimy marrentill
            { itemID = 90207, dropRate = 82, quantity = "1"  }, -- Grimy Tarromin
            { itemID = 90079, dropRate = 106, quantity = "1"  }, -- Grimy harralander
            { itemID = 90084, dropRate = 135, quantity = "1"  }, -- Grimy ranarr weed
            { itemID = 90080, dropRate = 186, quantity = "1"  }, -- Grimy irit leaf
            { itemID = 90075, dropRate = 248, quantity = "1"  }, -- Grimy avantoe
            { itemID = 90081, dropRate = 298, quantity = "1"  }, -- Grimy kwuarm
            { itemID = 90076, dropRate = 372, quantity = "1"  }, -- Grimy cadantine
			{ itemID = 90082, dropRate = 496, quantity = "1"  }, -- Grimy lantadyme
			{ itemID = 90077, dropRate = 496, quantity = "1"  }, -- Grimy dwarf weed
			-- Seeds
            { itemID = 90754, dropRate = 10, quantity = "1-4"  }, -- Potato Seeds
            { itemID = 90755, dropRate = 10, quantity = "1-3"  }, -- Onion Seeds
            { itemID = 90756, dropRate = 38, quantity = "1-3"  }, -- Cabbage Seeds
            { itemID = 90757, dropRate = 76, quantity = "1-2"  }, -- Tomato Seeds
            { itemID = 90758, dropRate = 152, quantity = "1-2"  }, -- Sweetcorn Seeds
            --{ itemID = 0, dropRate = 303, quantity = "1"  }, -- Starwbeery Seeds
			--{ itemID = 0, dropRate = 607, quantity = "1"  }, -- Watermelon Seeds
			--{ itemID = 0, dropRate = 607, quantity = "1-3"  }, -- Snape Grass Seeds
			-- Other
            { itemID = 90034, dropRate = 26, quantity = "1"  }, -- Fishing Bait
            --{ itemID = 0, dropRate = 43, quantity = "1"  }, -- Rake
            { itemID = 90208, dropRate = 64, quantity = "1"  }, -- Earth Talisman
            --{ itemID = 0, dropRate = 64, quantity = "1"  }, -- Gardening Boots
            --{ itemID = 0, dropRate = 64, quantity = "1"  }, -- Seed Dibber
            { itemID = 90818, dropRate = 128, quantity = "1"  }, -- Secateurs
			--{ itemID = 0, dropRate = 128, quantity = "1"  }, -- Watering Can
        }
    },
    -- WIZARDs NPC (ID: 441938)
    [441938] = {
        name = "Wizard",
        drops = {
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
			-- Weapons and armour
			{ itemID = 90824, dropRate = 16, quantity = "1"  },  -- Staff 
			{ itemID = 90827, dropRate = 19, quantity = "1"  },  -- Blue Wizard Robe 
			{ itemID = 90828, dropRate = 43, quantity = "1"  },  -- Blue Wizard Hat
			-- Runes
			{ itemID = 90052, dropRate = 16, quantity = "2"  },  -- Chaos Runes
            { itemID = 90091, dropRate = 16, quantity = "2"  },  -- Nature Runes
            { itemID = 90120, dropRate = 43, quantity = "5"  },  -- Air Runes
            { itemID = 90120, dropRate = 64, quantity = "12"  },  -- Air Runes
            { itemID = 90038, dropRate = 43, quantity = "5"  },  -- Body Runes
            { itemID = 90038, dropRate = 64, quantity = "12"  },  -- Body Runes
			{ itemID = 90067, dropRate = 43, quantity = "5" },  -- Earth Runes
			{ itemID = 90067, dropRate = 64, quantity = "12" },  -- Earth Runes
            { itemID = 90070, dropRate = 43, quantity = "5"  }, -- Fire Runes
            { itemID = 90070, dropRate = 64, quantity = "12"  }, -- Fire Runes
            { itemID = 90090, dropRate = 43, quantity = "5"  },	-- Mind Runes
            { itemID = 90090, dropRate = 64, quantity = "12"  },	-- Mind Runes
			{ itemID = 90107, dropRate = 32, quantity = "5" },  -- Water Runes
			{ itemID = 90107, dropRate = 64, quantity = "12" },  -- Water Runes
			{ itemID = 90125, dropRate = 128, quantity = "2" },  -- Blood Runes
			{ itemID = 90139, dropRate = 128, quantity = "2" },  -- Law Runes
			-- Talismans
			{ itemID = 90246, dropRate = 32, quantity = "1-5" },  -- Mind Talisman
			{ itemID = 90260, dropRate = 43, quantity = "2" },  -- Water Talisman
        }
    },
    -- ICEFIEND NPC (ID: 442268)
    [442268] = {
        name = "Icefiend",
        drops = {
			-- Runes
			{ itemID = 90107, dropRate = 32, quantity = "1-5" },  -- Water Runes
            { itemID = 90120, dropRate = 1280, quantity = "1-5"  },  -- Air Runes
        }
    },
    -- GIANT SPIDER NPC (ID: 441834)
    [441834] = {
        name = "Giant Spider",
        drops = {
			-- No droptable
        }
    },
    -- FORTRESS GUARD NPC (ID: 442266)
    [442266] = {
        name = "Fortress Guard",
        drops = {
			-- always -- Suppose to drop in OSRS wiki, but none in WORS so far
            --{ itemID = 90039, dropRate = 0, quantity = "1" },  -- Bones
        }
    },
    -- White Wolf NPC (ID: 441036)
    [441036] = {
        name = "White Wolf",
        drops = {
			-- always
            { itemID = 90724, dropRate = 1, quantity = "1" },  -- Wolf Bones
        }
    },
    -- Black Bear NPC (ID: 441791)
    [441791] = {
        name = "Black Bear",
        drops = {
			-- always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
            { itemID = 90832, dropRate = 1, quantity = "1" },  -- Bear Fur
            { itemID = 90821, dropRate = 1, quantity = "1" },  -- Raw Bear Meat
        }
    },
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
    -- BAT NPC (ID: 443296)
    [443296] = {
        name = "Bat",
        drops = {
			-- always
            { itemID = 90726, dropRate = 1, quantity = "1" },  -- Bat Bones
        }
    },
    -- GUARD DOG NPC (ID: 441041)
    [441041] = {
        name = "Guard Dog",
        drops = {
			-- always
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
    -- Barbarian NPC (ID: 441861)
    [441861] = {
        name = "Barbarian",
        drops = {
			-- always
            { itemID = 90039, dropRate = 1, quantity = "1" },  -- Bones
			-- Weapons and armour
			-- { itemID = 90009, dropRate = 22, quantity = "1" },  -- Bronze Axe -- OSRS drop.
			{ itemID = 90011, dropRate = 22, quantity = "1" },  -- Iron Axe
			{ itemID = 90171, dropRate = 22, quantity = "1" },  -- Bronze Battleaxe
			-- { itemID = 90824, dropRate = 32, quantity = "1"  },  -- Staff -- not 100% sure, its in OSRS
			{ itemID = 90181, dropRate = 128, quantity = "1" },  -- Iron Mace
			-- Runes and ammunition
            { itemID = 90257, dropRate = 43, quantity = "10"  },  -- Iron Arrows
			{ itemID = 90052, dropRate = 43, quantity = "2" },  -- chaos runes
            -- { itemID = 90633, dropRate = 43, quantity = "15"  },  -- Bronze Arrows -- OSRS drop.
			{ itemID = 90067, dropRate = 43, quantity = "2" },  -- Earth Runes
            { itemID = 90070, dropRate = 64, quantity = "5"  }, -- Fire Runes
            { itemID = 90090, dropRate = 64, quantity = "5"  },	-- Mind Runes
            { itemID = 90139, dropRate = 128, quantity = "2"  },  -- Law Runes
			-- Other
			{ itemID = 90030, dropRate = 128, quantity = "1" },  -- Tin Ore
			{ itemID = 90832, dropRate = 128, quantity = "1" },  -- Bear Fur
			{ itemID = 90035, dropRate = 64, quantity = "1" },  -- Beer
			{ itemID = 90142, dropRate = 128, quantity = "1" },  -- Cooked Meat
			-- { itemID = 0, dropRate = 128, quantity = "1" },  -- Flyer -- OSRS drop.
			-- { itemID = 0, dropRate = 128, quantity = "1" },  -- Ring Mould -- OSRS drop.
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
			{ itemID = 90105, dropRate = 128, quantity = "1" },  -- Air Talisman
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
			-- Always
            { itemID = 90039, dropRate = 1, quantity = "1"  },  -- Bones (1 in 1 = 100%)
			-- Equipments
			{ itemID = 90987, dropRate = 32, quantity = "1"  },  -- Wizard Hat
			{ itemID = 90826, dropRate = 32, quantity = "1"  },  -- Black Robe
			{ itemID = 90824, dropRate = 32, quantity = "1"  },  -- Staff
			-- Elemental runes
            { itemID = 90067, dropRate = 32, quantity = "36"  },  -- Earth Runes
            { itemID = 90067, dropRate = 43, quantity = "10"  },  -- Earth Runes
            { itemID = 90067, dropRate = 64, quantity = "18"  },  -- Earth Runes
            { itemID = 90120, dropRate = 43, quantity = "10"  },  -- Air Runes
            { itemID = 90120, dropRate = 64, quantity = "18"  },  -- Air Runes
            { itemID = 90107, dropRate = 43, quantity = "10"  },  -- Water Runes
            { itemID = 90107, dropRate = 64, quantity = "18"  },  -- Water Runes
            { itemID = 90070, dropRate = 43, quantity = "10"  },  -- Fire Runes
            { itemID = 90070, dropRate = 64, quantity = "18"  },  -- Fire Runes
			-- Catalytic runes
            { itemID = 90091, dropRate = 18, quantity = "4"  },  -- Nature Runes
            { itemID = 90052, dropRate = 21, quantity = "5"  },  -- Chaos Runes
            { itemID = 90090, dropRate = 43, quantity = "10"  },  -- Mind Runes
            { itemID = 90090, dropRate = 64, quantity = "18"  },  -- Mind Runes
            { itemID = 90038, dropRate = 43, quantity = "10"  },  -- Body Runes
            { itemID = 90038, dropRate = 64, quantity = "18"  },  -- Body Runes
            { itemID = 90125, dropRate = 64, quantity = "2"  },  -- Blood Runes
            { itemID = 90130, dropRate = 128, quantity = "2"  },  -- Cosmic Runes
            { itemID = 90139, dropRate = 128, quantity = "3"  },  -- Law Runes
            -- Other
            { itemID = 90260, dropRate = 128, quantity = "1"  },  -- Water talisman
            { itemID = 90822, dropRate = 128, quantity = "1"  },  -- Fire talisman
        }
    }
}

-- This file doesn't return anything; the `NPCData` table is globally accessible
