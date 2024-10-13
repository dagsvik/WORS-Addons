-- Default setting
local defaultSetting = "All"

-- Initialize settings table
if not BankStackSplitterSettings then
    BankStackSplitterSettings = defaultSetting
end

-- Initialize custom amount variable
if not BankStackSplitterSettingsCustomAmount then
    BankStackSplitterSettingsCustomAmount = 1
end

-- Flag to prevent multiple hooks
local hooksSetUp = false

-- Event frame to handle addon and guild bank events
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("GUILDBANKFRAME_OPENED")

eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "Blizzard_GuildBankUI" then
        -- Blizzard_GuildBankUI is loaded, we can now access GuildBankFrame
        print("Blizzard_GuildBankUI loaded")
        if not BankStackSplitterButtonFrame then
            CreateGuildBankButtons()
            print("Guild bank buttons created")
        end
        HookGuildBankItemButtons()
        print("Guild bank item buttons hooked")
    elseif event == "GUILDBANKFRAME_OPENED" then
        print("Guild bank frame opened")
        -- Ensure buttons and hooks are set up
        if not BankStackSplitterButtonFrame then
            if IsAddOnLoaded("Blizzard_GuildBankUI") then
                CreateGuildBankButtons()
                print("Guild bank buttons created")
                HookGuildBankItemButtons()
                print("Guild bank item buttons hooked")
            else
                -- Load Blizzard_GuildBankUI if not already loaded
                LoadAddOn("Blizzard_GuildBankUI")
                CreateGuildBankButtons()
                print("Guild bank buttons created after loading Blizzard_GuildBankUI")
                HookGuildBankItemButtons()
                print("Guild bank item buttons hooked after loading Blizzard_GuildBankUI")
            end
        end
    end
end)

-- Function to place item into the first available bag slot
function PlaceItemInBags()
    for bag = 0, 4 do  -- Bags 0 to 4 (Backpack and other bags)
        local numSlots = GetContainerNumSlots(bag)
        for slot = 1, numSlots do
            local texture = GetContainerItemInfo(bag, slot)
            if not texture then
                -- Empty slot found
                PickupContainerItem(bag, slot)
                return true
            end
        end
    end
    return false
end

-- Function to count empty bag slots
function GetEmptyBagSlotCount()
    local emptySlots = 0
    for bag = 0, 4 do  -- Bags 0 to 4 (Backpack and other bags)
        local numSlots = GetContainerNumSlots(bag)
        for slot = 1, numSlots do
            local texture = GetContainerItemInfo(bag, slot)
            if not texture then
                emptySlots = emptySlots + 1
            end
        end
    end
    return emptySlots
end

-- Define a StaticPopup dialog for entering the amount
StaticPopupDialogs["BANKSTACKSPLITTER_ENTER_AMOUNT"] = {
    text = "Enter the amount to withdraw:",
    button1 = "OK",
    button2 = "Cancel",
    hasEditBox = true,
    maxLetters = 5,
    OnAccept = function(self)
        local text = self.editBox:GetText()
        local amount = tonumber(text)
        if amount and amount > 0 then
            -- Store the custom amount
            BankStackSplitterSettingsCustomAmount = amount
            print("Custom amount set to:", amount)
            -- Update the button text
            if BankStackSplitterButtonFrame and BankStackSplitterButtonFrame.buttons then
                for _, button in pairs(BankStackSplitterButtonFrame.buttons) do
                    if button.value == "X" then
                        button:SetText("X (" .. amount .. ")")
                        break
                    end
                end
            end
        else
            print("Invalid amount entered.")
        end
    end,
    OnShow = function(self)
        self.editBox:SetText(tostring(BankStackSplitterSettingsCustomAmount or 1))
    end,
    EditBoxOnEnterPressed = function(self)
        local parent = self:GetParent()
        StaticPopupDialogs["BANKSTACKSPLITTER_ENTER_AMOUNT"].OnAccept(parent)
        parent:Hide()
    end,
    whileDead = true,
    hideOnEscape = true,
}

