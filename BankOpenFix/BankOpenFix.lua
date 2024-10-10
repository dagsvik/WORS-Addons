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

-- Function to handle the GUILDBANKFRAME_OPENED event
local function OnGuildBankOpened()

    HookColumnHideEvents()  
    HookTabHideEvents()
    HookBuyInfoShowEvents()
    Backpack:Show() --Optional Just normally nice to show the backpack when using the bank.
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
