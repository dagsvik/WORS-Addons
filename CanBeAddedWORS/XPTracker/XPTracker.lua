XP_TrackerData = XP_TrackerData or {}  -- Ensure the saved variable table exists
XP_TrackerData.transparency = XP_TrackerData.transparency or 1.0 
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
    ["Strength"] = 1172,  -- Add more entries as needed
    ["Defence"] = 1167,
    ["Ranged"] = 1171,
    ["Prayer"] = 1170,
    ["Magic"] = 1169,
    ["Runecrafting"] = 1183,
    ["Construction"] = 1186,
    ["Hitpoints"] = 1168,
    ["Agility"] = 1185,
    ["Herblore"] = 1182,
    ["Thieving"] = 1189,
    ["Crafting"] = 1180,
    ["Fletching"] = 1181,
    ["Slayer"] = 1188,
    ["Hunter"] = 1176,
    ["Mining"] = 1177,
    ["Smithing"] = 1184,
    ["Fishing"] = 1175,
    ["Cooking"] = 1179,
    ["Firemaking"] = 1187,
    ["Woodcutting"] = 1178,
    ["Farming"] = 1173,
    ["Dungeoneering"] = 1190,
}

local FactionColorData = {
    ["Attack"] = {
        factionID = 1166,
        color = { 0.61, 0.13, 0.03, 1 }  -- #9B2007
    },
    ["Strength"] = {
        factionID = 1172,
        color = { 0.02, 0.58, 0.35, 1 }  -- #04955A
    },
    ["Defence"] = {
        factionID = 1167,
        color = { 0.38, 0.47, 0.74, 1 }  -- #6277BE
    },
    ["Ranged"] = {
        factionID = 1171,
        color = { 0.43, 0.56, 0.09, 1 }  -- #6D9017
    },
    ["Prayer"] = {
        factionID = 1170,
        color = { 0.62, 0.58, 0.14, 1 }  -- #9F9323
    },
    ["Magic"] = {
        factionID = 1169,
        color = { 0.20, 0.31, 0.76, 1 }  -- #3250C1
    },
    ["Runecrafting"] = {
        factionID = 1183,
        color = { 0.67, 0.55, 0.10, 1 }  -- #AA8D1A
    },
    ["Construction"] = {
        factionID = 1186,
        color = { 0.61, 0.13, 0.03, 1 }  -- #9B2007
    },
    ["Hitpoints"] = {
        factionID = 1168,
        color = { 0.51, 0.49, 0.49, 1 }  -- #837E7E
    },
    ["Agility"] = {
        factionID = 1185,
        color = { 0.23, 0.24, 0.54, 1 }  -- #3A3C89
    },
    ["Herblore"] = {
        factionID = 1182,
        color = { 0.03, 0.52, 0.04, 1 }  -- #078509
    },
    ["Thieving"] = {
        factionID = 1189,
        color = { 0.42, 0.20, 0.34, 1 }  -- #6C3457
    },
    ["Crafting"] = {
        factionID = 1180,
        color = { 0.59, 0.43, 0.30, 1 }  -- #976E4D
    },
    ["Fletching"] = {
        factionID = 1181,
        color = { 0.01, 0.55, 0.49, 1 }  -- #038D7D
    },
    ["Slayer"] = {
        factionID = 1188,
        color = { 0.39, 0.39, 0.39, 1 }  -- #646464
    },
    ["Hunter"] = {
        factionID = 1176,
        color = { 0.36, 0.35, 0.25, 1 }  -- #5C5941
    },
    ["Mining"] = {
        factionID = 1177,
        color = { 0.36, 0.56, 0.65, 1 }  -- #5D8FA7
    },
    ["Smithing"] = {
        factionID = 1184,
        color = { 0.42, 0.42, 0.32, 1 }  -- #6C6B52
    },
    ["Fishing"] = {
        factionID = 1175,
        color = { 0.42, 0.52, 0.64, 1 }  -- #6A84A4
    },
    ["Cooking"] = {
        factionID = 1179,
        color = { 0.44, 0.14, 0.53, 1 }  -- #702386
    },
    ["Firemaking"] = {
        factionID = 1187,
        color = { 0.74, 0.47, 0.10, 1 }  -- #BD7819
    },
    ["Woodcutting"] = {
        factionID = 1178,
        color = { 0.20, 0.55, 0.14, 1 }  -- #348C25
    },
    ["Farming"] = {
        factionID = 1173,
        color = { 0.40, 0.60, 0.25, 1 }  -- #65983F
    },
    ["Dungeoneering"] = {
        factionID = 1190,
        color = { 0.61, 0.13, 0.03, 1 }  -- #9B2007
    }
}
-- Assuming data variables are already defined. Can ask if its importantt.

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

