local AGS = AwesomeGuildStore

local logger = AGS.internal.logger
local gettext = AGS.internal.gettext

local ItemDatabase = AGS.class.ItemDatabase
local RegisterForEvent = AGS.internal.RegisterForEvent
local IsAtGuildKiosk = AGS.internal.IsAtGuildKiosk

local KIOSK_OPTION_INDEX = AGS.internal.KIOSK_OPTION_INDEX
local FOOTER_MIN_ALPHA = 0.6
local FOOTER_MAX_ALPHA = 1
local FOOTER_FADE_DURATION = 300

local TradingHouseWrapper = ZO_Object:Subclass()
AGS.class.TradingHouseWrapper = TradingHouseWrapper

function TradingHouseWrapper:New(...)
    local wrapper = ZO_Object.New(self)
    wrapper:Initialize(...)
    return wrapper
end

function TradingHouseWrapper:Initialize(saveData)
    self.saveData = saveData
    local tradingHouse = TRADING_HOUSE
    self.tradingHouse = tradingHouse
    self.search = TRADING_HOUSE_SEARCH

    self.loadingOverlay = AGS.class.LoadingOverlay:New("AwesomeGuildStoreLoadingOverlay")
    self.loadingIndicator = AGS.class.LoadingIcon:New("AwesomeGuildStoreLoadingIndicator")
    self.loadingIndicator:SetParent(tradingHouse.control)
    self.loadingIndicator:ClearAnchors()
    self.loadingIndicator:SetAnchor(BOTTOMLEFT, tradingHouse.control, BOTTOMLEFT, 15, 20)
    local itemDatabase = ItemDatabase:New(self)
    self.itemDatabase = itemDatabase
    self.itemNameMatcher = AGS.class.ItemNameMatcher:New()
    local activityManager = AGS.class.ActivityManager:New(self, self.loadingIndicator, self.loadingOverlay)
    self.activityManager = activityManager
    local searchManager = AGS.class.SearchManager:New(self, saveData.searchManager)
    saveData.searchManager = searchManager:GetSaveData()
    self.searchManager = searchManager
    local searchTab = AGS.class.SearchTabWrapper:New(saveData)
    self.searchTab = searchTab
    local sellTab = AGS.class.SellTabWrapper:New(saveData)
    self.sellTab = sellTab
    local listingTab = AGS.class.ListingTabWrapper:New(saveData)
    self.listingTab = listingTab

    self.modeToTab =
        {
            [ZO_TRADING_HOUSE_MODE_BROWSE] = searchTab,
            [ZO_TRADING_HOUSE_MODE_SELL] = sellTab,
            [ZO_TRADING_HOUSE_MODE_LISTINGS] = listingTab,
        }

    -- we cannot wrap TRADING_HOUSE.OpenTradingHouse or RunInitialSetup as it would taint the call stack down the line
    -- e.g. when using inventory items or withdrawing from the bank
    -- instead we use the EVENT_OPEN_TRADING_HOUSE and hook into the first method after RunInitialSetup is called
    local CollectGuildKiosk = AGS.internal.CollectGuildKiosk
    RegisterForEvent(EVENT_OPEN_TRADING_HOUSE, function()
        self:ResetSalesCategoryFilter()

        if(CollectGuildKiosk) then
            CollectGuildKiosk()
        end
    end)

    local ranInitialSetup = false
    -- SetCurrentMode is the first method called after RunInitialSetup
    self:PreHook("SetCurrentMode", function()
        if(ranInitialSetup) then return end

        AGS.internal:FireCallbacks(AGS.callback.BEFORE_INITIAL_SETUP, self)

        itemDatabase:SetupItemTooltipHook()
        for mode, tab in next, self.modeToTab do
            tab:RunInitialSetup(self)
        end

        if(not saveData.minimizeChatOnOpen) then
            TRADING_HOUSE_SCENE:RemoveFragment(MINIMIZE_CHAT_FRAGMENT)
        end

        self:InitializeFooter()

        self.activityWindow = AGS.class.ActivityWindow:New(self)
        self.statusLine = AGS.class.StatusLine:New(self)

        TRADING_HOUSE_SCENE:AddFragment(self.activityWindow)
        TRADING_HOUSE_SCENE:AddFragment(self.statusLine)

        self.activityManager:SetActivityWindow(self.activityWindow)
        self.activityManager:SetStatusLine(self.statusLine)

        self:InitializeGuildSelector()
        self:InitializeKeybindStripWrapper()
        self:InitializeStoreTabAutoSwitch()
        AGS.internal:FireCallbacks(AGS.callback.AFTER_INITIAL_SETUP, self)

        ranInitialSetup = true
    end)

    -- we hook into this function in order to disable the ingame search features
    ZO_PreHook(self.search, "AssociateWithSearchFeatures", function(self)
        self.features = {}
        return true
    end)

    -- TODO this is only needed until we have implemented the history feature
    ZO_PreHook(self.search, "GenerateSearchTableShortDescription", function(self)
        return true
    end)

    local currentTab
    self:Wrap("HandleTabSwitch", function(originalHandleTabSwitch, tradingHouse, tabData)
        if(not ranInitialSetup) then return end
        local oldTab = currentTab
        if currentTab then
            currentTab:OnClose(self)
        end
        originalHandleTabSwitch(tradingHouse, tabData)
        currentTab = self.modeToTab[tabData.descriptor]
        if currentTab then
            currentTab:OnOpen(self)
        end
        AGS.internal:FireCallbacks(AGS.callback.STORE_TAB_CHANGED, oldTab, currentTab)
    end)

    self:Wrap("UpdateFragments", function(originalUpdateFragments, tradingHouse)
        -- TODO: remove once we have our own history feature
        originalUpdateFragments(tradingHouse)
        SCENE_MANAGER:RemoveFragment(TRADING_HOUSE_SEARCH_HISTORY_KEYBOARD_FRAGMENT)
    end)

    ZO_PreHook(ITEM_PREVIEW_KEYBOARD, "PreviewTradingHouseSearchResultAsFurniture", function(self, tradingHouseIndex)
        local item = itemDatabase:TryGetItemDataInCurrentGuildByUniqueId(tradingHouseIndex)
        if(item) then
            ITEM_PREVIEW_KEYBOARD:PreviewTradingHouseSearchResultItemLinkAsFurniture(item.itemLink)
            return true
        end
    end)

    RegisterForEvent(EVENT_CLOSE_TRADING_HOUSE, function()
        if(not ranInitialSetup) then return end
        self:HideLoadingIndicator()
        self:HideLoadingOverlay()
        if currentTab then
            currentTab:OnClose(self)
        end
        tradingHouse:ClearPendingPost()
    end)

    local INTERACT_WINDOW_SHOWN = "Shown"
    INTERACT_WINDOW:RegisterCallback(INTERACT_WINDOW_SHOWN, function()
        -- TODO: find a way to prevent the long wait time that happens sometimes
        -- ResetChatter, IsInteractionPending, EndPendingInteraction
        -- TODO: prevent user from selecting the guild store option again when it is already pending
        if(IsShiftKeyDown() or not saveData.skipGuildKioskDialog) then return end
        if(IsAtGuildKiosk()) then
            logger:Debug(string.format("SelectChatterOption"))
            SelectChatterOption(KIOSK_OPTION_INDEX)
        end
    end)
