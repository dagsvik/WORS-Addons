-- Define experience table for levels 1 to 99
local experienceTable = {
    [1] = 0,
    [2] = 83,
    [3] = 174,
    [4] = 276,
    [5] = 388,
    [6] = 512,
    [7] = 650,
    [8] = 801,
    [9] = 969,
    [10] = 1154,
    [11] = 1358,
    [12] = 1584,
    [13] = 1833,
    [14] = 2107,
    [15] = 2411,
    [16] = 2746,
    [17] = 3115,
    [18] = 3523,
    [19] = 3973,
    [20] = 4470,
    [21] = 5018,
    [22] = 5624,
    [23] = 6291,
    [24] = 7028,
    [25] = 7842,
    [26] = 8740,
    [27] = 9730,
    [28] = 10824,
    [29] = 12031,
    [30] = 13363,
    [31] = 14833,
    [32] = 16456,
    [33] = 18247,
    [34] = 20224,
    [35] = 22406,
    [36] = 24815,
    [37] = 27473,
    [38] = 30408,
    [39] = 33648,
    [40] = 37224,
    [41] = 41171,
    [42] = 45529,
    [43] = 50339,
    [44] = 55649,
    [45] = 61512,
    [46] = 67983,
    [47] = 75127,
    [48] = 83014,
    [49] = 91721,
    [50] = 101333,
    [51] = 111945,
    [52] = 123660,
    [53] = 136594,
    [54] = 150872,
    [55] = 166636,
    [56] = 184040,
    [57] = 203254,
    [58] = 224466,
    [59] = 247886,
    [60] = 273742,
    [61] = 302288,
    [62] = 333804,
    [63] = 368599,
    [64] = 407015,
    [65] = 449428,
    [66] = 496254,
    [67] = 547953,
    [68] = 605032,
    [69] = 668051,
    [70] = 737627,
    [71] = 814445,
    [72] = 899257,
    [73] = 992895,
    [74] = 1096278,
    [75] = 1210421,
    [76] = 1336443,
    [77] = 1475581,
    [78] = 1629200,
    [79] = 1798808,
    [80] = 1986068,
    [81] = 2192818,
    [82] = 2421087,
    [83] = 2673114,
    [84] = 2951373,
    [85] = 3258594,
    [86] = 3597792,
    [87] = 3972294,
    [88] = 4385776,
    [89] = 4842295,
    [90] = 5346332,
    [91] = 5902831,
    [92] = 6517253,
    [93] = 7195629,
    [94] = 7944614,
    [95] = 8771558,
    [96] = 9684577,
    [97] = 10692629,
    [98] = 11805606,
    [99] = 13034431,
    [100] = 14391160,
	[101] = 15889109,
	[102] = 17542976,
	[103] = 19368992, 
	[104] = 21385073,
	[105] = 23611006,
	[106] = 26068632,
	[107] = 28782069,
	[108] = 31777943,
	[109] = 35085654,
	[110] = 38737661
}

local FactionData = {
    ["Attack"] = 1166,  -- Replace with actual skill name and factionID
    ["Hitpoints"] = 1168,
    ["Mining"] = 1177,

    ["Strength"] = 1172,  -- Add more entries as needed
    ["Agility"] = 1185,
    ["Smithing"] = 1184,

    ["Defence"] = 1167,
    ["Herblore"] = 1182,
    ["Fishing"] = 1175,

    ["Ranged"] = 1171,
    ["Thieving"] = 1189,
    ["Cooking"] = 1179,

    ["Prayer"] = 1170,
    ["Crafting"] = 1180,
    ["Firemaking"] = 1187,

    ["Magic"] = 1169,
    ["Fletching"] = 1181,
    ["Woodcutting"] = 1178,

    ["Runerafting"] = 1183,
    ["Slayer"] = 1188,
    ["Farming"] = 1173,

    ["Construction"] = 1186,
    ["Hunter"] = 1176,
    ["Dungeoneering"] = 1190,
}
local SkillOrder = {
    "Attack",
    "Hitpoints",
    "Mining",
    "Strength",
    "Agility",
    "Smithing",
    "Defence",
    "Herblore",
    "Fishing",
    "Ranged",
    "Thieving",
    "Cooking",
    "Prayer",
    "Crafting",
    "Firemaking",
    "Magic",
    "Fletching",
    "Woodcutting",
    "Runerafting",
    "Slayer",
    "Farming",
    "Construction",
    "Hunter",
    "Dungeoneering",
}
local inputString = "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
local LocalLevelLookupTextElements = nil

local function GetSkillXP(skillID)
    local name, desc, standingID, barMin, barMax, barValue, _, _, _, isHeader, _, _, _, factionID = GetFactionInfoByID(skillID)
    return (barValue - barMax)  -- Adjusted to reflect the actual skill progress
end

