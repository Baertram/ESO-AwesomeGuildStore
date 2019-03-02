local AGS = AwesomeGuildStore

local HiredTraderTooltip = AGS.class.HiredTraderTooltip

local GuildSelector = ZO_Object:Subclass()
AGS.class.GuildSelector = GuildSelector

function GuildSelector:New(...)
    local selector = ZO_Object.New(self)
    selector:Initialize(...)
    return selector
end

function GuildSelector:Initialize(tradingHouseWrapper)
    self.tradingHouseWrapper = tradingHouseWrapper

    local tradingHouse = tradingHouseWrapper.tradingHouse

    local parent = tradingHouse.control:GetNamedChild("Title")
    local control = CreateControlFromVirtual("AwesomeGuildStoreGuildSelector", parent, "AwesomeGuildStoreGuildSelectorTemplate")
    self.titleLabel = parent:GetNamedChild("Label")
    self.titleLabel:SetModifyTextType(MODIFY_TEXT_TYPE_NONE)

    self.guildIdByMenuIndex = {}
    self.guildSelector = control -- TODO rename

    local comboBoxControl = GetControl(control, "ComboBox")
    self.comboBox = ZO_ComboBox_ObjectFromContainer(comboBoxControl)
    self.selectedItemText = GetControl(comboBoxControl, "SelectedItemText")

    self:InitializeComboBox(comboBoxControl, self.comboBox)
    self:InitializeHiredTraderTooltip(comboBoxControl, self.comboBox)

    AGS:RegisterCallback(AGS.callback.AVAILABLE_GUILDS_CHANGED, function(guilds)
        self:SetupGuildList(guilds)

        local hasGuilds = (#guilds > 1)
        self.guildSelector:SetHidden(not hasGuilds)
        self.titleLabel:SetHidden(hasGuilds)
    end)

    AGS:RegisterCallback(AGS.callback.GUILD_SELECTION_CHANGED, function(guildData)
        local focused = WINDOW_MANAGER:GetFocusControl()
        if(focused) then focused:LoseFocus() end

        self.selectedGuildData = guildData
        self.comboBox:SetSelectedItem(guildData.guildName)
        self.traderTooltip:Update(self.selectedItemText, guildData.guildId)
        tradingHouse:UpdateForGuildChange() -- TODO: disable all the unnecessary stuff in there
    end)
end

function GuildSelector:InitializeComboBox(comboBoxControl, comboBox)
    local tradingHouse = self.tradingHouseWrapper.tradingHouse

    comboBox:SetSortsItems(false)
    comboBox:SetSelectedItemFont("ZoFontWindowTitle")
    comboBox:SetDropdownFont("ZoFontHeader2")
    comboBox:SetSpacing(8)

    comboBoxControl:SetHandler("OnMouseWheel", function(control, delta, ctrl, alt, shift)
        local currentData = self.selectedGuildData
        local newData = currentData
        local buyMode = tradingHouse:IsInSearchMode()

        repeat
            if(delta < 0) then
                newData = newData.next
            elseif(delta > 0) then
                newData = newData.previous
            end

            -- break out of the loop if the new guild can be used in the current mode
            -- TODO: remove this. just don't kick us out of the sell tab
            if(buyMode and newData.canBuy) then
                break
            elseif(not buyMode and newData.canSell) then
                break
            end
        until newData == currentData

        if(newData ~= currentData) then
            SelectTradingHouseGuildId(newData.guildId)
        end
    end)
end

function GuildSelector:InitializeHiredTraderTooltip(comboBoxControl, comboBox)
    local traderTooltip = HiredTraderTooltip:New(self.tradingHouseWrapper.saveData)
    local function GuildSelectorShowTooltip(control)
        local guildId = self.guildIdByMenuIndex[control.menuIndex]
        if(not guildId) then
            guildId = self.selectedGuildData.guildId
        end
        traderTooltip:Show(control, guildId)
    end
    local function GuildSelectorHideTooltip(control)
        traderTooltip:Hide(control)
    end

    local hooked = false
    local originalZO_Menu_EnterItem, originalZO_Menu_ExitItem
    ZO_PreHook(comboBox, "ShowDropdownInternal", function(comboBox)
        if(not hooked) then
            hooked = true
            originalZO_Menu_EnterItem = ZO_Menu_EnterItem
            originalZO_Menu_ExitItem = ZO_Menu_ExitItem
            ZO_PreHook("ZO_Menu_EnterItem", GuildSelectorShowTooltip)
            ZO_PreHook("ZO_Menu_ExitItem", GuildSelectorHideTooltip)
        end
    end)

    ZO_PreHook(comboBox, "HideDropdownInternal", function(comboBox)
        if(hooked) then
            hooked = false
            ZO_Menu_EnterItem = originalZO_Menu_EnterItem
            ZO_Menu_ExitItem = originalZO_Menu_ExitItem
        end
    end)

    self.traderTooltip = traderTooltip

    self.selectedItemText:SetHandler("OnMouseEnter", GuildSelectorShowTooltip)
    self.selectedItemText:SetHandler("OnMouseExit", GuildSelectorHideTooltip)
end

local function OnSelectionChanged(comboBox, selectedName, selectedEntry)
    SelectTradingHouseGuildId(selectedEntry.data.guildId)
end

local function ByGuildIdAsc(a, b)
    return a.data.guildId < b.data.guildId
end

function GuildSelector:SetupGuildList(guilds)
    local comboBox = self.comboBox
    comboBox:ClearItems()

    local entries = {}
    for i = 1, #guilds do
        local data = guilds[i]
        local entry = comboBox:CreateItemEntry(data.entryText, OnSelectionChanged)
        entry.data = data
        entries[#entries + 1] = entry
    end
    table.sort(entries, ByGuildIdAsc)

    comboBox:AddItems(entries)

    local guildIdByMenuIndex = self.guildIdByMenuIndex
    for i = 1, #entries do
        local entry = entries[i]
        guildIdByMenuIndex[i] = entry.data.guildId
    end
end

function GuildSelector:Enable()
    self.comboBox:SetEnabled(true)
end

function GuildSelector:Disable()
    self.comboBox:SetEnabled(false)
end

function GuildSelector:Show()
    self.guildSelector:SetHidden(false)
end

function GuildSelector:Hide()
    self.guildSelector:SetHidden(true)
end
