-- Create a frame to listen for events
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("LOOT_OPENED")
f:RegisterEvent("LOOT_CLOSED")
f:RegisterEvent("LOOT_SLOT_CLEARED")
f:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- Create the custom loot frame
        CreateCustomLootFrame()
        -- Hide the default loot frame
        LootFrame:UnregisterAllEvents()
        LootFrame:Hide()
    elseif event == "LOOT_OPENED" then
        local autoLoot = ...
        -- Hide the default loot frame in case it is still visible
        LootFrame:Hide()
        ShowCustomLootFrame()
    elseif event == "LOOT_CLOSED" then
        HideCustomLootFrame()
    elseif event == "LOOT_SLOT_CLEARED" then
        local slot = ...
        UpdateCustomLootFrame()  -- Refresh the loot list
    end
end)


-- Create the custom loot frame
function CreateCustomLootFrame()
    -- Create the main frame
    CustomLootFrame = CreateFrame("Frame", "CustomLootFrame", UIParent)
    CustomLootFrame:SetPoint("CENTER", UIParent, "CENTER")
    CustomLootFrame:SetSize(150, 100)  -- Initial size, will adjust dynamically
    CustomLootFrame:SetFrameStrata("DIALOG")
    CustomLootFrame:EnableMouse(true)
    CustomLootFrame:SetMovable(true)
    CustomLootFrame:RegisterForDrag("LeftButton")
    CustomLootFrame:SetScript("OnDragStart", CustomLootFrame.StartMoving)
    CustomLootFrame:SetScript("OnDragStop", CustomLootFrame.StopMovingOrSizing)
    tinsert(UISpecialFrames, "CustomLootFrame")

    -- Set the background color
    CustomLootFrame.bg = CustomLootFrame:CreateTexture(nil, "BACKGROUND")
    CustomLootFrame.bg:SetAllPoints(true)
    CustomLootFrame.bg:SetColorTexture(93/255, 84/255, 71/255, 1)  -- RGB to match #5D5447

    -- Title text
    CustomLootFrame.title = CustomLootFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    CustomLootFrame.title:SetPoint("TOP", CustomLootFrame, "TOP", 0, -10)
    CustomLootFrame.title:SetText("Loot")


    -- Table to hold loot buttons
    CustomLootFrame.lootButtons = {}

    -- Initially hide the frame until loot is opened
    CustomLootFrame:Hide()  -- Ensure the frame starts hidden
end

-- Show the custom loot frame and populate it with loot items
function ShowCustomLootFrame()
    local numLootItems = GetNumLootItems()
    if numLootItems == 0 then
        -- No loot, close the frame
        HideCustomLootFrame()
        return
    end

    -- Adjust the frame size based on the number of loot items (+ 1 for the Cancel button)
    local buttonHeight = 20  -- Height of each loot button
    local frameHeight = 60 + (buttonHeight * (numLootItems + 1))  -- +1 for the cancel button
    CustomLootFrame:SetHeight(frameHeight)

   -- Get the current mouse position and adjust it based on the scale of the UI
   local scale = UIParent:GetEffectiveScale()
   local cursorX, cursorY = GetCursorPosition()
   cursorX, cursorY = cursorX / scale, cursorY / scale

   -- Adjust the position so that the first item's "Take" button is under the mouse
   local offsetY = 50  -- Offset for positioning the first item below the cursor
   local offsetX = -5
   CustomLootFrame:ClearAllPoints()
   CustomLootFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", cursorX - 20 + offsetX, cursorY + offsetY)


    -- Create or update loot buttons
    for i = 1, numLootItems do
        local lootButton = CustomLootFrame.lootButtons[i]
        if not lootButton then
            -- Create a new loot button
            lootButton = CreateFrame("Button", "CustomLootButton"..i, CustomLootFrame)
            lootButton:SetHeight(buttonHeight)
            lootButton:SetWidth(280)
            lootButton:SetPoint("TOPLEFT", CustomLootFrame, "TOPLEFT", 10, -40 - (buttonHeight * (i - 1)))
            lootButton:EnableMouse(true)

            -- Create "Take" text
            lootButton.takeText = lootButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            lootButton.takeText:SetText("Take")
            lootButton.takeText:SetPoint("LEFT", lootButton, "LEFT", 4, 0)
            lootButton.takeText:SetTextColor(1, 1, 1) -- White color

            -- Create item name text
            lootButton.itemNameText = lootButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            lootButton.itemNameText:SetPoint("LEFT", lootButton.takeText, "RIGHT", 8, 0)
            lootButton.itemNameText:SetTextColor(1, 0.5, 0) -- Orange color

            -- Set up hover effect
            lootButton:SetScript("OnEnter", function(self)
                if self.takeText then
                    self.takeText:SetTextColor(1, 1, 0) -- Yellow color
                end
                if self.slot then
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    GameTooltip:SetLootItem(self.slot)
                    GameTooltip:Show()
                end
            end)

            lootButton:SetScript("OnLeave", function(self)
                if self.takeText then
                    self.takeText:SetTextColor(1, 1, 1) -- White color
                end
                GameTooltip:Hide()
            end)

            -- Set up click handler to loot the item
            lootButton:SetScript("OnClick", function(self)
                if self.slot then
                    LootSlot(self.slot)
                end
            end)

            -- Store the loot button
            CustomLootFrame.lootButtons[i] = lootButton
        end

        -- Update the loot button with item info
        local slot = i
        local texture, item, quantity, quality, locked = GetLootSlotInfo(slot)
        local itemLink = GetLootSlotLink(slot)
        lootButton.slot = slot

        -- Update the item name text
        lootButton.itemNameText:SetText(item or "")
        --if quality then
        --    local r, g, b = GetItemQualityColor(quality)
        --    lootButton.itemNameText:SetTextColor(r, g, b)
        --else
            -- Set default color to orange (RGB: 1, 0.5, 0)
        lootButton.itemNameText:SetTextColor(1, 0.5, 0)  -- Orange color
        --end

        -- Show the loot button
        lootButton:Show()
    end

    -- Create the Cancel button if it doesn't exist
    if not CustomLootFrame.cancelButton then
        CustomLootFrame.cancelButton = CreateFrame("Button", "CustomLootCancelButton", CustomLootFrame)
        CustomLootFrame.cancelButton:SetHeight(buttonHeight)
        CustomLootFrame.cancelButton:SetWidth(280)
        CustomLootFrame.cancelButton:EnableMouse(true)

        -- Set the "Cancel" text
        CustomLootFrame.cancelButton.cancelText = CustomLootFrame.cancelButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        CustomLootFrame.cancelButton.cancelText:SetText("Cancel")
        CustomLootFrame.cancelButton.cancelText:SetPoint("TOPLEFT", CustomLootFrame.cancelButton, "TOPLEFT", 2, -2)
        CustomLootFrame.cancelButton.cancelText:SetTextColor(1, 1, 1) -- White color

        -- Set up hover effect for Cancel button
        CustomLootFrame.cancelButton:SetScript("OnEnter", function(self)
            self.cancelText:SetTextColor(1, 1, 0) -- Yellow color
        end)

        CustomLootFrame.cancelButton:SetScript("OnLeave", function(self)
            self.cancelText:SetTextColor(1, 1, 1) -- White color
        end)

        -- Set up click handler to hide the loot frame
        CustomLootFrame.cancelButton:SetScript("OnClick", function(self)
            HideCustomLootFrame()
        end)
    end

    -- Position the Cancel button just below the last loot button
    CustomLootFrame.cancelButton:SetPoint("TOPLEFT", CustomLootFrame, "TOPLEFT", 10, -40 - (buttonHeight * numLootItems))

    -- Show the Cancel button
    CustomLootFrame.cancelButton:Show()

    -- Hide unused loot buttons
    for i = numLootItems + 1, #CustomLootFrame.lootButtons do
        CustomLootFrame.lootButtons[i]:Hide()
    end

    -- Show the custom loot frame
    CustomLootFrame:Show()

    -- Print the total number of loot items
    --print("Total loot items:", numLootItems)
