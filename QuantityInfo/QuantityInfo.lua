-- Create a frame to listen for events
local eventFrame = CreateFrame("Frame")
-- Register the PLAYER_LOGIN event
eventFrame:RegisterEvent("PLAYER_LOGIN")

-- Function to format money with spaces between every three digits
local function FormatCopperWithSpaces(money)
    -- Billions
    local billions = floor(money / 1000000000)
    -- Millions
    local millions = floor((money % 1000000000) / 1000000)
    -- Thousands
    local thousands = floor((money % 1000000) / 1000)
    -- Remaining copper
    local copper = money % 1000

    -- Building the formatted string based on non-zero values
    if billions > 0 then
        return format("%d %03d %03d %03d", billions, millions, thousands, copper)
    elseif millions > 0 then
        return format("%d %03d %03d", millions, thousands, copper)
    elseif thousands > 0 then
        return format("%d %03d", thousands, copper)
    else
        return format("%d", copper)
    end
end


-- Function to check if the tooltip is displaying an item
local function IsTooltipShowingItem()
    -- Get the information about the tooltip
    local _, itemLink = GameTooltip:GetItem()
    return itemLink ~= nil
end



-- Function to get the guild bank slot and print the item count
local function GetGuildBankItemCount()
    -- Get the owner of the GameTooltip (this should be a guild bank slot button)
    local owner = GameTooltip:GetOwner()

    if owner and owner:GetName() and owner:GetName():find("GuildBankColumn") then
        -- Extract column and button numbers from the owner name (e.g., "GuildBankColumn5Button9")
        local column, button = owner:GetName():match("GuildBankColumn(%d+)Button(%d+)")

        if column and button then
            -- Convert to numbers
            column = tonumber(column)
            button = tonumber(button)

            -- Calculate the slot index
            local slot = (column - 1) * 14 + button

            -- Get the current guild bank tab
            local tab = GetCurrentGuildBankTab()

            -- Get the item count from the guild bank
            local _, itemCount = GetGuildBankItemInfo(tab, slot)

            -- Print the item count
            if itemCount then
                --print("You are hovering over slot " .. slot .. ". Item count: " .. itemCount)
                return itemCount
            else
                --print("No item in slot " .. slot)
                return 0
            end
        end
    else
        --print("Not hovering over a guild bank slot.")
    end
    return 0
end




local function ModifyTooltipForLargeStack(self)
    -- Check if the tooltip is showing an item
    if IsTooltipShowingItem() then
        -- Get item information
        local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount = GetItemInfo(GameTooltip:GetItem())
        local hoverStackQuantity = GetGuildBankItemCount()
        -- If the stack size is greater than 999, modify the tooltip
        if hoverStackQuantity and hoverStackQuantity > 999 then
            --print(itemStackCount)
            -- Expand the tooltip size (optional, just as a visual cue)
            self:SetWidth(self:GetWidth() + 50)

            -- Add the quantity information to the tooltip
            GameTooltip:AddLine("Quantity: " .. hoverStackQuantity, 1, 1, 1) -- white text
            GameTooltip:Show() -- Update the tooltip to reflect the change
        end
    end
end


-- Set the script to run when the PLAYER_LOGIN event is fired
eventFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
         -- Hook into the GameTooltip's OnShow event
        -- Hook into the GameTooltip's OnShow event
        GameTooltip:HookScript("OnShow", function(self)
            ModifyTooltipForLargeStack(self)

        end)
        -- Check if the Backpack frame exists after login
        if not Backpack then
            --print("Error: Backpack frame not found.")
            return
        end

        -- Create the hover frame
        local hoverFrame = CreateFrame("Frame", "HoverFrame", Backpack)
        
        -- Ensure the hover frame was created
        if not hoverFrame then
            --print("Error: Failed to create hover frame.")
            return
        end

        -- Set the size of the frame (55px wide, 15px tall)
        hoverFrame:SetSize(55, 15)
        --print("Hover frame size set: 55x15.")

        -- Set the position of the frame at the bottom-right corner of the Backpack frame
        -- with a 7px offset to the left and 7px towards the top
        hoverFrame:SetPoint("BOTTOMRIGHT", Backpack, "BOTTOMRIGHT", -7, 7)
        --print("Hover frame positioned in bottom right with 7px offset.")

        -- Make the frame invisible but interactive
        hoverFrame:Hide()
        --print("Hover frame created but hidden (invisible).")

        -- Create a hover text (tooltip) that appears on mouseover
        hoverFrame:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
            local money = GetMoney()
            --print(money)
            -- Format the copper value with spaces between groups of three digits
            local formattedMoney = FormatCopperWithSpaces(money)
            --print(formattedMoney)
            GameTooltip:AddLine(formattedMoney)
            GameTooltip:Show()
            --print("Mouse entered hover frame, tooltip shown.")
        end)

        -- Hide the tooltip when the mouse leaves the frame
        hoverFrame:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
            --print("Mouse left hover frame, tooltip hidden.")
        end)

        -- Ensure the frame is interactable even if invisible
        hoverFrame:EnableMouse(true)
        --print("Hover frame is now interactable.")

        -- Make sure the frame is shown so it's interactive (even though it's invisible)
        hoverFrame:Show()
        --print("Hover frame is now active and should work when hovered.")
    end
end)
