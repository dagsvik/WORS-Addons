-- Main.lua

-- main.lua

-- Example usage of the NPCData table
local npcID = 442293
local npcDrops = NPCData[npcID]




-- Create the main UI frame
local function CreateNPCListFrame()
    -- Create the main frame
    local frame = CreateFrame("Frame", "NPCListFrame", UIParent)
    frame:SetSize(600, 400)  -- Increase width to make space for the item list on the left
    frame:SetPoint("CENTER", UIParent, "CENTER")

    -- Set background and borders manually
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",  -- Background texture
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",    -- Border texture
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    frame:SetBackdropColor(0, 0, 0, 1)  -- Black background

    -- Set the title of the frame
    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.title:SetPoint("TOP", frame, "TOP", 0, -10)
    frame.title:SetText("NPC List")

    -- Create the input box for filtering NPCs
    local inputBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    inputBox:SetSize(250, 20)
    inputBox:SetPoint("TOP", frame, "TOP", 140, -40)
    inputBox:SetAutoFocus(false)
    inputBox:SetScript("OnTextChanged", function(self)
        local text = self:GetText():lower()
        UpdateNPCList(text)
    end)

    -- Scrollable area for NPCs
    local npcScrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    npcScrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 290, -70)
    npcScrollFrame:SetSize(260, 300)

    -- Create a container for the scrollable content (NPC List)
    local npcContent = CreateFrame("Frame", nil, npcScrollFrame)
    npcContent:SetSize(260, 300)
    npcScrollFrame:SetScrollChild(npcContent)

    -- Create the list for NPC entries
    local npcList = {}

    -- Create a container for the items to the left of the NPC list
    local itemScrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    itemScrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -70)
    itemScrollFrame:SetSize(220, 300)

    local itemContent = CreateFrame("Frame", nil, itemScrollFrame)
    itemContent:SetSize(220, 300)
    itemScrollFrame:SetScrollChild(itemContent)

    local itemList = {}  -- List of items to display when NPC is clicked

    -- Function to clear the item list
    local function ClearItemList()
        for _, button in ipairs(itemList) do
            button:Hide()
        end
    end

    -- Function to populate the item list when an NPC is clicked
    local function PopulateItemList(npcID)
        -- Clear the current item list
        ClearItemList()

        -- Get the NPC's drop data
        local npcDrops = NPCData[npcID]
        if not npcDrops or not npcDrops.drops then return end

        -- Populate the item list
        for index, drop in ipairs(npcDrops.drops) do
            local itemID = drop.itemID
            local itemDropRate = drop.dropRate
            local itemQuantity = drop.quantity or "1"  -- Default to "1" if quantity is not specified
            local itemName, itemLink, _, _, _, _, _, _, _, itemIcon = GetItemInfo(itemID)

            local itemButton = itemList[index]
            if not itemButton then
                itemButton = CreateFrame("Button", nil, itemContent)
                itemButton:SetSize(240, 70)  -- Increased height to allow space for quantity
                itemButton:SetPoint("TOPLEFT", itemContent, "TOPLEFT", 0, -((index - 1) * 75))

                -- Create item icon
                itemButton.icon = itemButton:CreateTexture(nil, "BACKGROUND")
                itemButton.icon:SetSize(32, 32)
                itemButton.icon:SetPoint("LEFT", itemButton, "LEFT", 4, 0)

                -- Create item text (name)
                itemButton.text = itemButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                itemButton.text:SetPoint("LEFT", itemButton.icon, "RIGHT", 10, 15)

                -- Create quantity text (below item name)
                itemButton.quantityText = itemButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                itemButton.quantityText:SetPoint("LEFT", itemButton.icon, "RIGHT", 10, 0)

                -- Create drop rate text (below quantity)
                itemButton.dropRateText = itemButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                itemButton.dropRateText:SetPoint("LEFT", itemButton.icon, "RIGHT", 10, -15)

                -- Add the itemButton to itemList
                itemList[index] = itemButton
            end

            -- Update the icon, name, quantity, and drop rate
            if itemIcon then
                itemButton.icon:SetTexture(itemIcon)
            end

            if itemName then
                itemButton.text:SetText(itemLink)  -- Shows item link
            end

            -- Display the quantity (e.g., "Quantity: 1-2")
            if itemQuantity then
                itemButton.quantityText:SetText("Quantity: " .. itemQuantity)
            end

            -- Display the drop rate (e.g., "1 in 5" or "20%")
            if itemDropRate then
                local dropPercentage = (1 / itemDropRate) * 100
                itemButton.dropRateText:SetText(string.format("Drop Rate: %.2f%% (1 in %d)", dropPercentage, itemDropRate))
            end

            -- Show the button
            itemButton:Show()
        end

        -- Adjust the height of the item content based on the number of items
        local totalHeight = #npcDrops.drops * 75
        itemContent:SetHeight(math.max(totalHeight, 300))
    end



    -- Function to populate the NPC list dynamically from NPCData
    local function PopulateNPCList(filteredText)
        for _, button in ipairs(npcList) do
            button:Hide()  -- Hide all previous buttons before repopulating
        end

        local index = 0
        for npcID, data in pairs(NPCData) do
            local npcName = data.name  -- Replace with actual method to fetch NPC name in-game

            -- Filter by input if necessary
            if not filteredText or npcName:lower():find(filteredText) then
                index = index + 1
                local npcButton = npcList[index]

                -- Create the button if it doesn't exist
                if not npcButton then
                    npcButton = CreateFrame("Button", nil, npcContent)
                    npcButton:SetSize(240, 20)
                    npcButton:SetPoint("TOPLEFT", npcContent, "TOPLEFT", 0, -((index - 1) * 25))

                    -- Create hover effect
                    npcButton:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

                    -- Create a font string for the NPC name
                    npcButton.text = npcButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                    npcButton.text:SetPoint("LEFT", npcButton, "LEFT", 5, 0)

                    -- Add button to the npcList
                    npcList[index] = npcButton
                end

                -- Update the NPC button text and show it
                npcButton.text:SetText(npcName)
                npcButton.npcID = npcID  -- Store the NPC's ID in the button

                -- Set click handler for NPC button (updates the item list)
                npcButton:SetScript("OnClick", function()
                    PopulateItemList(npcButton.npcID)  -- Use the stored npcID to populate the item list
                end)

                npcButton:Show()
            end
        end

        -- Adjust content height based on number of NPCs
        local totalHeight = index * 25
        npcContent:SetHeight(math.max(totalHeight, 300))
    end


    -- Function to update NPC list based on filter
    function UpdateNPCList(filterText)
        PopulateNPCList(filterText)
    end

    -- Initial population of the NPC list
    PopulateNPCList(nil)

    return frame
