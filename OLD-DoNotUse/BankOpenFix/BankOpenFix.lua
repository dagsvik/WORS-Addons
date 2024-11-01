-- Function to check and keep GuildBank columns visible
local function EnsureColumnVisibility(self)
    -- Check if the GuildBankFrame is visible
    if GuildBankFrame and GuildBankFrame:IsShown() then
        -- If the column is hidden, show it again
        if not self:IsShown() then
            self:Show()
            --print(self:GetName() .. " was hidden and is now being shown.")
        end
    end
end
-- Function to hide the GuildBankFrameBuyInfo whenever it tries to show
local function HideGuildBankBuyInfoOnShow(self)
    self:Hide()  -- Hide the frame immediately
    --print(self:GetName() .. " tried to show but was hidden.")
end

local function RemoveGuildBankTabTextures()
    -- Loop through GuildBankTab1 to GuildBankTab6
    for tabIndex = 1, 6 do
        -- Get the tab frame
        local tabFrame = _G["GuildBankTab" .. tabIndex]

        if tabFrame then
            -- Get all regions (textures, fonts, etc.)
            local regions = {tabFrame:GetRegions()}
            
            -- Check if Region 1 exists and is a texture
            local region = regions[1]  -- Assuming Region 1 is the unnamed texture
            if region and region:GetObjectType() == "Texture" then
                region:SetTexture(nil)  -- Remove the texture by setting it to nil
        
            end
        end
    end
end




-- Function to hook the Hide event for all GuildBank columns
local function HookColumnHideEvents()
    for i = 1, 7 do
        local column = _G["GuildBankColumn" .. i]
        if column then
            -- Hook the Hide event for the column
            column:HookScript("OnHide", EnsureColumnVisibility)
            --print("Hooked Hide event for " .. column:GetName())
        end
    end
end

local function HookTabHideEvents()
    for i = 1, 6 do
        local column = _G["GuildBankTab" .. i]
        if column then
            -- Hook the Hide event for the column
            column:HookScript("OnHide", EnsureColumnVisibility)
            --print("Hooked Hide event for " .. column:GetName())
        end
    end
end

local function HookBuyInfoShowEvents()
    -- Hook into the Show event of GuildBankFrameBuyInfo
    if GuildBankFrameBuyInfo then
    GuildBankFrameBuyInfo:HookScript("OnShow", HideGuildBankBuyInfoOnShow)
    --print("Hooked OnShow event for GuildBankFrameBuyInfo.")

    end
end

-- Function to hide the unnamed texture in GuildBankWithdrawControls
local function HideGuildBankWithdrawControlsTexture()
    -- Get the unnamed texture (first texture in the regions list)
    local texture = select(1, GuildBankWithdrawControls:GetRegions())
    
    if texture then
        texture:Hide()
        --print("Unnamed texture in GuildBankWithdrawControls has been hidden.")
    else
        --print("Texture not found.")
    end
end

-- Function that runs when the texture changes
local function OnTextureChanged(self, texture)
    -- Debug message to verify the function is being called
    --print("Texture changed:", texture)

    -- Check if the texture contains "noted_"
    if texture and string.find(texture, "Interface\\Icons\\noted_") then
        -- Extract the new texture name by removing "noted_"
        local newName = string.gsub(texture, "^Interface\\Icons\\noted_", "")
        local newTexture = "Interface/Icons/" .. newName

        -- Set the corrected texture
        self:SetTexture(newTexture)

    end
end

-- Function to loop through guild bank slots and hook textures
local function GuildBankIconsChangedHook()
    for column = 1, 7 do
        for button = 1, 14 do
            local buttonFrame = _G["GuildBankColumn" .. column .. "Button" .. button .. "IconTexture"]

            if buttonFrame then
                -- Check if the hook is already applied to avoid multiple hooks
                if not buttonFrame.hooked then
                    hooksecurefunc(buttonFrame, "SetTexture", OnTextureChanged)
                    buttonFrame.hooked = true -- Mark this frame as hooked
                    --print("Hooked to texture for GuildBankColumn" .. column .. "Button" .. button)

                end

            end
        end
    end
end