-- Example of how to access the FactionID by name
local function GetFactionIDByName(skillName)
    return FactionData[skillName] or nil
end

local function formatNumberWithCommas(number)
    local formatted = tostring(number)
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then break end
    end
    return formatted
end

-- Create the dropdown menu frame
local menuFrame = CreateFrame("Frame", "SkillFrameMenu", UIParent, "UIDropDownMenuTemplate")

-- Table to store skill frames indexed by factionID for quick access
local skillFrames = {}

-- Ordered list to maintain the display order of skill frames
local skillFramesList = {}


-- Create frames for each skill in FactionData
local index = 1

-- Function to initialize the dropdown menu
local function SkillFrameMenu_Init(self, level)
    if not level then return end
    local info = UIDropDownMenu_CreateInfo()

    if level == 1 then
        -- "Reset Skill" option
        info.text = "Reset Skill"
        info.func = function()
            ResetSkillFrame(self.owner)
        end
        info.notCheckable = true
        UIDropDownMenu_AddButton(info, level)

        -- "Cancel" option
        info.text = "Cancel"
        info.func = function() end
        info.notCheckable = true
        UIDropDownMenu_AddButton(info, level)
    end
end



local function SortSkillFrames()
    table.sort(skillFramesList, function(a, b)
        return a.LastTime > b.LastTime
    end)
end