end

-- Function to simulate retrieving NPC names (replace with actual in-game method)
function GetNPCName(npcID)
    local npcNames = {
        [442293] = "Imp",
        [441831] = "Man",
        [441832] = "Woman"
    }
    return npcNames[npcID] or "Unknown NPC"
end




-- Function to create the minimap button
local function CreateMinimapButton()
    local minimapButton = CreateFrame("Button", "NPCListMinimapButton", MinimapCluster)  -- Attach to UIParent (center of screen)
    minimapButton:SetSize(32, 32)  -- Size of the minimap button

    -- Ensure the button is visible by setting frame strata and level
    minimapButton:SetFrameStrata("HIGH")
    minimapButton:SetFrameLevel(10)
    --[vignetteloot] = {32, 32, 0.55957, 0.59082, 0.730469, 0.761719, false, false},
    -- Set default WoW button textures for visibility
    --minimapButton:SetNormalTexture(vignetteloot)
    -- Create and set the normal texture
    local normalTexture = minimapButton:CreateTexture(nil, "BACKGROUND")
    normalTexture:SetTexture("Interface\\minimap\\objecticonsatlas")  -- Set the base texture
    normalTexture:SetTexCoord(0.55957, 0.59082, 0.730469, 0.761719)  -- Set the texture coordinates
    normalTexture:SetAllPoints(minimapButton)  -- Fit the texture to the button size
    minimapButton:SetNormalTexture(normalTexture)  -- Apply the texture to the button


    minimapButton:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
    --minimapButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")

    -- Set the button position in the center of the screen
    minimapButton:SetPoint("TOPLEFT", MinimapCluster, "TOPLEFT", 20, -20)

    -- Button click handler to show/hide the frame
    minimapButton:SetScript("OnClick", function()
        if NPCListFrame:IsShown() then
            NPCListFrame:Hide()
        else
            NPCListFrame:Show()
        end
    end)

    -- Make the button draggable for testing purposes
    minimapButton:SetMovable(true)
    minimapButton:SetScript("OnMouseDown", function(self)
        self:StartMoving()
    end)
    minimapButton:SetScript("OnMouseUp", function(self)
        self:StopMovingOrSizing()
    end)
    NPCListFrame:Hide()

    return minimapButton
end



-- Create the NPC list frame on player login
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    local npcFrame = CreateNPCListFrame()
    npcFrame:Show()  -- Show the NPC frame when the player logs in
    local minimapButton = CreateMinimapButton()
end)