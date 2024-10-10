-- Function to show the Backpack when the MerchantFrame is hidden
local function ShowBackpackOnMerchantHide(self)
    if not Backpack:IsShown() then
        Backpack:Show()
        --print("Backpack was hidden but is now shown.")
    end
end

-- Function to hook the Hide event of the MerchantFrame
local function HookMerchantFrameHideEvent()
    --print("Add hide hook")
    if MerchantFrame then
        MerchantFrame:HookScript("OnHide", ShowBackpackOnMerchantHide)
        --print("Hooked OnHide event for MerchantFrame to show Backpack.")

    end
end

-- Event frame to listen for PLAYER_LOGIN
local eventFrame2 = CreateFrame("Frame")
eventFrame2:RegisterEvent("PLAYER_LOGIN")
eventFrame2:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        HookMerchantFrameHideEvent()
    end
end)