local function CreateSkillFrame(skillName, factionID, parentFrame)
    local frame = CreateFrame("Frame", skillName .. "Frame", parentFrame)
    frame:SetSize(parentFrame:GetWidth() - 10, 65)
    -- Initial position; will be set correctly in UpdateSkillFramesLayout()
    frame:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 5, - (0))
    
    -- Background for the skill frame
    frame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        tile = false
    })
    frame:SetBackdropColor(0.12, 0.12, 0.12, 1)
    -- Table to store text elements
    frame.textElements = {}

    -- Skill icon as text character
    local skillIcon = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    skillIcon:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -9)
    skillIcon:SetText("📈")
    skillIcon:SetFont(skillIcon:GetFont(), 25)
    table.insert(frame.textElements, skillIcon)
    
    -- XP Gained text
    local xpGainedText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    xpGainedText:SetPoint("TOPLEFT", skillIcon, "TOPRIGHT", 8, 0)
    xpGainedText:SetText(skillName .. " XP Gained: 0")
    xpGainedText:SetTextColor(0.78,0.70,0.59)
    xpGainedText:SetFont("Fonts/runescape.ttf", 12)
    table.insert(frame.textElements, xpGainedText)
    
    -- XP/hr text
    local xpPerHourText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    xpPerHourText:SetPoint("TOPLEFT", xpGainedText, "BOTTOMLEFT", 0, 0)
    xpPerHourText:SetText("XP/hr: 0")
    xpPerHourText:SetTextColor(0.78,0.70,0.59)
    xpPerHourText:SetFont("Fonts/runescape.ttf", 12)
    table.insert(frame.textElements, xpPerHourText)
    
    -- XP Left text
    local xpLeftText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    xpLeftText:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -9)
    xpLeftText:SetText("XP Left: 0")
    xpLeftText:SetTextColor(0.78,0.70,0.59)
    xpLeftText:SetFont("Fonts/runescape.ttf", 12)
    table.insert(frame.textElements, xpLeftText)
    
    -- Actions or kills text
    local actionsText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    actionsText:SetPoint("TOPLEFT", xpLeftText, "BOTTOMLEFT", 0, 0)
    actionsText:SetText("Actions: 0")
    actionsText:SetTextColor(0.78,0.70,0.59)
    actionsText:SetFont("Fonts/runescape.ttf", 12)
    table.insert(frame.textElements, actionsText)
    
    local skillColor = { unpack(FactionColorData[skillName].color, 1, 3) }
    -- Progress bar for the level
    local progressBar = CreateFrame("StatusBar", nil, frame)
    progressBar:SetHeight(16)
    progressBar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 7, 7)
    progressBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -7, 7)
    progressBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
    progressBar:SetStatusBarColor(unpack(skillColor))
    
    -- Create a background texture for the non-filled part of the progress bar
    local bg = progressBar:CreateTexture(nil, "BACKGROUND")
    bg:SetTexture("Interface\\Buttons\\WHITE8x8")
    bg:SetVertexColor(0.24, 0.22, 0.19, 1)
    bg:SetAllPoints(progressBar)
    
    progressBar:SetMinMaxValues(0, 100)
    progressBar:SetValue(45)
    
    -- Create a container frame specifically for the text
    local textContainer = CreateFrame("Frame", nil, frame)
    textContainer:SetAllPoints(progressBar)
    textContainer:SetFrameLevel(progressBar:GetFrameLevel() + 1)
    
    -- Current level text (left side on the progress bar)
    local currentLevelText = textContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    currentLevelText:SetPoint("LEFT", textContainer, "LEFT", 6, 0)
    currentLevelText:SetText("Lvl. 99")
    currentLevelText:SetTextColor(1, 1, 1)
    currentLevelText:SetFont("Fonts/runescape_bold.ttf", 12)
    table.insert(frame.textElements, currentLevelText)
    
    -- Progress percentage text (centered on the progress bar)
    local progressPercentageText = textContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    progressPercentageText:SetPoint("CENTER", textContainer, "CENTER", 0, 0)
    progressPercentageText:SetText("100%")
    progressPercentageText:SetTextColor(1, 1, 1)
    progressPercentageText:SetFont("Fonts/runescape_bold.ttf", 12)
    table.insert(frame.textElements, progressPercentageText)
    
    -- Next level text (right side on the progress bar)
    local nextLevelText = textContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nextLevelText:SetPoint("RIGHT", textContainer, "RIGHT", -4, 0)
    nextLevelText:SetText("Lvl. 99")
    nextLevelText:SetTextColor(1, 1, 1)
    nextLevelText:SetFont("Fonts/runescape_bold.ttf", 12)
    table.insert(frame.textElements, nextLevelText)
    
    frame.TotalXpGained = 0
    frame.StartTime = time()
    frame.LastTime = time()
    -- Store references to the elements inside the frame so we can update them later
    frame.skillIcon = skillIcon
    frame.xpGainedText = xpGainedText
    frame.xpPerHourText = xpPerHourText
    frame.xpLeftText = xpLeftText
    frame.actionsText = actionsText
    frame.progressBar = progressBar
    frame.progressPercent = 45
    frame.currentLevelText = currentLevelText
    frame.nextLevelText = nextLevelText
    frame.progressPercentageText = progressPercentageText
    frame.factionID = factionID  -- Store the factionID for this skill
    -- Attach an OnMouseUp script to handle right-clicks
    frame:EnableMouse(true)

    frame:SetScript("OnMouseUp", function(self, button)
    if button == "RightButton" then
        -- Set the owner of the menu to the current skill frame
        menuFrame.owner = self
        -- Initialize the menu
        UIDropDownMenu_Initialize(menuFrame, SkillFrameMenu_Init, "MENU")
        -- Display the menu at the cursor's position
        ToggleDropDownMenu(1, nil, menuFrame, "cursor", 0, 0)
        --print("Mouse up!")
    end
    end)
	
    return frame