-- Function to loop through guild bank slots and replace textures
local function ReplaceGuildBankNotedIcons()
    for column = 1, 7 do
        for button = 1, 14 do
            -- Calculate the slot index
            local slot = (column - 1) * 14 + button
    
            -- Get the current guild bank tab
            local tab = GetCurrentGuildBankTab()
    
            -- Get item information from the guild bank
            local texture, itemCount, locked = GetGuildBankItemInfo(tab, slot)
    
            -- Check if the texture starts with "Interface\\Icons\\noted_"
            if texture and string.find(texture, "^Interface\\Icons\\noted_") then
                -- Extract the name after "noted_"
                local newName = string.gsub(texture, "^Interface\\Icons\\noted_", "")
    
                -- Construct the new texture path using "/" for setting the texture
                local newTexture = "Interface/Icons/" .. newName
                --print("New texture path:", newTexture)
    
                -- Get the icon texture for the button
                local buttonFrame = _G["GuildBankColumn" .. column .. "Button" .. button .. "IconTexture"]
                --/script local t=_G["GuildBankColumn1Button1IconTexture"]; if t then print("Type:", t:GetObjectType()); t:SetTexture("Interface/Icons/burntfood"); print("New texture set."); else print("Texture not found."); end

                if buttonFrame then
                    -- Replace the texture with the new one
                    --print("Type:", buttonFrame:GetObjectType())
                    --print("Replacing texture in GuildBankColumn" .. column .. "Button" .. button)
                    local newTexture2 = "Interface/Icons/burntfood"

                    buttonFrame:SetTexture(newTexture)


                end
            end
        end
    end
    
end


local function ReskinCloseButton()
    local frame = _G["GuildBankFrame"]
    if frame then
        --print("Checking children of GuildBankFrame:")
        local children = {frame:GetChildren()}
        for i, child in ipairs(children) do
            local childName = child:GetName()
            if not childName then
                
                --print(i, "Unnamed Child identified")
                -- We don't need to set a name; just use the reference to the unnamed frame
                local unnamedFrame = child
                --print("Set unnamedFrame reference")

                -- Get the BackpackCloseButton textures
                local closeButton = _G["BackpackCloseButton"]
                --print("Set closebutton")

                if closeButton then
                    local normalTexture = closeButton:GetNormalTexture()
                    local highlightTexture = closeButton:GetHighlightTexture()
                    local pushedTexture = closeButton:GetPushedTexture()
                    --print("Got textures")

                    -- Apply the same textures to the new frame
                    if normalTexture then unnamedFrame:SetNormalTexture(normalTexture:GetTexture()) end
                    if highlightTexture then unnamedFrame:SetHighlightTexture(highlightTexture:GetTexture()) end
                    if pushedTexture then unnamedFrame:SetPushedTexture(pushedTexture:GetTexture()) end
                   

                    -- Optionally set the size or position to match BackpackCloseButton
                    unnamedFrame:SetSize(closeButton:GetWidth(), closeButton:GetHeight())
                    unnamedFrame:SetPoint("TOPRIGHT", GuildBankFrame, "TOPRIGHT", -11, -1)  -- Adjust as needed
                    --print("Set position")

                end
            end
        end

    end
end

local savedPosition = { point = nil, relativeTo = nil, relativePoint = nil, xOfs = nil, yOfs = nil }

local function SaveFramePosition(frame)
    local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint()
    savedPosition = { point = point, relativeTo = relativeTo, relativePoint = relativePoint, xOfs = xOfs, yOfs = yOfs }
end

local function RestoreFramePosition(frame)
    if savedPosition.point then
        frame:ClearAllPoints()
        frame:SetPoint(savedPosition.point, savedPosition.relativeTo, savedPosition.relativePoint, savedPosition.xOfs, savedPosition.yOfs)
    end
end

local function MakeGuildBankFrameMovable()
    local frame = _G["GuildBankFrame"]

    if frame then
        -- Enable mouse interaction
        frame:EnableMouse(true)
        frame:SetMovable(true)
        frame:RegisterForDrag("LeftButton")

        -- Set scripts to handle dragging
        frame:SetScript("OnDragStart", function(self)
            self:StartMoving()
        end)

        frame:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
            SaveFramePosition(self)  -- Save the position when the frame stops moving
        end)

        -- Restore the position when the frame is shown again
        frame:SetScript("OnShow", function(self)
            RestoreFramePosition(self)  -- Restore saved position when frame is reopened
        end)

        -- Optionally, keep the frame within the screen bounds after moving
        frame:SetClampedToScreen(true)
    end
end