end


function UpdateCustomLootFrame()
    local numLootItems = GetNumLootItems()
    
    -- Adjust the frame size based on the remaining number of loot items (+1 for the Cancel button)
    local buttonHeight = 20  -- Height of each loot button
    local frameHeight = 60 + (buttonHeight * (numLootItems + 1))  -- Adjust as needed to include the Cancel button
    CustomLootFrame:SetHeight(frameHeight)

    -- Update loot buttons or hide them if no items remain
    for i = 1, numLootItems do
        local lootButton = CustomLootFrame.lootButtons[i]
        if lootButton then
            -- Update the item info
            local slot = i
            local texture, item, quantity, quality, locked = GetLootSlotInfo(slot)
            lootButton.slot = slot
            if item == "" or not item then
                -- Hide the button if the item name is empty
                lootButton:Hide()
            else
                -- If there is an item, proceed with updating the quality and showing the button
                lootButton.itemNameText:SetText(item)
                --if quality then
                --    local r, g, b = GetItemQualityColor(quality)
                --    lootButton.itemNameText:SetTextColor(r, g, b)
                --else
                lootButton.itemNameText:SetTextColor(1, 0.5, 0)  -- Set default color to orange
                --end
                lootButton:Show()
            end
        end
    end

    -- Hide unused loot buttons
    for i = numLootItems + 1, #CustomLootFrame.lootButtons do
        CustomLootFrame.lootButtons[i]:Hide()
    end

    -- Create or update the Cancel button if necessary
    if not CustomLootFrame.cancelButton then
        CustomLootFrame.cancelButton = CreateFrame("Button", "CustomLootCancelButton", CustomLootFrame)
        CustomLootFrame.cancelButton:SetHeight(buttonHeight)
        CustomLootFrame.cancelButton:SetWidth(280)
        CustomLootFrame.cancelButton:EnableMouse(true)

        -- Set the "Cancel" text
        CustomLootFrame.cancelButton.cancelText = CustomLootFrame.cancelButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        CustomLootFrame.cancelButton.cancelText:SetText("Cancel")
        CustomLootFrame.cancelButton.cancelText:SetPoint("TOPLEFT", CustomLootFrame.cancelButton, "TOPLEFT", 2, -2)
        CustomLootFrame.cancelButton.cancelText:SetTextColor(1, 1, 1) -- White color

        -- Set up hover effect for Cancel button
        CustomLootFrame.cancelButton:SetScript("OnEnter", function(self)
            self.cancelText:SetTextColor(1, 1, 0) -- Yellow color
        end)

        CustomLootFrame.cancelButton:SetScript("OnLeave", function(self)
            self.cancelText:SetTextColor(1, 1, 1) -- White color
        end)

        -- Set up click handler to hide the loot frame
        CustomLootFrame.cancelButton:SetScript("OnClick", function(self)
            HideCustomLootFrame()
        end)
    end

    -- Position the Cancel button just below the last loot button
    CustomLootFrame.cancelButton:SetPoint("TOPLEFT", CustomLootFrame, "TOPLEFT", 10, -40 - (buttonHeight * numLootItems))

    -- Show the Cancel button
    CustomLootFrame.cancelButton:Show()

    -- If no loot items remain, close the frame
    if numLootItems == 0 then
        HideCustomLootFrame()
    end
end



-- Hide the custom loot frame
function HideCustomLootFrame()
    if CustomLootFrame then
        CustomLootFrame:Hide()
    end
end
