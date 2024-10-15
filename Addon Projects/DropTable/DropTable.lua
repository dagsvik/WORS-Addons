-- Main.lua

-- main.lua

-- Example usage of the NPCData table
local npcID = 442293
local npcDrops = NPCData[npcID]

-- Used for saving items to Querie
local ItemQueue={};

--SettingsVariables?
BGAlpha = 1

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
	local SuperParent = CreateFrame("Frame", "ParentNPCListFrame", UIParent)
	----SetSize
	SuperParent:SetSize(780, 400)  -- Increase width to make space for the item list on the left
    SuperParent:SetPoint("CENTER", UIParent, "CENTER")

	-- (2)
	SuperParent:SetBackdrop({
		bgFile = nil,
		edgeFile = nil,
		edgeSize = 1,
	})

	---FrameColor
	SuperParent:SetBackdropColor(0,0,0,0)
	
	----Movable
	SuperParent:EnableMouse(true)
	SuperParent:SetMovable(true)
	SuperParent:RegisterForDrag("LeftButton")
	SuperParent:SetScript("OnDragStart", SuperParent.StartMoving)
	SuperParent:SetScript("OnDragStop", SuperParent.StopMovingOrSizing)
	SuperParent:SetScript("OnHide", SuperParent.StopMovingOrSizing)
	
    -- Create the BG frame
    local bgframe = CreateFrame("Frame", "BGNPCListFrame", UIParent)
	-- ParentNPCListFrame
	bgframe:SetParent(ParentNPCListFrame)
	
	----SetSize
	bgframe:SetSize(780, 400)  -- Increase width to make space for the item list on the left
    bgframe:SetPoint("CENTER")

    -- Set background and borders manually
    bgframe:SetBackdrop({
        bgFile = "Interface\\WORS\\OldSchoolBackground2",  -- Background texture
        edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",    -- Border texture
        tile = false, tileSize = 32, edgeSize = 32,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })

    -- Create the main frame
    local frame = CreateFrame("Frame", "NPCListFrame", UIParent)
	----Movable
	--bgframe:EnableMouse(true)
	frame:SetMovable(true)
	--bgframe:RegisterForDrag("LeftButton")
	--bgframe:SetScript("OnDragStart", bgframe.StartMoving)
	--bgframe:SetScript("OnDragStop", bgframe.StopMovingOrSizing)
	--bgframe:SetScript("OnHide", bgframe.StopMovingOrSizing)
	
	--SetParent
	frame:SetParent(ParentNPCListFrame)
	frame:SetIgnoreParentAlpha(true)
	
	--SetSize
    frame:SetSize(780, 400)  -- Increase width to make space for the item list on the left
    frame:SetPoint("CENTER")


    -- Item List
    frame.itemList = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.itemList:SetPoint("TOPLEFT", 600, -10)
    frame.itemList:SetTextColor(201,132,55,1)
    frame.itemList:SetText("NPC List")
    frame.itemList:SetJustifyH("LEFT")
    frame.itemList:SetJustifyV("CENTER")
    frame.itemList:SetFont("Fonts\\runescape_bold.ttf", 20)

    -- Line separator for Item List
    local LineSeperatorItemList = frame:CreateTexture(nil, "BACKGROUND")
    LineSeperatorItemList:SetColorTexture(.6 ,.6, .6, .2)
    LineSeperatorItemList:SetSize(150, 2)
    LineSeperatorItemList:SetPoint("TOPLEFT", frame, "TOPLEFT", 600, -28)

    -- Create the input box for filtering Items (Customized similarly)
    local inputBoxItem = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    inputBoxItem:SetSize(146, 20)
    inputBoxItem:SetPoint("TOPLEFT", frame, "TOPLEFT", 600, -35)
    inputBoxItem:SetAutoFocus(false)
    inputBoxItem:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 5, edgeSize = 5,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    inputBoxItem:SetBackdropColor(0.1, 0.1, 0.1, 1)  -- Dark grey background
    inputBoxItem:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)  -- Border color

    inputBoxItem:SetScript("OnTextChanged", function(self)
        local textChanged2 = self:GetText():lower()
        --print("Text change registered button")
        PopulateItemListFilter(textChanged2)
    end)

 
    -- Scrollable area for Item List
    local itemScrollFrameSearch = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    itemScrollFrameSearch:SetPoint("TOPLEFT", frame, "TOPLEFT", 600, -60)
    itemScrollFrameSearch:SetSize(150, 300)

    -- Create a container for the scrollable content (Item List)
    local itemContentSearch = CreateFrame("Frame", nil, itemScrollFrameSearch)
    itemContentSearch:SetSize(150, 300)
    itemScrollFrameSearch:SetScrollChild(itemContentSearch)

    -- NPC List
    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.title:SetPoint("TOPLEFT", 410, -10)
    frame.title:SetTextColor(201,132,55,1)
    frame.title:SetText("NPC List")
    frame.title:SetJustifyH("LEFT")
    frame.title:SetJustifyV("CENTER")
    frame.title:SetFont("Fonts\\runescape_bold.ttf", 20)

    -- Line separator for NPC List
    local LineSeperatorNPCList = frame:CreateTexture(nil, "BACKGROUND")
    LineSeperatorNPCList:SetColorTexture(.6 ,.6, .6, .2)
    LineSeperatorNPCList:SetSize(150, 2)
    LineSeperatorNPCList:SetPoint("TOPLEFT", frame, "TOPLEFT", 410, -28)

    -- NPC Name Selected
    frame.NpcNameSelected = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.NpcNameSelected:SetPoint("TOPLEFT", 20, -10)
    frame.NpcNameSelected:SetTextColor(201,132,55,1)
    frame.NpcNameSelected:SetText("Npc Name")
    frame.NpcNameSelected:SetJustifyH("LEFT")
    frame.NpcNameSelected:SetJustifyV("CENTER")
    frame.NpcNameSelected:SetFont("Fonts\\runescape_bold.ttf", 20)

    -- Line separator for NPC Name
    local LineSeperatorNPCName = frame:CreateTexture(nil, "BACKGROUND")
    LineSeperatorNPCName:SetColorTexture(.6 ,.6, .6, .2)
    LineSeperatorNPCName:SetSize(170, 2)
    LineSeperatorNPCName:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -28)

    -- ITEM Name Selected
    frame.ItemNameSelected = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.ItemNameSelected:SetPoint("TOPLEFT", 220, -10)
    frame.ItemNameSelected:SetTextColor(201,132,55,1)
    frame.ItemNameSelected:SetText("Item Name")
    frame.ItemNameSelected:SetJustifyH("LEFT")
    frame.ItemNameSelected:SetJustifyV("CENTER")
    frame.ItemNameSelected:SetFont("Fonts\\runescape_bold.ttf", 20)

    -- Line separator for Item Name
    local LineSeperatorItemName = frame:CreateTexture(nil, "BACKGROUND")
    LineSeperatorItemName:SetColorTexture(.6 ,.6, .6, .2)
    LineSeperatorItemName:SetSize(170, 2)
    LineSeperatorItemName:SetPoint("TOPLEFT", frame, "TOPLEFT", 220, -28)

    -- Create the input box for filtering NPCs (Customized to avoid dark/transparent issues)
    local inputBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    inputBox:SetSize(146, 20)
    inputBox:SetPoint("TOPLEFT", frame, "TOPLEFT", 414, -35)
    inputBox:SetAutoFocus(false)
    inputBox:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 5, edgeSize = 5,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    inputBox:SetBackdropColor(0.1, 0.1, 0.1, 1)  -- Dark grey background
    inputBox:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)  -- Border color

    inputBox:SetScript("OnTextChanged", function(self)
        local text = self:GetText():lower()
        UpdateNPCList(text)
    end)


    -- Scrollable area for NPCs
    local npcScrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")

	npcScrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 410, -60)
    npcScrollFrame:SetSize(150, 300)

    -- Create a container for the scrollable content (NPC List)
    local npcContent = CreateFrame("Frame", nil, npcScrollFrame)
    npcContent:SetSize(150, 300)
    npcScrollFrame:SetScrollChild(npcContent)



    -- Create a container for the items to the left of the NPC list
    local itemScrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    itemScrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -60)
    itemScrollFrame:SetSize(170, 300)

    local itemContent = CreateFrame("Frame", nil, itemScrollFrame)
    itemContent:SetSize(170, 300)
    itemScrollFrame:SetScrollChild(itemContent)



    -- Scrollable area for NPCs that drop item.
    local npcScrollFrameSearch = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")

	npcScrollFrameSearch:SetPoint("TOPLEFT", frame, "TOPLEFT", 220, -60)
    npcScrollFrameSearch:SetSize(150, 300)

    -- Create a container for the scrollable content (NPC List)
    local npcContentSearch = CreateFrame("Frame", nil, npcScrollFrameSearch)
    npcContentSearch:SetSize(150, 300)
    npcScrollFrameSearch:SetScrollChild(npcContentSearch)


    -- Create the list for NPC entries
    local npcList = {}
    local itemList = {}  -- List of items to display when NPC is clicked

    local itemListSearch = {}  -- List of items to display when NPC is clicked
    local npcListSearch = {}
    -- Function to clear the item list
    local function ClearItemList()
        for _, button in ipairs(itemList) do
            button:Hide()
        end
    end

    -- Function to populate the item list when an NPC is clicked
    function PopulateItemList(npcID)
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
                itemButton:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

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
            
            itemButton:SetScript("OnClick", function()
                local thisItemID = itemID
                frame.ItemNameSelected:SetText(itemLink)
                PopulateNPCListFilter(thisItemID)
                --print(itemName)
                --print(thisItemID)
                -- Add any other actions you want to happen when an NPC is clicked
            end)

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
	
    -- Function to populate the NPC list based on the itemID
    function PopulateNPCListFilter(itemID)
        -- Clear the previous NPC list
        for _, button in ipairs(npcListSearch) do
            button:Hide()  -- Hide all previous buttons before repopulating
        end

        local index = 0

        -- Check if the itemID exists in ITEMData
        local npcListForItem = ITEMData[itemID]
        if not npcListForItem then
            --print("No NPCs found for itemID:", itemID)
            return
        end

        -- Iterate over the list of NPCs that drop this item
        for _, npcInfo in ipairs(npcListForItem) do
            local npcName = npcInfo.npcName
            local npcID = npcInfo.npcID

            index = index + 1
            local npcButton = npcListSearch[index]

            -- Create the button if it doesn't exist
            if not npcButton then
                npcButton = CreateFrame("Button", nil, npcContentSearch)
                npcButton:SetSize(150, 20)
                npcButton:SetPoint("TOPLEFT", npcContentSearch, "TOPLEFT", 0, -((index - 1) * 25))

                -- Create hover effect
                npcButton:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

                -- Create a font string for the NPC name
                npcButton.text = npcButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                npcButton.text:SetPoint("LEFT", npcButton, "LEFT", 5, 0)

                -- Add button to the npcList
                npcListSearch[index] = npcButton
            end

            -- Update the NPC button text and show it
            npcButton.text:SetText(npcName)
            npcButton.npcID = npcID  -- Store the NPC's ID in the button

            -- Set click handler for NPC button (You can add any functionality if needed when clicked)
            npcButton:SetScript("OnClick", function()
                frame.NpcNameSelected:SetText(npcName)
                PopulateItemList(npcID)
                -- Add any other actions you want to happen when an NPC is clicked
            end)

            -- Show the button
            npcButton:Show()
        end

        -- Adjust content height based on the number of NPCs
        local totalHeight = index * 25
        npcContentSearch:SetHeight(math.max(totalHeight, 300))
    end


    -- Function to populate the NPC list dynamically from NPCData
    function PopulateNPCList(filteredText)
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

    function PopulateItemListFilter(filteredText)
        -- Ensure itemListSearch is populated before trying to hide the buttons
        if #itemListSearch == 0 then
            --print("itemListSearch is empty, no buttons to hide.")
        else
            for _, button in ipairs(itemListSearch) do
                button:Hide()  -- Hide all previous buttons before repopulating
                --print("Hides button")
            end
        end
    
        local index = 0
        for itemID, npcList in pairs(ITEMData) do
            local itemName, itemLink = GetItemInfo(itemID)  -- Fetch item name and link
    
            -- Ensure the item name is valid
            if itemName then
                -- Filter by input if necessary
                if not filteredText or itemName:lower():find(filteredText) then
                    index = index + 1
                    local itemButton = itemListSearch[index]
    
                    -- Create the button if it doesn't exist
                    if not itemButton then
                        itemButton = CreateFrame("Button", nil, itemContentSearch)
                        itemButton:SetSize(240, 20)
                        itemButton:SetPoint("TOPLEFT", itemContentSearch, "TOPLEFT", 0, -((index - 1) * 25))
    
                        -- Create hover effect
                        itemButton:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    
                        -- Create a font string for the item name
                        itemButton.text = itemButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                        itemButton.text:SetPoint("LEFT", itemButton, "LEFT", 5, 0)
    
                        -- Add button to the itemListSearch
                        itemListSearch[index] = itemButton
                    end
    
                    -- Update the item button text and show it
                    itemButton.text:SetText(itemLink)
                    itemButton.itemID = itemID  -- Store the itemID in the button
    
                    -- Set click handler for item button
                    itemButton:SetScript("OnClick", function()
                        frame.ItemNameSelected:SetText(itemLink)
                        PopulateNPCListFilter(itemID)
                    end)
    
                    -- Show the button
                    itemButton:Show()
                end

            end
        end
    
        -- Adjust content height based on the number of items
        local totalHeight = index * 25
        itemContentSearch:SetHeight(math.max(totalHeight, 300))
    end
    

    -- Initial population of the NPC list
    PopulateNPCList(nil)
    PopulateItemListFilter(nil)

    return frame