end


-- Function to update an existing skill frame
local function UpdateSkillFrame(skillFrame, skillData)
    local currentTime = time()
    local timeElapsed = (currentTime - skillFrame.StartTime) / 3600  -- Time elapsed in hours
    
    -- Safeguard to prevent division by zero or very small numbers
    if timeElapsed <= 0 then
        timeElapsed = 0.0001  -- Use a very small number to avoid zero-division
    end
	
    -- Update the total XP gained
    skillFrame.TotalXpGained = skillFrame.TotalXpGained + skillData.xpGained

    -- Calculate XP per hour based on time elapsed
    skillData.xpPerHour = math.ceil(skillFrame.TotalXpGained / timeElapsed)
    skillFrame.LastTime = currentTime
    -- Update the UI elements with the new data
    skillFrame.xpGainedText:SetText("XP Gained: " .. formatNumberWithCommas(skillFrame.TotalXpGained))
    skillFrame.xpPerHourText:SetText("XP/hr: " .. formatNumberWithCommas(skillData.xpPerHour))
    skillFrame.xpLeftText:SetText("XP Left: " .. formatNumberWithCommas(skillData.xpLeft))
    skillFrame.actionsText:SetText("Actions: " .. formatNumberWithCommas(skillData.actions))
    skillFrame.skillIcon:SetText(skillData.skillIcon)
    
    -- Update the progress bar and percentage
    skillFrame.progressBar:SetMinMaxValues(0, 100)
    skillFrame.progressBar:SetValue(skillData.progressPercent)
    skillFrame.progressPercent = skillData.progressPercent
    skillFrame.progressPercentageText:SetText(string.format("%.2f%%", skillData.progressPercent))
	-- Update level information
	skillFrame.currentLevelText:SetText("Lvl. " .. skillData.currentLevel)
	skillFrame.nextLevelText:SetText("Lvl. " .. (skillData.currentLevel + 1))

    -- Show the frame when it's updated
    skillFrame:Show()
end



-- Parent frame to hold all the skill frames
local parentFrame = CreateFrame("Frame", "SkillTrackerParentFrame", UIParent)
parentFrame:SetSize(265, 240)
parentFrame:SetPoint("CENTER", 400, 225)
parentFrame:SetBackdrop({
    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",  -- A simple background texture
    tile = false
})
parentFrame:SetBackdropColor(0.16, 0.16, 0.16, 1)
-- Enable dragging for the parentFrame
parentFrame:SetMovable(true)
parentFrame:EnableMouse(true)
parentFrame:RegisterForDrag("LeftButton")
parentFrame:SetClampedToScreen(true)
-- Set up drag behavior
parentFrame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)

parentFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

-- Enable resizing for the parentFrame
parentFrame:SetResizable(true)
parentFrame:SetMinResize(150, 75)
parentFrame:SetMaxResize(300, 700)

-- Create title
local title = parentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("TOP", 0, -10)
title:SetText("XP Tracker")
title:SetFont("Fonts/runescape.ttf", 18, "OUTLINE")  -- 18 font size

-- Create the resize button
local resizeButton = CreateFrame("Button", "SkillTrackerResizeButton", parentFrame)
resizeButton:SetPoint("BOTTOMRIGHT", parentFrame, "BOTTOMRIGHT", 0, 0)
resizeButton:SetSize(16, 16)
resizeButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
resizeButton:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
resizeButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")

resizeButton:EnableMouse(true)
resizeButton:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        parentFrame:StartSizing("BOTTOMRIGHT")
        self:GetHighlightTexture():Hide() -- Hide the highlight while resizing
    end
