-- Default settings
local defaultSettings = {
    textColor = { r = 1, g = 1, b = 1 }, -- White color
    duration = 2,
    xOffset = 1100,
    yOffset = 570,
    totalDistance = 200,
    spacing = 15,
}

-- Table to keep track of active reputation gain frames
local activeFrames = {}

-- On addon loaded event to initialize settings
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "RepTracker" then
        -- Initialize settings table if it doesn't exist
        if not RepTrackerSettings then
            RepTrackerSettings = {}
        end
        -- Set missing settings to default values
        for k, v in pairs(defaultSettings) do
            if RepTrackerSettings[k] == nil then
                RepTrackerSettings[k] = v
            end
        end

        -- Create the options panel after settings are initialized
        CreateOptionsPanel()

        -- Unregister the event after initialization
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

-- Function to create the options panel
function CreateOptionsPanel()
    -- Create the options panel
    local optionsPanel = CreateFrame("Frame", "RepTrackerOptionsPanel", InterfaceOptionsFramePanelContainer)
    optionsPanel.name = "Reputation Tracker"
    InterfaceOptions_AddCategory(optionsPanel)

    -- Text Color Picker
    local colorPickerLabel = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    colorPickerLabel:SetPoint("TOPLEFT", 16, -16)
    colorPickerLabel:SetText("Text Color")

    local colorSwatch = CreateFrame("Button", nil, optionsPanel)
    colorSwatch:SetSize(16, 16)
    colorSwatch:SetPoint("LEFT", colorPickerLabel, "RIGHT", 10, 0)
    colorSwatch:SetNormalTexture("Interface\\ChatFrame\\ChatFrameColorSwatch")
    colorSwatch:GetNormalTexture():SetVertexColor(RepTrackerSettings.textColor.r, RepTrackerSettings.textColor.g, RepTrackerSettings.textColor.b)

    -- OnClick handler for the color picker
    colorSwatch:SetScript("OnClick", function()
        ColorPickerFrame:SetColorRGB(RepTrackerSettings.textColor.r, RepTrackerSettings.textColor.g, RepTrackerSettings.textColor.b)
        ColorPickerFrame.hasOpacity = false
        ColorPickerFrame.previousValues = { RepTrackerSettings.textColor.r, RepTrackerSettings.textColor.g, RepTrackerSettings.textColor.b }
        ColorPickerFrame.func = function()
            local r, g, b = ColorPickerFrame:GetColorRGB()
            RepTrackerSettings.textColor.r = r
            RepTrackerSettings.textColor.g = g
            RepTrackerSettings.textColor.b = b
            colorSwatch:GetNormalTexture():SetVertexColor(r, g, b)
        end
        ColorPickerFrame.cancelFunc = function(previousValues)
            local r, g, b = unpack(previousValues)
            RepTrackerSettings.textColor.r = r
            RepTrackerSettings.textColor.g = g
            RepTrackerSettings.textColor.b = b
            colorSwatch:GetNormalTexture():SetVertexColor(r, g, b)
        end
        ColorPickerFrame:Hide() -- Need to hide and show to refresh the frame
        ColorPickerFrame:Show()
    end)

    -- Duration Slider
    local durationSlider = CreateFrame("Slider", "RepTrackerDurationSlider", optionsPanel, "OptionsSliderTemplate")
    durationSlider:SetPoint("TOPLEFT", colorPickerLabel, "BOTTOMLEFT", 0, -30)
    durationSlider:SetMinMaxValues(1, 10)
    durationSlider:SetValueStep(0.5)
    durationSlider:SetValue(RepTrackerSettings.duration)
    durationSlider:SetWidth(200)
    _G[durationSlider:GetName() .. "Low"]:SetText("1s")
    _G[durationSlider:GetName() .. "High"]:SetText("10s")
    _G[durationSlider:GetName() .. "Text"]:SetText("Duration: " .. RepTrackerSettings.duration .. "s")

    durationSlider:SetScript("OnValueChanged", function(self, value)
        value = tonumber(string.format("%.1f", value))
        RepTrackerSettings.duration = value
        _G[self:GetName() .. "Text"]:SetText("Duration: " .. value .. "s")
    end)

    -- X Position Slider
    local xPosSlider = CreateFrame("Slider", "RepTrackerXPosSlider", optionsPanel, "OptionsSliderTemplate")
    xPosSlider:SetPoint("TOPLEFT", durationSlider, "BOTTOMLEFT", 0, -30)
    xPosSlider:SetMinMaxValues(0, UIParent:GetWidth())
    xPosSlider:SetValueStep(10)
    xPosSlider:SetValue(RepTrackerSettings.xOffset)
    xPosSlider:SetWidth(200)
    _G[xPosSlider:GetName() .. "Low"]:SetText("0")
    _G[xPosSlider:GetName() .. "High"]:SetText(tostring(math.floor(UIParent:GetWidth())))
    _G[xPosSlider:GetName() .. "Text"]:SetText("X Position: " .. RepTrackerSettings.xOffset)

    xPosSlider:SetScript("OnValueChanged", function(self, value)
        value = tonumber(string.format("%.0f", value))
        RepTrackerSettings.xOffset = value
        _G[self:GetName() .. "Text"]:SetText("X Position: " .. value)
    end)

    -- Y Position Slider
    local yPosSlider = CreateFrame("Slider", "RepTrackerYPosSlider", optionsPanel, "OptionsSliderTemplate")
    yPosSlider:SetPoint("TOPLEFT", xPosSlider, "BOTTOMLEFT", 0, -30)
    yPosSlider:SetMinMaxValues(0, UIParent:GetHeight())
    yPosSlider:SetValueStep(10)
    yPosSlider:SetValue(RepTrackerSettings.yOffset)
    yPosSlider:SetWidth(200)
    _G[yPosSlider:GetName() .. "Low"]:SetText("0")
    _G[yPosSlider:GetName() .. "High"]:SetText(tostring(math.floor(UIParent:GetHeight())))
    _G[yPosSlider:GetName() .. "Text"]:SetText("Y Position: " .. RepTrackerSettings.yOffset)

    yPosSlider:SetScript("OnValueChanged", function(self, value)
        value = tonumber(string.format("%.0f", value))
        RepTrackerSettings.yOffset = value
        _G[self:GetName() .. "Text"]:SetText("Y Position: " .. value)
    end)

    -- Total Distance Slider
    local distanceSlider = CreateFrame("Slider", "RepTrackerDistanceSlider", optionsPanel, "OptionsSliderTemplate")
    distanceSlider:SetPoint("TOPLEFT", yPosSlider, "BOTTOMLEFT", 0, -30)
    distanceSlider:SetMinMaxValues(50, 500)
    distanceSlider:SetValueStep(10)
    distanceSlider:SetValue(RepTrackerSettings.totalDistance)
    distanceSlider:SetWidth(200)
    _G[distanceSlider:GetName() .. "Low"]:SetText("50")
    _G[distanceSlider:GetName() .. "High"]:SetText("500")
    _G[distanceSlider:GetName() .. "Text"]:SetText("Total Distance: " .. RepTrackerSettings.totalDistance)

    distanceSlider:SetScript("OnValueChanged", function(self, value)
        value = tonumber(string.format("%.0f", value))
        RepTrackerSettings.totalDistance = value
        _G[self:GetName() .. "Text"]:SetText("Total Distance: " .. value)
    end)

    -- Spacing Slider
    local spacingSlider = CreateFrame("Slider", "RepTrackerSpacingSlider", optionsPanel, "OptionsSliderTemplate")
    spacingSlider:SetPoint("TOPLEFT", distanceSlider, "BOTTOMLEFT", 0, -30)
    spacingSlider:SetMinMaxValues(10, 100)
    spacingSlider:SetValueStep(5)
    spacingSlider:SetValue(RepTrackerSettings.spacing)
    spacingSlider:SetWidth(200)
    _G[spacingSlider:GetName() .. "Low"]:SetText("10")
    _G[spacingSlider:GetName() .. "High"]:SetText("100")
    _G[spacingSlider:GetName() .. "Text"]:SetText("Spacing: " .. RepTrackerSettings.spacing)

    spacingSlider:SetScript("OnValueChanged", function(self, value)
        value = tonumber(string.format("%.0f", value))
        RepTrackerSettings.spacing = value
        _G[self:GetName() .. "Text"]:SetText("Spacing: " .. value)
    end)

    -- Panel refresh function
    optionsPanel.refresh = function()
        -- Update the color swatch
        colorSwatch:GetNormalTexture():SetVertexColor(RepTrackerSettings.textColor.r, RepTrackerSettings.textColor.g, RepTrackerSettings.textColor.b)
        -- Update sliders
        durationSlider:SetValue(RepTrackerSettings.duration)
        xPosSlider:SetValue(RepTrackerSettings.xOffset)
        yPosSlider:SetValue(RepTrackerSettings.yOffset)
        distanceSlider:SetValue(RepTrackerSettings.totalDistance)
        spacingSlider:SetValue(RepTrackerSettings.spacing)
    end