-- Function to create buttons on the GuildBankFrame
function CreateGuildBankButtons()
    -- Ensure the guild bank frame exists
    if not GuildBankFrame then
        print("GuildBankFrame not found")
        return
    end

    -- Check if buttons already exist
    if BankStackSplitterButtonFrame then
        print("BankStackSplitterButtonFrame already exists")
        return
    end

    -- Create a frame to hold the buttons
    local buttonFrame = CreateFrame("Frame", "BankStackSplitterButtonFrame", GuildBankFrame)
    buttonFrame:SetSize(200, 30)  -- Adjust size to fit more buttons
    buttonFrame:SetPoint("TOPLEFT", GuildBankFrame, "TOPLEFT", 70, -40)

    -- Button labels and positions
    local buttons = {
        { label = "1", value = "1", x = 0 },
        { label = "5", value = "5", x = 35 },
        { label = "10", value = "10", x = 70 },
        { label = "X", value = "X", x = 105 },
        { label = "All", value = "All", x = 140 },
    }

    -- Store buttons for later reference
    BankStackSplitterButtonFrame.buttons = {}

    for _, info in ipairs(buttons) do
        local btn = CreateFrame("Button", "BankStackSplitterButton" .. info.label, buttonFrame, "UIPanelButtonTemplate")
        btn:SetSize(30, 20)
        btn:SetPoint("LEFT", buttonFrame, "LEFT", info.x, 0)
        if info.value == "X" then
            btn:SetText("X (" .. (BankStackSplitterSettingsCustomAmount or 1) .. ")")
        else
            btn:SetText(info.label)
        end
        btn.value = info.value

        -- Highlight the selected button
        if BankStackSplitterSettings == info.value then
            btn:LockHighlight()
        end

        -- Enable both left and right clicks
        btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")

        -- OnClick handler
        btn:SetScript("OnClick", function(self, buttonPressed)
            if buttonPressed == "LeftButton" then
                -- Left-click handler
                -- Save the selected value
                BankStackSplitterSettings = self.value
                print("Selected amount set to:", self.value)

                -- Update button highlights
                for _, button in pairs(BankStackSplitterButtonFrame.buttons) do
                    button:UnlockHighlight()
                end
                self:LockHighlight()
            elseif buttonPressed == "RightButton" and self.value == "X" then
                -- Right-click handler for "X" button
                StaticPopup_Show("BANKSTACKSPLITTER_ENTER_AMOUNT")
            end
        end)

        -- Add the button to the table
        table.insert(BankStackSplitterButtonFrame.buttons, btn)
    end
    print("Guild bank buttons created successfully")
end

-- Function to hook guild bank item buttons
function HookGuildBankItemButtons()
    if hooksSetUp then
        print("Hooks already set up")
        return
    end
    hooksSetUp = true
    print("Setting up hooks for guild bank item buttons")

    -- Hook guild bank item buttons
    for column = 1, 7 do
        for buttonIndex = 1, 14 do
            local buttonName = "GuildBankColumn" .. column .. "Button" .. buttonIndex
            local button = _G[buttonName]
            if button then
                -- Save the original OnClick handler
                local originalOnClick = button:GetScript("OnClick")

                -- Set a new OnClick handler
                button:SetScript("OnClick", function(self, buttonPressed)
                    if buttonPressed == "RightButton" then
                        print("Right-clicked on:", buttonName)
                        HandleGuildBankItemClick(self, column, buttonIndex)
                        -- Do not call the original OnClick handler
                    else
                        -- Call the original OnClick handler for other clicks
                        if originalOnClick then
                            originalOnClick(self, buttonPressed)
                        end
                    end
                end)
            else
                print("Button not found:", buttonName)
            end
        end
    end
    print("Hooks set up for guild bank item buttons")
end

