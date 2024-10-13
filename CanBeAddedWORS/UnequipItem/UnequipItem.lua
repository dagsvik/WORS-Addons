-- Function to unequip an item from a slot
local function UnequipItem(slotID)
    -- Check if the slot is equipped with an item
    if GetInventoryItemID("player", slotID) then
        -- Pickup the item and place it in the bags (unequip it)
        PickupInventoryItem(slotID)
        PutItemInBackpack()
    end
end

-- List of slot identifiers (names used in the game engine)
local slotNames = {
    "HeadSlot",
    "NeckSlot",
    "ShoulderSlot",
    "BackSlot",
    "ChestSlot",
    "ShirtSlot",
    "TabardSlot",
    "WristSlot",
    "HandsSlot",
    "WaistSlot",
    "LegsSlot",
    "FeetSlot",
    "Finger0Slot",
    "Finger1Slot",
    "Trinket0Slot",
    "Trinket1Slot",
    "MainHandSlot",
    "SecondaryHandSlot",
    "RangedSlot",
    "AmmoSlot"
}

-- Hook right-click on each slot to unequip
local function HookUnequipEvents()
    for _, slotID in ipairs(slotNames) do
        -- Dynamically create the full frame name (e.g., AscensionCharacterHeadSlot)
        local slotFrameName = "AscensionCharacter" .. slotID
        local slot = _G[slotFrameName]

        if slot then
            -- Register for right-click
            slot:RegisterForClicks("RightButtonUp")
            -- Set right-click handler to unequip item
            slot:SetScript("OnClick", function(self, button)
                if button == "RightButton" then
                    local actualSlotID = GetInventorySlotInfo(slotID)
                    UnequipItem(actualSlotID)
                end
            end)
        end
    end
end

-- Hook the AscensionCharacterFrame's OnShow event to ensure the hooks are always set
AscensionCharacterFrame:HookScript("OnShow", function()
    HookUnequipEvents()
end)