local function HideGuildBankColumnElements()
    for col = 1, 7 do
        -- Hide the background of each column (e.g., GuildBankColumn1Background, GuildBankColumn2Background, etc.)
        local columnBackground = _G["GuildBankColumn" .. col .. "Background"]
        if columnBackground then
            columnBackground:Hide()
            --print("Background hidden for GuildBankColumn" .. col)
        end

    -- Iterate over buttons 1 to 14 in each column
    for btn = 1, 14 do
        -- Get the button
        local button = _G["GuildBankColumn" .. col .. "Button" .. btn]

        if button then
            -- Get the icon border and normal texture for each button
            local iconBorder = _G["GuildBankColumn" .. col .. "Button" .. btn .. "IconBorder"]
            local normalTexture = _G["GuildBankColumn" .. col .. "Button" .. btn .. "NormalTexture"]
            local pushedTexture = button:GetPushedTexture()  -- Get the click (pushed) texture

            if iconBorder then
                -- Completely remove the border by setting its texture to nil
                iconBorder:SetTexture(nil)  -- Removes the border texture
                iconBorder:Hide()  -- Optionally hide it as well
            end

            if normalTexture then
                normalTexture:SetTexture(nil)  -- Removes the normal texture
                normalTexture:Hide()  -- Optionally hide it as well
            end

            if pushedTexture then
                pushedTexture:SetTexture(nil)  -- Removes the pushed (click) texture
                pushedTexture:Hide()  -- Optionally hide it as well
            end
        end
    end

    end
    local offset = 12  -- Offset to make the frame 10px larger in all directions

    local newFrame = CreateFrame("Frame", "NewGuildBankFrame", GuildBankFrame)
    
    -- Set the size and position based on the positions of GuildBankColumn1Button1 and GuildBankColumn7Button14
    local topLeftButton = _G["GuildBankColumn1Button1"]
    local bottomRightButton = _G["GuildBankColumn7Button14"]
    
    if topLeftButton and bottomRightButton then
        -- Anchor to top left of GuildBankColumn1Button1, with offset (-offset, +offset)
        newFrame:SetPoint("TOPLEFT", topLeftButton, "TOPLEFT", -offset, offset)
        
        -- Anchor to bottom right of GuildBankColumn7Button14, with offset (+offset, -offset)
        newFrame:SetPoint("BOTTOMRIGHT", bottomRightButton, "BOTTOMRIGHT", offset, -offset)
    
        newFrame:SetBackdrop({
            bgFile = "Interface\\WORS\\OldSchoolBackground2",
            edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",
            tile = false, tileSize = 32, edgeSize = 32,
            insets = { left = 0, right = 0, top = 0, bottom = 0 }
        })
            -- Now create the second frame, positioned directly below the first frame
        local secondFrame = CreateFrame("Frame", "SecondGuildBankFrame", GuildBankFrame)
        
        -- Anchor the second frame's top to the bottom of the first frame
        secondFrame:SetPoint("TOPLEFT", newFrame, "BOTTOMLEFT", 0, 5)  -- 10px higher
        secondFrame:SetPoint("TOPRIGHT", newFrame, "BOTTOMRIGHT", 0, 5)  -- 10px higher
        

        -- Set the height of the second frame to 60px
        secondFrame:SetHeight(60)

        -- Set the same backdrop for the second frame
        secondFrame:SetBackdrop({
            bgFile = "Interface\\WORS\\OldSchoolBackground2",
            edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",
            tile = false, tileSize = 32, edgeSize = 32,
            insets = { left = 0, right = 0, top = 0, bottom = 0 }
        })
        -- Resize GuildBankDepositWornItemsButton and position it 10px from the right of secondFrame
        GuildBankDepositWornItemsButton:SetSize(38, 38); 
        GuildBankDepositWornItemsButton:ClearAllPoints(); 
        GuildBankDepositWornItemsButton:SetPoint("RIGHT", SecondGuildBankFrame, "RIGHT", -10, 0)

        -- Resize GuildBankDepositInventoryButton and position it 10px from the right of GuildBankDepositWornItemsButton
        GuildBankDepositInventoryButton:SetSize(38, 38); 
        GuildBankDepositInventoryButton:ClearAllPoints(); 
        GuildBankDepositInventoryButton:SetPoint("RIGHT", GuildBankDepositWornItemsButton, "LEFT", -10, 0)


        local ThirdFrame = CreateFrame("Frame", "ThirdGuildBankFrame", GuildBankFrame)
        
        -- Anchor the second frame's top to the bottom of the first frame
        ThirdFrame:SetPoint("BOTTOMLEFT", newFrame, "TOPLEFT", 0, -5)  -- 10px higher
        ThirdFrame:SetPoint("BOTTOMRIGHT", newFrame, "TOPRIGHT", 0, -5)  -- 10px higher
        

        -- Set the height of the second frame to 60px
        ThirdFrame:SetHeight(60)

        -- Set the same backdrop for the second frame
        ThirdFrame:SetBackdrop({
            bgFile = "Interface\\WORS\\OldSchoolBackground2",
            edgeFile = "Interface\\WORS\\OldSchool-Dialog-Border",
            tile = false, tileSize = 32, edgeSize = 32,
            insets = { left = 0, right = 0, top = 0, bottom = 0 }
        })
        -- Resize GuildBankDepositWornItemsButton and position it 10px from the right of secondFrame
        GuildBankTab1:SetSize(38, 38); 
        GuildBankTab1:ClearAllPoints(); 
        GuildBankTab1:SetPoint("LEFT", ThirdGuildBankFrame, "LEFT", 10, 7)

        -- Resize GuildBankDepositInventoryButton and position it 10px from the right of GuildBankDepositWornItemsButton
        GuildBankTab2:SetSize(38, 38); 
        GuildBankTab2:ClearAllPoints(); 
        GuildBankTab2:SetPoint("LEFT", GuildBankTab1, "RIGHT", 10, 0)

        GuildBankTab3:SetSize(38, 38); 
        GuildBankTab3:ClearAllPoints(); 
        GuildBankTab3:SetPoint("LEFT", GuildBankTab2, "RIGHT", 10, 0)

        GuildBankTab4:SetSize(38, 38); 
        GuildBankTab4:ClearAllPoints(); 
        GuildBankTab4:SetPoint("LEFT", GuildBankTab3, "RIGHT", 10, 0)

        GuildBankTab5:SetSize(38, 38); 
        GuildBankTab5:ClearAllPoints(); 
        GuildBankTab5:SetPoint("LEFT", GuildBankTab4, "RIGHT", 10, 0)

        GuildBankTab6:SetSize(38, 38); 
        GuildBankTab6:ClearAllPoints(); 
        GuildBankTab6:SetPoint("LEFT", GuildBankTab5, "RIGHT", 10, 0)

   
        --Hide old legacy stuff
        if GuildBankFrameLeft then GuildBankFrameTab1:Hide() end
        if GuildBankFrameLeft then GuildBankFrameLeft:Hide() end
        if GuildBankFrameRight then GuildBankFrameRight:Hide() end
        if GuildBankFramePortrait then GuildBankFramePortrait:Hide() end
        if GuildBankEmblemFrame then GuildBankEmblemFrame:Hide() end
        -- Hide each text element by its unique identifier
        --print("GuildBankFrameLeft, GuildBankFrameRight, and GuildBankFramePortrait textures hidden.")
        

        HideGuildBankWithdrawControlsTexture()
        GuildBankIconsChangedHook()
        ReplaceGuildBankNotedIcons()
        ReskinCloseButton()
        MakeGuildBankFrameMovable()
        RemoveGuildBankTabTextures()
        
    end
    