end


-- Create the NPC list frame on player login
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    -- Call the function to query all itemIDs
    QueryAllItemIDs()
    local npcFrame = CreateNPCListFrame()
    npcFrame:Show()  -- Show the NPC frame when the player logs in
	NPCListFrame:Hide() -- Hides on login
	BGNPCListFrame:Hide() -- Hides on login
	ParentNPCListFrame:Hide()
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
		if not IsShiftKeyDown() then
			if btn == "LeftButton" then
				if NPCListFrame:IsShown() then
					NPCListFrame:Hide()
					BGNPCListFrame:Hide()
					ParentNPCListFrame:Hide()
				else
					NPCListFrame:Show()
					BGNPCListFrame:Show()
					ParentNPCListFrame:Show()
				end
			end
		end
		if IsShiftKeyDown() then
			if btn == "LeftButton" then
				if (BGAlpha > 0.21) then
					BGAlpha = BGAlpha - 0.1
					BGNPCListFrame:SetAlpha(BGAlpha)
					--print(BGAlpha) -- Debugging
				end
			end
			if btn == "RightButton" then
				if (BGAlpha < 1) then
					BGAlpha = BGAlpha + 0.1
					BGNPCListFrame:SetAlpha(BGAlpha)
					--print(BGAlpha) -- Debugging
				end
			end
		end
	end,
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then
			return
		end
		tooltip:AddLine("NPCDropTable \n\nLeft-click: Toggle NPCDropTable\nShift+Left-click - Opacity\nShift+Right-click + Opacity", nil, nil, nil, nil)
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