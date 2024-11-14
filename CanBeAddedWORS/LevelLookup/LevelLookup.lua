-- Empty string used for default value and when loading.
local inputString = "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
local LocalLevelLookupTextElements = nil
local addonPrefix = "LevelLookup"

-- Function to update text elements from an input string
local function UpdateTextElementsFromString(textElements, inputString)
    -- Split the input string into individual values
    local values = {}
    for value in string.gmatch(inputString, "%S+") do
        table.insert(values, value)
    end

    -- Update the text elements
    for index, textElement in ipairs(textElements) do
        if values[index] then
            textElement:SetText(values[index])
        else
            -- No more values; set to empty string or default value
            textElement:SetText("")
        end
    end
end

local function SendLevelRequestMessage(targetPlayer)
    if targetPlayer then
        UpdateTextElementsFromString(LocalLevelLookupTextElements, inputString)
        --sends command to server
        SendChatMessage(".geworslvl " .. targetPlayer, "SAY")

    end
end

-- Function to create the frame and text elements
local function CreateLevelLookupFrame()
    -- Create a new frame named "LevelLookupFrame" attached to the UIParent
    local frame = CreateFrame("Frame", "LevelLookupFrame", UIParent)
    frame:SetSize(219, 310)  -- Set the size of the frame to 219x310 pixels
    frame:SetPoint("CENTER")  -- Position the frame at the center of the screen

    -- Make the frame movable
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)

    -- Create a texture object within the frame
    local texture = frame:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints(frame)  -- Make the texture fill the entire frame

    -- Set the texture file path
    -- Replace "PlayerDataCom" with the actual folder name of your addon if different
    texture:SetTexture("Interface\\AddOns\\LevelLookup\\LevelLookupSymetrical.tga")

    -- Calculate texture coordinates to display only the top-left 219x310 pixels of the 512x512 texture
    local left = 0
    local right = 219 / 512   -- Normalize the width (219 pixels) to the texture's width (512 pixels)
    local top = 0
    local bottom = 310 / 512  -- Normalize the height (310 pixels) to the texture's height (512 pixels)

    -- Set the texture coordinates
    texture:SetTexCoord(left, right, top, bottom)

    -- Create a grid of text elements
    local textElements = {}  -- Table to store the text elements

    -- Starting position
    local startX = 45
    local startY = -55
    local Ydelta = 32   -- Vertical spacing between rows
    local Xdelta = 72   -- Horizontal spacing between columns

    -- Number of columns and rows
    local numColumns = 3
    local numRows = 8

    for row = 0, numRows - 1 do  -- Rows from 0 to 7
        for col = 0, numColumns - 1 do  -- Columns from 0 to 2
            -- Create the text element
            local text = frame:CreateFontString(nil, "OVERLAY")
            text:SetFont("Fonts\\runescape.ttf", 12)
            text:SetText("")  -- Initialize with empty text
            -- Calculate position
            local xPos = startX + col * Xdelta
            local yPos = startY - row * Ydelta
            text:SetPoint("TOPLEFT", frame, "TOPLEFT", xPos, yPos)
            text:SetTextColor(1, 1, 1, 1)  -- Set text color to white
            -- Store the text element
            table.insert(textElements, text)
        end
    end
    
    -- Create the input field (EditBox)
    local inputField = CreateFrame("EditBox", nil, frame)
    inputField:SetFont("Fonts\\runescape.ttf", 18)
    inputField:SetSize(160, 22)  -- Adjust size to match your texture's input field area
    inputField:SetPoint("TOPLEFT", frame, "TOPLEFT", 30, -5)  -- Adjust position as needed
    inputField:SetAutoFocus(false)  -- Prevent the field from auto-focusing when shown
    inputField:SetMultiLine(false)
    inputField:SetText("")  -- Initial text
    inputField:EnableMouse(true)
    inputField:SetTextColor(1, 1, 1, 1)  -- White text
    inputField:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)
    inputField:SetScript("OnEnterPressed", function(self)
        local inputText = self:GetText()
        if #inputText > 2 then
        SendLevelRequestMessage(inputText)
        end
        self:ClearFocus()
    end)
    
    -- Make the background transparent
    inputField:SetBackdrop(nil)  -- Remove any default backdrop


    -- Return both the frame and the text elements table
    return frame, textElements
end


local LocalLevelLookupFrame = nil
LocalLevelLookupFrame, LocalLevelLookupTextElements = CreateLevelLookupFrame()
UpdateTextElementsFromString(LocalLevelLookupTextElements, inputString)

-- Function to handle receiving addon messages
local function OnAddonMessageReceived(prefix, message, channel, sender)
    if prefix == addonPrefix then
        --print("Received message from", sender, ":", message)
        if message == "GetLevels" then
            --levels = GetAllSkillLevels()
            --SendAddonMessage(addonPrefix, levels, "WHISPER", sender)
            print("Sending message to" .. sender)
            return
        end
        print("Got message from sender: " .. sender)

        UpdateTextElementsFromString(LocalLevelLookupTextElements, message)

    end
end


-- Register the CHAT_MSG_ADDON event to handle incoming messages
local messageFrame = CreateFrame("Frame")
messageFrame:RegisterEvent("CHAT_MSG_ADDON")
messageFrame:SetScript("OnEvent", function(_, event, prefix, message, channel, sender)
    OnAddonMessageReceived(prefix, message, channel, sender)
end)
--print("After msg hook Addon msg")

-- Test function to use in chat for sending a message
SLASH_TESTSEND1 = "/testsend"
SlashCmdList["TESTSEND"] = function(msg)
    local target, message = strsplit(" ", msg, 2)
    SendLevelRequestMessage(target)
end

-- Test function to use in chat for sending a message to yourself (useful for solo testing)
SLASH_TESTSENDSELF1 = "/testself"
SlashCmdList["TESTSENDSELF"] = function(message)
    --print("Start Test Send self")
    local playerName = UnitName("player") -- Gets your own character's name
    SendLevelRequestMessage(playerName)
    --print("End Test Send self")

end


LevelLookupFrame:Hide()
-- Function to create the minimap button Using LibDBIcon and Ace3
local LevelLookupFrameAddon = LibStub("AceAddon-3.0"):NewAddon("LevelLookupFrame")
LevelLookupFrameMinimapButton = LibStub("LibDBIcon-1.0", true)

local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("LevelLookupFrame", {
	type = "data source",
	text = "LevelLookupFrame",
	icon = "INTERFACE\\ICONS\\strengthcapet",
	OnClick = function(self, btn)
        if btn == "LeftButton" then
            if LevelLookupFrame:IsShown() then
                LevelLookupFrame:Hide()
            else
                LevelLookupFrame:Show()
            end
        end
	end,

})

function LevelLookupFrameAddon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("LevelLookupFrameMinimapPOS", {
		profile = {
			minimap = {
				hide = false,
			},
		},
	})
	LevelLookupFrameMinimapButton:Register("LevelLookupFrame", miniButton, self.db.profile.minimap)
end

LevelLookupFrameMinimapButton:Show("LevelLookupFrame")