end
local firstErrorChatMessage = true

-- Function to handle system error messages
local function OnGuildBankMessageError()
    --print("OnGuildBankMessageError function")

    if firstErrorChatMessage then
        --print("First Error Chat Message")
        QueryGuildBankTab(GetCurrentGuildBankTab())  -- Refresh the Guild Bank Tab
        firstErrorChatMessage = false  -- Prevent repeated refreshes
    end
end

-- Function to register CHAT_MSG_SYSTEM when the Guild Bank is opened
local function RegisterChatMsgSystemEvent()
    local eventFrame = CreateFrame("Frame")  -- Create a new event frame for CHAT_MSG_SYSTEM
    
    eventFrame:RegisterEvent("CHAT_MSG_SYSTEM")  -- Register the event

    -- Set up the OnEvent handler for the system message
    eventFrame:SetScript("OnEvent", function(self, event, ...)
        if event == "CHAT_MSG_SYSTEM" then
            OnGuildBankMessageError()  -- Call your function when the event fires
        end
    end)
    
    --print("CHAT_MSG_SYSTEM event registered")
end


local isFirstRun = true

-- Function to handle the GUILDBANKFRAME_OPENED event
local function OnGuildBankOpened()

    if(isFirstRun) then
        HookColumnHideEvents()  
        HookTabHideEvents()
        HookBuyInfoShowEvents()
        Backpack:Show() --Optional Just normally nice to show the backpack when using the bank.
        HideGuildBankColumnElements()
        isFirstRun = false
        RegisterChatMsgSystemEvent()
    end
end

-- Hook the function to the PLAYER_LOGIN event to register the guild bank event
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        -- Register the GUILDBANKFRAME_OPENED event
        self:RegisterEvent("GUILDBANKFRAME_OPENED")
        self:SetScript("OnEvent", function(self, event)
            if event == "GUILDBANKFRAME_OPENED" then
                OnGuildBankOpened()
            end
        end)
    end
end)

