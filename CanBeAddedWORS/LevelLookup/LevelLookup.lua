--[[--------------------------------------------------------------------
LevelLookup.lua
- Works standalone (drag/move, minimap toggle)
- If WORSLite is loaded, auto-docks into MySidebarPanel and registers a sidebar button instead of LibDBIcon 
---------------------------------------------------------------------]]

------------------------------------------------------------
-- Saved vars / locals
------------------------------------------------------------
local inputString = "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
local LocalLevelLookupTextElements = nil
local addonPrefix = "LevelLookup"

-- (3.3.5 requires registering prefix to receive CHAT_MSG_ADDON reliably)
if C_ChatInfo and C_ChatInfo.RegisterAddonMessagePrefix then
    C_ChatInfo.RegisterAddonMessagePrefix(addonPrefix)
elseif RegisterAddonMessagePrefix then
    RegisterAddonMessagePrefix(addonPrefix)
end

------------------------------------------------------------
-- Helpers
------------------------------------------------------------
local function UpdateTextElementsFromString(textElements, str)
    if not textElements then return end
    local values = {}
    for value in string.gmatch(str or "", "%S+") do
        table.insert(values, value)
    end
    for i, el in ipairs(textElements) do
        el:SetText(values[i] or "")
    end
end

local function SendLevelRequestMessage(targetPlayer)
    if targetPlayer and targetPlayer ~= "" then
        UpdateTextElementsFromString(LocalLevelLookupTextElements, inputString)
        -- Sends command to server (your custom server command)
        SendChatMessage(".geworslvl " .. targetPlayer, "SAY")
    end
end

------------------------------------------------------------
-- UI: Create the frame + text grid + input box
------------------------------------------------------------
local function CreateLevelLookupFrame()
    local frame = CreateFrame("Frame", "LevelLookupFrame", UIParent)
    frame:SetSize(219, 310)
    frame:SetPoint("CENTER")

    -- Standalone: movable
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:SetClampedToScreen(true)

    -- Background art slice
    local texture = frame:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints(frame)
    texture:SetTexture("Interface\\AddOns\\LevelLookup\\LevelLookupSymetrical.tga")
    local left, right, top, bottom = 0, 219/512, 0, 310/512
    texture:SetTexCoord(left, right, top, bottom)

    -- Grid of text strings
    local textElements = {}
    local startX, startY = 45, -55
    local Ydelta, Xdelta = 32, 72
    local numColumns, numRows = 3, 8

    for row = 0, numRows - 1 do
        for col = 0, numColumns - 1 do
            local text = frame:CreateFontString(nil, "OVERLAY")
            text:SetFont("Fonts\\runescape.ttf", 12)
            text:SetText("")
            local xPos = startX + col * Xdelta
            local yPos = startY - row * Ydelta
            text:SetPoint("TOPLEFT", frame, "TOPLEFT", xPos, yPos)
            text:SetTextColor(1, 1, 1, 1)
            table.insert(textElements, text)
        end
    end

    -- Input EditBox
    local inputField = CreateFrame("EditBox", nil, frame)
    inputField:SetFont("Fonts\\runescape.ttf", 18)
    inputField:SetSize(160, 22)
    inputField:SetPoint("TOPLEFT", frame, "TOPLEFT", 30, -5)
    inputField:SetAutoFocus(false)
    inputField:SetMultiLine(false)
    inputField:SetText("")
    inputField:EnableMouse(true)
    inputField:SetTextColor(1, 1, 1, 1)
    inputField:SetScript("OnEscapePressed", inputField.ClearFocus)
    inputField:SetScript("OnEnterPressed", function(self)
        local t = self:GetText()
        if t and #t > 2 then
            SendLevelRequestMessage(t)
        end
        self:ClearFocus()
    end)
    inputField:SetBackdrop(nil)

    return frame, textElements
end

-- Build UI now
local LocalLevelLookupFrame = nil
LocalLevelLookupFrame, LocalLevelLookupTextElements = CreateLevelLookupFrame()
UpdateTextElementsFromString(LocalLevelLookupTextElements, inputString)
LocalLevelLookupFrame:Hide()

------------------------------------------------------------
-- Addon message receive
------------------------------------------------------------
local function OnAddonMessageReceived(prefix, message, channel, sender)
    if prefix ~= addonPrefix then return end
    -- Example special message:
    if message == "GetLevels" then
        -- You could reply here if needed:
        -- SendAddonMessage(addonPrefix, <levels>, "WHISPER", sender)
        -- print("Sending message to " .. sender)
        return
    end
    UpdateTextElementsFromString(LocalLevelLookupTextElements, message)
end

-- Event driver for CHAT_MSG_ADDON
local messageFrame = CreateFrame("Frame")
messageFrame:RegisterEvent("CHAT_MSG_ADDON")
messageFrame:SetScript("OnEvent", function(_, _, prefix, message, channel, sender)
    OnAddonMessageReceived(prefix, message, channel, sender)
end)

------------------------------------------------------------
-- Test slash commands
------------------------------------------------------------
SLASH_TESTSEND1 = "/testsend"
SlashCmdList.TESTSEND = function(msg)
    local target = msg and msg:match("^(%S+)")
    SendLevelRequestMessage(target or "")
end

SLASH_TESTSENDSELF1 = "/testself"
SlashCmdList.TESTSENDSELF = function()
    local me = UnitName("player")
    SendLevelRequestMessage(me)