local function GetSkillProgress(skillID)
    -- Get current XP for the skill using the provided GetSkillXP function
    local currentXP = GetSkillXP(skillID)

    -- Find the current level by comparing currentXP with experienceTable
    local currentLevel = 1
    for level, xp in ipairs(experienceTable) do
        if currentXP < xp then
            currentLevel = level - 1  -- We haven't reached this level yet
            break
        end
    end

    -- If the currentXP exceeds the max level, set it to max level
    --if currentXP >= experienceTable[99] then
        --currentLevel = 99
    --end

    -- XP required for current level and next level
	local xpForCurrentLevel = experienceTable[currentLevel]
	local xpForNextLevel = experienceTable[currentLevel + 1]
	
    -- Remaining XP to the next level
    local remainingXP = xpForNextLevel - currentXP-- + 1000

    -- Progress percentage
    local progressPercent = ((currentXP - xpForCurrentLevel) / (xpForNextLevel - xpForCurrentLevel)) * 100

    -- Return current level, remaining XP, and progress percentage
    return currentLevel, remainingXP, progressPercent
end

local function GetAllSkillLevels()
    local skillLevels = {}
    for _, skillName in ipairs(SkillOrder) do
        local skillID = FactionData[skillName]
        if skillID then  -- Ensure the skillID exists
            local currentLevel, remainingXP, progressPercent = GetSkillProgress(skillID)
            table.insert(skillLevels, currentLevel)
        else
            -- Handle the case where a skill name in SkillOrder is not in FactionData
            table.insert(skillLevels, 0)  -- Or any default value you prefer
        end
    end
    local resultString = table.concat(skillLevels, " ")
    return resultString
end



-- Prefix for the addon communication
--print("Start Player Data Com Addon")

local addonPrefix = "LevelLookup"
--print("After REgister Addon msg")

-- Function to send a message to a specific player
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

--print("before msg hook REgister Addon msg")
local function SendLevelRequestMessage(targetPlayer)
    if targetPlayer then
        UpdateTextElementsFromString(LocalLevelLookupTextElements, inputString)

        SendAddonMessage(addonPrefix, "GetLevels", "WHISPER", targetPlayer)
        --print("Message sent to", targetPlayer, ":", message)
    else
        --print("Target player or message missing!")
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
        SendLevelRequestMessage(inputText)
        self:ClearFocus()
    end)
    -- Make the background transparent
    inputField:SetBackdrop(nil)  -- Remove any default backdrop


    -- Return both the frame and the text elements table
    return frame, textElements
end




-- Input string with values

-- Update the text elements with the input string
local LocalLevelLookupFrame = nil


LocalLevelLookupFrame, LocalLevelLookupTextElements = CreateLevelLookupFrame()
UpdateTextElementsFromString(LocalLevelLookupTextElements, inputString)


--local skillLevelsString = GetAllSkillLevels()
--print(skillLevelsString)
-- Output will be the levels in the specified order




-- Function to handle receiving addon messages
local function OnAddonMessageReceived(prefix, message, channel, sender)
    if prefix == addonPrefix then
        --print("Received message from", sender, ":", message)
        if message == "GetLevels" then
            levels = GetAllSkillLevels()
            SendAddonMessage(addonPrefix, levels, "WHISPER", sender)
            --print("Sending message to", sender, ":", levels)
            return
        end
        UpdateTextElementsFromString(LocalLevelLookupTextElements, message)

    end
end












-- Register the CHAT_MSG_ADDON event to handle incoming messages
local messageFrame = CreateFrame("Frame")
messageFrame:RegisterEvent("CHAT_MSG_ADDON")
messageFrame:SetScript("OnEvent", function(_, event, prefix, message, channel, sender)
    OnAddonMessageReceived(prefix, message, channel, sender)
end)
print("After msg hook Addon msg")

-- Test function to use in chat for sending a message
SLASH_TESTSEND1 = "/testsend"
SlashCmdList["TESTSEND"] = function(msg)
    local target, message = strsplit(" ", msg, 2)
    SendLevelRequestMessage(target)
end

-- Test function to use in chat for sending a message to yourself (useful for solo testing)
SLASH_TESTSENDSELF1 = "/testself"
SlashCmdList["TESTSENDSELF"] = function(message)
    print("Start Test Send self")
    local playerName = UnitName("player") -- Gets your own character's name
    SendLevelRequestMessage(playerName)
    print("End Test Send self")

end
print("End Player Data Com Addon")


LevelLookupFrame:Hide()
-- Function to create the minimap button Using LibDBIcon and Ace3
local LevelLookupFrameAddon = LibStub("AceAddon-3.0"):NewAddon("LevelLookupFrame")
LevelLookupFrameMinimapButton = LibStub("LibDBIcon-1.0", true)

local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("LevelLookupFrame", {
	type = "data source",
	text = "LevelLookupFrame",
	icon = "INTERFACE\\ICONS\\Skills",
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