-- Function to handle right-click on guild bank items
function HandleGuildBankItemClick(button, column, buttonIndex)
    print("HandleGuildBankItemClick called with column:", column, "buttonIndex:", buttonIndex)
    local amount = BankStackSplitterSettings
    print("Amount to withdraw:", amount)
    local tab = GetCurrentGuildBankTab()
    print("Current guild bank tab:", tab)
    local slot = (column - 1) * 14 + buttonIndex  -- Calculate slot number from column and buttonIndex
    print("Calculated slot number:", slot)

    local itemLink = GetGuildBankItemLink(tab, slot)
    if not itemLink then
        print("No item found at slot:", slot)
        return
    end
    print("ItemLink found:", itemLink)

    local texture, itemCount, locked = GetGuildBankItemInfo(tab, slot)
    print("Item count:", itemCount, "Locked:", tostring(locked))
    if not itemCount or itemCount <= 0 or locked then
        print("Cannot withdraw item. Either count is zero or item is locked.")
        return
    end

    -- Get item info and itemID
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(itemLink)
    print("Item stack count in bags:", itemStackCount)
    local itemID = tonumber(string.match(itemLink, "item:(%d+)"))
    print("ItemID:", itemID)

    -- Handle amount
    if amount == "All" then
        if itemID and itemID <= 500000 then
            print("ItemID <= 500000, withdrawing all items")
            -- Withdraw the full stack
            PickupGuildBankItem(tab, slot)
            -- Check if the item is on the cursor
            local curType, cursorItemID, cursorItemLink = GetCursorInfo()
            if curType == "item" then
                print("Item picked up from guild bank:", cursorItemLink)
                if not PlaceItemInBags() then
                    print("Your bags are full!")
                    ClearCursor()
                else
                    print("Item successfully stored in bags")
                end
            else
                print("Failed to pick up item from guild bank")
            end
            return  -- Exit the function after handling this case
        else
            -- ItemID > 500000, withdraw based on empty bag slots
            print("ItemID > 500000, withdrawing based on empty bag slots")
            -- Get the number of empty bag slots
            local emptySlots = GetEmptyBagSlotCount()
            if emptySlots <= 0 then
                print("No empty bag slots available")
                return
            end
            amount = emptySlots
            print("Empty bag slots:", amount)
            -- Continue to process with the calculated amount
        end
    elseif amount == "X" then
        amount = BankStackSplitterSettingsCustomAmount
        print("Using custom amount:", amount)
        amount = tonumber(amount)
        if not amount or amount <= 0 then
            print("Invalid custom amount:", amount)
            return
        end
    else
        amount = tonumber(amount)
        if not amount or amount <= 0 then
            print("Invalid amount:", amount)
            return
        end
    end

    if amount > itemCount then
        amount = itemCount
        print("Adjusted amount to available item count:", amount)
    end

    if itemStackCount == 1 then
        print("Item is non-stackable in bags.")
        -- For non-stackable items, withdraw one at a time
        for i = 1, amount do
            print("Withdrawing item number:", i)
            -- Check if there are still items left in the bank
            local _, currentItemCount, currentLocked = GetGuildBankItemInfo(tab, slot)
            if not currentItemCount or currentItemCount <= 0 or currentLocked then
                print("No more items to withdraw or item is locked.")
                break
            end

            PickupGuildBankItem(tab, slot)
            -- Check if the item is on the cursor
            local curType, cursorItemID, cursorItemLink = GetCursorInfo()
            if curType == "item" then
                print("Item picked up from guild bank:", cursorItemLink)
                if not PlaceItemInBags() then
                    print("Your bags are full!")
                    ClearCursor()
                    break
                else
                    print("Item successfully stored in bags")
                end
            else
                print("Failed to pick up item from guild bank")
                break
            end
        end
    else
        print("Item is stackable in bags.")
        -- For stackable items, use SplitGuildBankItem
        print("Attempting to withdraw amount:", amount)
        SplitGuildBankItem(tab, slot, amount)
        -- Check if the item is on the cursor
        local curType, cursorItemID, cursorItemLink = GetCursorInfo()
        if curType == "item" then
            print("Item split and picked up from guild bank:", cursorItemLink)
            if not PlaceItemInBags() then
                print("Your bags are full!")
                ClearCursor()
            else
                print("Item successfully stored in bags")
            end
        else
            print("Failed to split and pick up item from guild bank")
        end
    end
end