end

------------------------------------------------------------
-- Optional WORSLite docking (auto-detect)
------------------------------------------------------------
local function EmbedIntoSidebar_LevelLookup()
    if not IsAddOnLoaded("WORSLite") then return end
    if not LevelLookupFrame or not MySidebarPanel then return end

    -- Dock without stretching
    LevelLookupFrame:SetParent(MySidebarPanel)
    LevelLookupFrame:ClearAllPoints()
    LevelLookupFrame:SetPoint("TOP", MySidebarPanel, "TOP", 0, -35) -- leaves room for header
    LevelLookupFrame:SetSize(219, 310)
    LevelLookupFrame:SetMovable(false)
    LevelLookupFrame:EnableMouse(false)

    -- Header container (only once)
    if not LevelLookupFrame.header then
        local header = CreateFrame("Frame", nil, MySidebarPanel)
        header:SetPoint("TOPLEFT", MySidebarPanel, "TOPLEFT", 0, 0)
        header:SetPoint("TOPRIGHT", MySidebarPanel, "TOPRIGHT", 0, 0)
        header:SetHeight(28)

        -- title
        local title = header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        title:SetPoint("TOP", 0, -10)
        title:SetFont("Fonts\\runescape.ttf", 22, "OUTLINE")
        title:SetText("Level Lookup")

        -- close button
        local closeButton = CreateFrame("Button", nil, header)
        closeButton:SetSize(20, 20)
        closeButton:SetPoint("TOPRIGHT", header, "TOPRIGHT", 0, 0)
        closeButton:SetNormalTexture("Interface\\WORS\\OldSchool-CloseButton-Up.blp")
        closeButton:SetHighlightTexture("Interface\\WORS\\OldSchool-CloseButton-Highlight.blp", "ADD")
        closeButton:SetPushedTexture("Interface\\WORS\\OldSchool-CloseButton-Down.blp")
        closeButton:SetScript("OnClick", function()
            MySidebarPanel:Hide()
            if SetViewport then SetViewport() end
            currentModule = nil
            if MySidebarDB then MySidebarDB.currentModule = nil end
        end)

        LevelLookupFrame.header = header
        LevelLookupFrame.headerTitle = title
        LevelLookupFrame.headerClose = closeButton
    end

    -- Helper: show header only when this module is active
    local function UpdateLLHeaderVisibility()
        local active = MySidebarPanel:IsShown()
            and MySidebarDB
            and MySidebarDB.currentModule == "LevelLookup"
        if LevelLookupFrame.header then
            LevelLookupFrame.header:SetShown(active)
        end
    end

    -- Run once now
    UpdateLLHeaderVisibility()

    -- Keep visibility in sync with panel show/hide
    MySidebarPanel:HookScript("OnShow", function()
        if MySidebarDB and MySidebarDB.currentModule == "LevelLookup" then
            LevelLookupFrame:Show()
        end
        UpdateLLHeaderVisibility()
    end)
    MySidebarPanel:HookScript("OnHide", function()
        LevelLookupFrame:Hide()
        UpdateLLHeaderVisibility()
    end)

    -- Also update header when switching tabs
    if type(ToggleSidebar) == "function" and not LevelLookupFrame._hookedToggle then
        hooksecurefunc("ToggleSidebar", function()
            UpdateLLHeaderVisibility()
        end)
        LevelLookupFrame._hookedToggle = true
    end

    -- Register module button
    if type(RegisterSidebarModule) == "function" then
        RegisterSidebarModule(
            "LevelLookup",
            LevelLookupFrame,
            "Interface\\Icons\\Holygrail",
            "Level Lookup"
        )
    end
end

local _lvlEmbed = CreateFrame("Frame")
_lvlEmbed:RegisterEvent("PLAYER_LOGIN")
_lvlEmbed:SetScript("OnEvent", function()
    EmbedIntoSidebar_LevelLookup()
end)

------------------------------------------------------------
-- Minimap button (LibDBIcon/LDB/Ace3) — disabled when docked
------------------------------------------------------------
local LevelLookupFrameAddon = LibStub("AceAddon-3.0"):NewAddon("LevelLookupFrame")
LevelLookupFrameMinimapButton = LibStub("LibDBIcon-1.0", true)

local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("LevelLookupFrame", {
    type = "data source",
    text = "LevelLookupFrame",
    icon = "INTERFACE\\ICONS\\Holygrail", -- use your icon
    OnClick = function(self, btn)
        if btn == "LeftButton" then
            if LevelLookupFrame:IsShown() then
                LevelLookupFrame:Hide()
            else
                LevelLookupFrame:Show()
            end
        end
    end,
    OnTooltipShow = function(tooltip)
        if not tooltip or not tooltip.AddLine then return end
        tooltip:AddLine("Level Lookup\nLeft-click: Toggle Level Lookup Window", nil, nil, nil, nil)
    end,
})

function LevelLookupFrameAddon:OnInitialize()
    -- If WORSLite skip minimap button
    if IsAddOnLoaded("WORSLite") then return end

    self.db = LibStub("AceDB-3.0"):New("LevelLookupFrameMinimapPOS", {
        profile = { minimap = { hide = false } },
    })
    LevelLookupFrameMinimapButton:Register("LevelLookupFrame", miniButton, self.db.profile.minimap)
end