end

-- Event frame to register for reputation gain events
local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "CHAT_MSG_COMBAT_FACTION_CHANGE" then
        local message = ...

        -- Pattern to extract the icon
        local iconPattern = "|T.-|t"
        -- Pattern to extract the amount
        local amountPattern = "(%d+)"

        -- Extract the icon if present
        local icon = string.match(message, iconPattern) or ""

        -- Remove the icon from the message
        local messageWithoutIcon = string.gsub(message, iconPattern, "")

        -- Extract the amount
        local amount = string.match(messageWithoutIcon, amountPattern)

        if amount then
            -- Create and display the reputation gain frame
            CreateRepGainFrame(icon, amount)
        end
    end
end)

-- Function to create and animate the reputation gain frame
function CreateRepGainFrame(icon, amount)
    -- Create a new frame
    local repFrame = CreateFrame("Frame", nil, UIParent)
    repFrame:SetSize(200, 24)  -- Width and height of the frame

    -- Calculate the starting Y offset based on the number of active frames
    local numActiveFrames = #activeFrames
    local spacing = RepTrackerSettings.spacing  -- Use user-defined spacing
    local startY = numActiveFrames * spacing

    -- Get settings from the saved variables
    local xOffset = RepTrackerSettings.xOffset
    local yOffset = -startY + RepTrackerSettings.yOffset

    repFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", xOffset, yOffset)

    -- Create a font string for the text
    local repText = repFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    repText:SetPoint("CENTER", repFrame, "CENTER")
    repText:SetText(icon .. " " .. amount)

    -- Set the text color from settings
    local color = RepTrackerSettings.textColor
    repText:SetTextColor(color.r, color.g, color.b)

    -- Initialize animation variables
    repFrame.elapsed = 0
    repFrame:SetAlpha(1)

    -- Get duration and total distance from settings
    local duration = RepTrackerSettings.duration
    local totalDistance = RepTrackerSettings.totalDistance

    -- OnUpdate script to handle animation
    repFrame:SetScript("OnUpdate", function(self, elapsed)
        self.elapsed = self.elapsed + elapsed

        -- Move the frame upwards over time
        local progress = self.elapsed / duration  -- Progress from 0 to 1 over the duration
        local currentYOffset = yOffset + (totalDistance * progress)  -- Calculate new yOffset

        -- Update the frame's position
        self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", xOffset, currentYOffset)

        -- Fade out over the last second of the duration
        if self.elapsed >= (duration - 1) then
            local fadeProgress = (self.elapsed - (duration - 1)) / 1  -- Progress from 0 to 1 over the last second
            self:SetAlpha(1 - fadeProgress)
        end

        if self.elapsed >= duration then
            -- Remove the frame after the duration
            self:SetScript("OnUpdate", nil)
            self:Hide()

            -- Remove the frame from the activeFrames table
            for i, frame in ipairs(activeFrames) do
                if frame == self then
                    table.remove(activeFrames, i)
                    break
                end
            end

            self = nil
        end
    end)

    -- Add the frame to the active frames table
    table.insert(activeFrames, repFrame)
end
