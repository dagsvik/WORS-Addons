-- Function to transform NPCData into ITEMData without duplicate npcNames and omitting dropRate/quantity
local function CreateItemDataFromNPCData(NPCData)
    local ITEMData = {}

    -- Iterate over each NPC in NPCData
    for npcID, npcInfo in pairs(NPCData) do
        local npcName = npcInfo.name
        local npcDrops = npcInfo.drops

        -- Iterate over each drop for the current NPC
        for _, drop in ipairs(npcDrops) do
            local itemID = drop.itemID

            -- If the itemID doesn't exist in ITEMData, create a new table for it
            if not ITEMData[itemID] then
                ITEMData[itemID] = {}
            end

            -- Ensure the NPC is not already listed for this item
            local alreadyListed = false
            for _, listedNPC in ipairs(ITEMData[itemID]) do
                if listedNPC == npcName then
                    alreadyListed = true
                    break
                end
            end

            -- Add this NPC's name to the item entry if not already listed
            if not alreadyListed then
                table.insert(ITEMData[itemID], {
                    npcID = npcID,
                    npcName = npcName
                })
            end
        end
    end

    return ITEMData
end

-- Example usage:
ITEMData = CreateItemDataFromNPCData(NPCData)

-- Now, ITEMData will look like this:
-- ITEMData[itemID] = {
--     {npcID = 441132, npcName = "Jelly"},
--     {npcID = 441109, npcName = "Kurask"},
--     ...
-- }