end)

resizeButton:SetScript("OnMouseUp", function(self, button)
    parentFrame:StopMovingOrSizing()
    self:GetHighlightTexture():Show()
end)



-- Scroll frame to contain the skill frames
local scrollFrame = CreateFrame("ScrollFrame", "SkillTrackerScrollFrame", parentFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 0, -10)
scrollFrame:SetSize(235, 220) -- Adjust the size to fit inside the parent frame

-- Create a content frame to hold the skill frames inside the scroll frame
local scrollContent = CreateFrame("Frame", "SkillTrackerScrollContent", scrollFrame)
scrollContent:SetSize(235, 220) -- Adjust size based on content
scrollFrame:SetScrollChild(scrollContent)

local scrollBar = _G["SkillTrackerScrollFrameScrollBar"] -- Default scrollbar name from "UIPanelScrollFrameTemplate"
local scrollUpButton = _G["SkillTrackerScrollFrameScrollBarScrollUpButton"]
local scrollDownButton = _G["SkillTrackerScrollFrameScrollBarScrollDownButton"]




local function UpdateSkillFramesLayout()
    local width, height = parentFrame:GetSize()

    scrollFrame:SetSize(width - 30, height - 20)
    scrollContent:SetSize(width - 30, height - 20)
    
    -- Update the skillFrames
    local frameWidth = scrollContent:GetWidth() - 10  -- Adjust for padding
    local frameHeight = 65  -- You can adjust this if you want the frames to scale in height as well
    --print(frameWidth)
    local index = 1
    local offsetY = 0
    for _, skillFrame in pairs(skillFramesList) do
        skillFrame:SetSize(frameWidth, frameHeight)
        skillFrame:ClearAllPoints()
        skillFrame:SetPoint("TOPLEFT", scrollContent, "TOPLEFT", 5, -offsetY)
        
        -- Update child elements' sizes and positions
        -- Progress Bar
        skillFrame.progressBar:SetPoint("BOTTOMLEFT", skillFrame, "BOTTOMLEFT", 7, 7)
        skillFrame.progressBar:SetPoint("BOTTOMRIGHT", skillFrame, "BOTTOMRIGHT", -7, 7)
        skillFrame.progressBar:SetHeight(16)
        skillFrame.progressBar:SetMinMaxValues(0, 100)
        skillFrame.progressBar:SetValue(skillFrame.progressPercent)
        -- Calculate new font size based on frame width
        local baseWidth = 17  -- Base width to compare against (original width)
        local minFontSize = 7   -- Minimum font size
        local maxFontSize = 14  -- Maximum font size

        -- Calculate a scaling factor
        local scaleFactor = frameWidth / baseWidth

        -- Loop through all text elements and adjust their font sizes
        for i, textElement in ipairs(skillFrame.textElements) do
            local fontName, fontHeight, fontFlags = textElement:GetFont()
            local newFontSize = scaleFactor

            -- Clamp the font size between minFontSize and maxFontSize
            newFontSize = math.max(minFontSize, math.min(newFontSize, maxFontSize))
            if i == 1 then
                newFontSize = newFontSize*2
            end

            textElement:SetFont(fontName, newFontSize, fontFlags)
        end

        offsetY = offsetY + frameHeight + 4  -- Adjust spacing between frames
        index = index + 1
    end
    
    -- Update the scrollContent height based on the total height of skill frames
    scrollContent:SetHeight(offsetY)
end


-- Adjust the scrollFrame and scrollContent sizes when the parentFrame is resized
parentFrame:SetScript("OnSizeChanged", function(self, width, height)
    UpdateSkillFramesLayout()
end)


