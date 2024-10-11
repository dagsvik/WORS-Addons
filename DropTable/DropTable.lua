-- Main.lua

-- main.lua

-- Example usage of the NPCData table
local npcID = 442293
local npcDrops = NPCData[npcID]

-- Used for saving items to Querie
local ItemQueue={};

--query and display an item that matches <id>
local function queryItem(id)
	SetItemRef(format('item:%d', (id)))
    ItemRefTooltip:Hide()
end

-- Function to query all itemIDs in the NPCData table
local function QueryAllItemIDs()
    for npcID, npcData in pairs(NPCData) do
        if npcData.drops then
            for index, drop in ipairs(npcData.drops) do
                local itemID = drop.itemID
                local itemName, itemLink, _, _, _, _, _, _, _, itemIcon = GetItemInfo(itemID)

                -- If the item is not cached, query the item
                if not itemName then
                    --print("Querying itemID: " .. itemID)
                    -- Query the item
                    queryItem(itemID)
                --else
                    --print("Item already cached: " .. itemName .. " (ID: " .. itemID .. ")")
                end
            end
        end
    end
end

-- Function to get the color based on drop rate
local function GetDropRateColor(dropRate)
    if dropRate == 1 then
        return 0, 0.5, 1  -- Blue (RGB)
    elseif dropRate <= 25 then
        return 0, 1, 0  -- Green (RGB)
    elseif dropRate <= 100 then
        return 1, 1, 0  -- Yellow (RGB)
    else
        return 1, 0.5, 0  -- Orange (RGB)
    end
end


-- Create the main UI frame
local function CreateNPCListFrame()
    -- Create the main frame
    local frame = CreateFrame("Frame", "NPCListFrame", UIParent)
    frame:SetSize(600, 400)  -- Increase width to make space for the item list on the left
    frame:SetPoint("CENTER", UIParent, "CENTER")

    -- Set background and borders manually
    frame:SetBackdrop({
        bgFile = "Interface\\WORS\\OldSchoolBackground2",  -- Background texture
        edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",    -- Border texture
        tile = false, tileSize = 32, edgeSize = 32,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    --frame:SetBackdropColor(0, 0, 0, 1)  -- Black background

    -- Set the title of the frame
    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 437, -20)
    frame.title:SetText("NPC List")



    -- Set the title of the frame
    frame.NpcNameSelected = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.NpcNameSelected:SetPoint("TOPLEFT", frame, "TOPLEFT", 125, -20)
    frame.NpcNameSelected:SetText("Npc Name")

    -- Create the input box for filtering NPCs
    local inputBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    inputBox:SetSize(150, 20)
    inputBox:SetPoint("TOPLEFT", frame, "TOPLEFT", 390, -40)
    inputBox:SetAutoFocus(false)
    inputBox:SetScript("OnTextChanged", function(self)
        local text = self:GetText():lower()
        UpdateNPCList(text)
    end)

    -- Scrollable area for NPCs
    local npcScrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    npcScrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 390, -70)
    npcScrollFrame:SetSize(150, 300)

    -- Create a container for the scrollable content (NPC List)
    local npcContent = CreateFrame("Frame", nil, npcScrollFrame)
    npcContent:SetSize(150, 300)
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

        -- Verify All items are cached.
        for index, drop in ipairs(npcDrops.drops) do
            local itemID = drop.itemID
            local itemName, itemLink, _, _, _, _, _, _, _, itemIcon = GetItemInfo(itemID)
            if not itemName then
                queryItem(itemID)
            end
        end

        -- Populate the item list
        for index, drop in ipairs(npcDrops.drops) do
            local itemID = drop.itemID
            local itemDropRate = drop.dropRate
            local itemQuantity = drop.quantity or "1"  -- Default to "1" if quantity is not specified
            local itemName, itemLink, _, _, _, _, _, _, _, itemIcon = GetItemInfo(itemID)
            local itemButton = itemList[index]
			
            -- Create item button if it doesn't exist
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

            -- Display the quantity and ensure the text color is always white
            if itemQuantity then
                itemButton.quantityText:SetText("Quantity: " .. itemQuantity)
                itemButton.quantityText:SetTextColor(1, 1, 1)  -- Set to white (RGB)
            end

            -- Display the drop rate and color it based on conditions
            if itemDropRate then
                local dropPercentage = (1 / itemDropRate) * 100
                itemButton.dropRateText:SetText(string.format("Drop Rate: %.2f%% (1 in %d)", dropPercentage, itemDropRate))

                -- Set the text color based on the drop rate
                local r, g, b = GetDropRateColor(itemDropRate)
                itemButton.dropRateText:SetTextColor(r, g, b)  -- Apply the conditional color
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
                    frame.NpcNameSelected:SetText(npcName)

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

--[[ --Old Button
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
end --]]

-- Create the NPC list frame on player login
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    -- Call the function to query all itemIDs
    QueryAllItemIDs()
    local npcFrame = CreateNPCListFrame()
    npcFrame:Show()  -- Show the NPC frame when the player logs in
	NPCListFrame:Hide() -- Hides on login
    --local minimapButton = CreateMinimapButton()
end)


-- Function to create the minimap button Using LibDBIcon and Ace3
local NPCDropTableAddon = LibStub("AceAddon-3.0"):NewAddon("NPCDropTable")
DropTableMinimapButton = LibStub("LibDBIcon-1.0", true)

local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("NPCDropTable", {
	type = "data source",
	text = "NPCDropTable",
	icon = "INTERFACE\\ICONS\\INV_Crate_04",
	OnClick = function(self, btn)
        if btn == "LeftButton" then
			if NPCListFrame:IsShown() then
				NPCListFrame:Hide()
			else
				NPCListFrame:Show()
			end
        end
	end,
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then
			return
		end
		tooltip:AddLine("NPCDropTable \n\nLeft-click: Toggle NPCDropTable", nil, nil, nil, nil)
	end,
})

function NPCDropTableAddon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("NPCDropTableMinimapPOS", {
		profile = {
			minimap = {
				hide = false,
			},
		},
        
	})
	DropTableMinimapButton:Register("NPCDropTable", miniButton, self.db.profile.minimap)
end

DropTableMinimapButton:Show("NPCDropTable")