end

function TradingHouseWrapper:RegisterTabWrapper(mode, tab)
    assert(self.modeToTab[mode] == nil)
    self.modeToTab[mode] = tab
end

function TradingHouseWrapper:InitializeGuildSelector()
    self.guildSelection = AGS.class.GuildSelection:New(self)
    self.guildSelector = AGS.class.GuildSelector:New(self)
end

function TradingHouseWrapper:InitializeKeybindStripWrapper()
    self.keybindStrip = AGS.class.KeybindStripWrapper:New(self)
end

function TradingHouseWrapper:InitializeStoreTabAutoSwitch()
    local tradingHouse = self.tradingHouse
    RegisterForEvent(EVENT_TRADING_HOUSE_STATUS_RECEIVED, function()
        -- change to the sell tab when at a banker
        if(not IsAtGuildKiosk() and not tradingHouse:IsInSellMode() and CanSellOnTradingHouse(GetSelectedTradingHouseGuildId())) then
            ZO_MenuBar_SelectDescriptor(tradingHouse.menuBar, ZO_TRADING_HOUSE_MODE_SELL)
        end
    end)
end

function TradingHouseWrapper:InitializeFooter()
    local parent = self.tradingHouse.control
    local footer = CreateControlFromVirtual("AwesomeGuildStoreFooter", parent, "AwesomeGuildStoreFooterTemplate")
    footer:SetAnchor(BOTTOMRIGHT, parent, BOTTOMRIGHT, -20, 32)
    self.footer = footer

    local versionLabel = AGS.info.fullVersion
    local labelControl = footer:GetNamedChild("Version")
    labelControl:SetText(gettext("AwesomeGuildStore - Version: <<1>> - |cFFD700|H0|hDonate|h|r", versionLabel))
    labelControl:SetHandler("OnLinkMouseUp", AwesomeGuildStore.internal.Donate)

    local animation = ZO_AlphaAnimation:New(labelControl)
    animation:SetMinMaxAlpha(FOOTER_MIN_ALPHA, FOOTER_MAX_ALPHA)
    labelControl:SetHandler("OnMouseEnter", function() animation:FadeIn(0, FOOTER_FADE_DURATION) end)
    labelControl:SetHandler("OnMouseExit", function() animation:FadeOut(0, FOOTER_FADE_DURATION) end)
    labelControl:SetAlpha(FOOTER_MIN_ALPHA)
end

function TradingHouseWrapper:ResetSalesCategoryFilter()
    self.sellTab:ResetSalesCategoryFilter()
end

function TradingHouseWrapper:SetLoadingOverlayParent(parent)
    self.loadingOverlay:SetParent(parent)
end

function TradingHouseWrapper:ShowLoadingOverlay()
    self.loadingOverlay:Show()
end

function TradingHouseWrapper:HideLoadingOverlay()
    self.loadingOverlay:Hide()
end

function TradingHouseWrapper:ShowLoadingIndicator()
    self.loadingIndicator:Show()
end

function TradingHouseWrapper:HideLoadingIndicator()
    self.loadingIndicator:Hide()
end

function TradingHouseWrapper:RegisterFilter(filter)
    self.searchManager:RegisterFilter(filter)
end

function TradingHouseWrapper:PreHook(methodName, call)
    ZO_PreHook(self.tradingHouse, methodName, call)
end

function TradingHouseWrapper:Wrap(methodName, call)
    local tradingHouse = self.tradingHouse
    local originalFunction = tradingHouse[methodName]
    if((originalFunction ~= nil) and (type(originalFunction) == "function")) then
        tradingHouse[methodName] = function(...)
            return call(originalFunction, ...)
        end
    end
end

function TradingHouseWrapper:GetTradingGuildName(guildId)
    local guildName
    if(guildId > 0) then
        guildName = GetGuildName(guildId)
    else
        guildName = select(2, GetCurrentTradingHouseGuildDetails())
    end
    return guildName
end

function TradingHouseWrapper:DoSearch() -- TODO
    return self.searchManager:DoSearch()
end