-- Function to reset and remove a skill frame
function ResetSkillFrame(skillFrame)
    -- Remove the skill frame from the skillFrames table
    for factionID, frame in pairs(skillFrames) do
        if frame == skillFrame then
            skillFrames[factionID] = nil
            break
        end
    end

    -- Remove the skill frame from the ordered list
    for index, frame in ipairs(skillFramesList) do
        if frame == skillFrame then
            table.remove(skillFramesList, index)
            break
        end
    end

    -- Hide and delete the frame
    skillFrame:Hide()
    skillFrame:SetScript("OnUpdate", nil)
    skillFrame:SetParent(nil)

    -- Update the layout to rearrange remaining skill frames
    UpdateSkillFramesLayout()
end


-- Function to handle skill frame creation and updating dynamically
local function HandleSkillFrameUpdate(skillName, skillData)
    -- Check if the skill frame already exists for the given skill
    local factionID = FactionData[skillName]

    if not factionID then
        -- Skill not found in FactionData
        return
    end

    -- Check if the frame for this factionID already exists
    if not skillFrames[factionID] then
        -- Create the skill frame if it doesn't exist
        local skillFrame = CreateSkillFrame(skillName, factionID, scrollContent)
        skillFrames[factionID] = skillFrame -- Store in the skillFrames table

        -- Add the new skill frame to the ordered list
        table.insert(skillFramesList, skillFrame)

        -- Update the layout after adding a new frame
        
    end

    -- Now that we know the frame exists, update it with new data
    UpdateSkillFrame(skillFrames[factionID], skillData)
    SortSkillFrames()
    UpdateSkillFramesLayout()
end




-- Example usage in the event handler
local XPTracker = CreateFrame("Frame")
XPTracker:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE") -- Register event to listen for XP gains
XPTracker:RegisterEvent("PLAYER_ENTERING_WORLD") -- Register event to initialize on login

function loadXPBGTransparency()
    -- Check if transparency value exists in saved data
    if XP_TrackerData.transparency then
        if XP_TrackerData.transparency == 0.0 then
            -- Apply 0% transparency (invisible)
            parentFrame:SetBackdropColor(0.0, 0.0, 0.0, 0)
            -- Set scroll bar elements to fully transparent (invisible)
            scrollBar:GetThumbTexture():SetAlpha(0) 
            scrollUpButton:GetNormalTexture():SetAlpha(0)
            scrollUpButton:GetPushedTexture():SetAlpha(0)
            scrollUpButton:GetDisabledTexture():SetAlpha(0)
            scrollDownButton:GetNormalTexture():SetAlpha(0)
            scrollDownButton:GetPushedTexture():SetAlpha(0)
            scrollDownButton:GetDisabledTexture():SetAlpha(0)
			title:Hide()		
		else
            -- Apply 100% transparency (normal opacity)
            parentFrame:SetBackdropColor(0.16, 0.16, 0.16, 1)
            -- Set scroll bar elements to normal opacity
			title:Show()
        end
    else
        -- Default behavior if no saved transparency value is found
        XP_TrackerData.transparency = 1.0  -- Default to 100% opacity
        parentFrame:SetBackdropColor(0.16, 0.16, 0.16, 1)
    end
end

-- Event handler for XP tracking
XPTracker:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        -- Initialize tracking session on login
        loadXPBGTransparency()
		--panel:Show() -- Show the tracker panel
        
        
    elseif event == "CHAT_MSG_COMBAT_FACTION_CHANGE" then
        local message = ...
        local iconPattern = "|T.-|t"
        -- Pattern to extract the amount
        local amountPattern = "(%d+)"

       
        local messageWithoutIcon = string.gsub(message, iconPattern, "")

        -- Extract the amount
        local amount = string.match(messageWithoutIcon, amountPattern)
        -- Patterns to extract skill name and XP gained
        local skillPattern = "|T.-|t%s(.+) experience increased by"  -- Extracts skill name
        local icon = string.match(message, iconPattern) or ""

        -- Extract skill name and XP gained
        local skillName = string.match(message, skillPattern)

        -- If both skill name and XP are found, process them
        if skillName and amount then


            -- Use the table to get factionID
            local factionID = GetFactionIDByName(skillName)

            local currentLevel, remainingXP, progressPercent = GetSkillProgress(factionID)
            
            -- Example skill data to update a skill frame
            local skillData = {
                skillName = skillName,
                xpGained = amount,
                xpPerHour = amount,
                xpLeft = remainingXP,
                actions = math.ceil(remainingXP / amount),
                progressPercent = tonumber(string.format("%.2f", progressPercent)),
                currentLevel = currentLevel,
                skillIcon = icon
            }
            -- Check if skillFrames[FactionData[skillName]] exists, if not create it. 
            -- Update the Ranged skill frame with new data
            --UpdateSkillFrame(skillFrames[FactionData[skillName]], skillData)
            HandleSkillFrameUpdate(skillName, skillData)

        end
    end
