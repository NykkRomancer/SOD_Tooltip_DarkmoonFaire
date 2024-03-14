local tierInfo = {
    [1] = {
        Reward = 1,
        MinLevel = 1,
    },
    [2] = {
        Reward = 4,
        MinLevel = 10,
    },
    [3] = {
        Reward = 8,
        MinLevel = 20,
    },
    [4] = {
        Reward = 12,
        MinLevel = 30,
    },
    [5] = {
        Reward = 20,
        MinLevel = 40,
    },
}

local function TTDF_FormatTickets(tier)
    -- Get the current level of the player
    local playerLevel = UnitLevel("player");
    if playerLevel < tierInfo[tier].MinLevel then
        return "|cffff4700(" .. tierInfo[tier].Reward .. " Tickets)|r";
    else
        return "|cff9482c9" .. tierInfo[tier].Reward .. "|r|cffa335ee Tickets|r";
    end
end

local function AddCustomText(tooltip, itemID)
    if NykkRomancer.SOD_FairItems[itemID] then
        tooltip:AddDoubleLine("|cffa335eeDarkmoon Faire Item (|r|cff9482c9x" .. NykkRomancer.SOD_FairItems[itemID].Quantity .. "|r|cffa335ee)|r", TTDF_FormatTickets(NykkRomancer.SOD_FairItems[itemID].Tier))
    end
end

GameTooltip:HookScript("OnTooltipSetItem", function(self)
    local name, link = self:GetItem();
    if link then
        local itemID = select(1, GetItemInfoInstant(link));
        AddCustomText(self, itemID);
    end
end)

ItemRefTooltip:HookScript("OnTooltipSetItem", function(self)
    local name, link = self:GetItem();
    if link then
        local itemID = select(1, GetItemInfoInstant(link));
        AddCustomText(self, itemID);
    end
end)