end)



function toggleXPBGTransparency()
    -- Toggle transparency between 50% (0) and 100% (1.0)
    if XP_TrackerData.transparency == 1.0 then
        -- Set transparency to 0% and update scroll bar transparency
        XP_TrackerData.transparency = 0.0
		parentFrame:SetBackdropColor(0.0, 0.0, 0.0, 0)
        -- Set scroll bar elements to fully transparent (invisible)
        scrollBar:GetThumbTexture():SetAlpha(0) 
        scrollUpButton:GetNormalTexture():SetAlpha(0)
        scrollUpButton:GetPushedTexture():SetAlpha(0)
        scrollUpButton:GetDisabledTexture():SetAlpha(0)
        scrollDownButton:GetNormalTexture():SetAlpha(0)
        scrollDownButton:GetPushedTexture():SetAlpha(0)
        scrollDownButton:GetDisabledTexture():SetAlpha(0)
		title:Hide()
    else
        -- Set transparency to 100% and update scroll bar transparency
        XP_TrackerData.transparency = 1.0
		parentFrame:SetBackdropColor(0.16, 0.16, 0.16, 1)
        -- Set scroll bar elements to normal opacity
        scrollBar:GetThumbTexture():SetAlpha(1) 
        scrollUpButton:GetNormalTexture():SetAlpha(1)
        scrollUpButton:GetPushedTexture():SetAlpha(1)
        scrollUpButton:GetDisabledTexture():SetAlpha(1)
        scrollDownButton:GetNormalTexture():SetAlpha(1)
        scrollDownButton:GetPushedTexture():SetAlpha(1)
        scrollDownButton:GetDisabledTexture():SetAlpha(1)
		title:Show()		
    end    
end


-- Function to create the minimap button Using LibDBIcon and Ace3
local XPTrackerFrameAddon = LibStub("AceAddon-3.0"):NewAddon("XPTrackerFrame")
XPTrackerFrameMinimapButton = LibStub("LibDBIcon-1.0", true)

local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("XPTrackerFrame", {
	type = "data source",
	text = "XPTrackerFrame",
	icon = "INTERFACE\\ICONS\\Skills",
	OnClick = function(self, btn)
        if btn == "LeftButton" then
            if parentFrame:IsShown() then
                parentFrame:Hide()
            else
                parentFrame:Show()
			end
		elseif btn == "RightButton" then
			if parentFrame:IsShown() then
                toggleXPBGTransparency()
            else
                parentFrame:Show()
				toggleXPBGTransparency()
            end
        end
	end,
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then
			return
		end
		tooltip:AddLine("XP Tracker\nLeft-click: Toggle XP Window", nil, nil, nil, nil)
		tooltip:AddLine("Right-click: Toggle Background Transparency", nil, nil, nil, nil)
	end,

})

function XPTrackerFrameAddon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("XPTrackerFrameMinimapPOS", {
		profile = {
			minimap = {
				hide = false,
			},
		},
	})
	XPTrackerFrameMinimapButton:Register("XPTrackerFrame", miniButton, self.db.profile.minimap)
end