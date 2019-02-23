local gettext = LibStub("LibGetText")("AwesomeGuildStore").gettext
local RegisterForEvent = AwesomeGuildStore.RegisterForEvent
local ToggleButton = AwesomeGuildStore.ToggleButton
local ClearCallLater = AwesomeGuildStore.ClearCallLater
local GetItemLinkWritCount = AwesomeGuildStore.GetItemLinkWritCount
local Print = AwesomeGuildStore.Print
local AdjustLinkStyle = AwesomeGuildStore.AdjustLinkStyle

local SearchTabWrapper = ZO_Object:Subclass()
AwesomeGuildStore.SearchTabWrapper = SearchTabWrapper

local ACTION_LAYER_NAME = "AwesomeGuildStore"

function SearchTabWrapper:New(saveData)
    local wrapper = ZO_Object.New(self)
    wrapper.saveData = saveData
    return wrapper
end

function SearchTabWrapper:RunInitialSetup(tradingHouseWrapper)
    self:PrepareIngameControls(tradingHouseWrapper)
    self:InitializeFilters(tradingHouseWrapper)
    self:InitializeButtons(tradingHouseWrapper)
    self:InitializeNavigation(tradingHouseWrapper)
    self:InitializeUnitPriceDisplay(tradingHouseWrapper)
    self:InitializeSearchResultMasterList(tradingHouseWrapper)
    self:InitializeKeybinds(tradingHouseWrapper)
    self.tradingHouseWrapper = tradingHouseWrapper
end

local function SortByFilterPriority(a, b)
    if(a.priority == b.priority) then
        return a.type < b.type
    end
    return b.priority < a.priority
end

function SearchTabWrapper:RequestUpdateFilterAnchors()
    if(self.updateFilterAnchorRequest) then
        ClearCallLater(self.updateFilterAnchorRequest)
    end
    self.updateFilterAnchorRequest = zo_callLater(function()
        self.updateFilterAnchorRequest = nil
        self:UpdateFilterAnchors()
    end, 10)
end

function SearchTabWrapper:UpdateFilterAnchors()
    local filters = self.searchManager:GetActiveFilters()
    table.sort(filters, SortByFilterPriority)

    local previousChild = self.filterAreaScrollChild
    for i = 1, #filters do
        local isFirst = (i == 1)
        local filterContainer = filters[i]:GetControl()
        filterContainer:ClearAnchors()
        filterContainer:SetAnchor(TOPLEFT, previousChild, isFirst and TOPLEFT or BOTTOMLEFT, 0, isFirst and 0 or 10)
        previousChild = filterContainer
    end
end

local function HandleFilterChanged(self)
end

local function RebuildSearchResultsPage()
    TRADING_HOUSE:RebuildSearchResultsPage()
end

function SearchTabWrapper:AttachFilter(filter) -- TODO: remove
end

function SearchTabWrapper:DetachFilter(filter) -- TODO: remove
    if(self.searchManager:DetachFilter(filter.type)) then
        filter:SetHidden(true)
        filter:SetParent(GuiRoot)
        CALLBACK_MANAGER:UnregisterCallback(filter.callbackName, HandleFilterChanged)
        if(filter.isLocal) then
            CALLBACK_MANAGER:UnregisterCallback(filter.callbackName, RebuildSearchResultsPage)
        end

        self:RequestUpdateFilterAnchors()
end
end

function SearchTabWrapper:PrepareIngameControls(tradingHouseWrapper)
    local tradingHouse = tradingHouseWrapper.tradingHouse
    local browseItemsControl = tradingHouse.browseItemsLeftPane

    -- hide all built in filters
    browseItemsControl:GetNamedChild("GlobalFeatureArea"):SetHidden(true)
    browseItemsControl:GetNamedChild("CategoryListContainer"):SetHidden(true)
    tradingHouse.itemNameSearch:SetHidden(true)
    tradingHouse.itemNameSearchLabel:SetHidden(true)
    tradingHouse.itemNameSearchAutoComplete:SetHidden(true)
    tradingHouse.featureAreaControl:SetHidden(true)
    tradingHouse.subcategoryTabsControl:SetHidden(true)

    -- make sure they are not shown on tab switch
    local dummyControl = { SetHidden = function() end }
    tradingHouse.itemNameSearch = dummyControl
    tradingHouse.itemNameSearchLabel = dummyControl
    tradingHouse.itemNameSearchAutoComplete = dummyControl
    tradingHouse.featureAreaControl = dummyControl
    tradingHouse.subcategoryTabsControl = dummyControl

    -- reanchor controls to account for the free space from hiding things
    browseItemsControl:SetAnchor(TOPLEFT, tradingHouse.control, TOPLEFT, 0, 10)
end

function SearchTabWrapper:UpdateItemsLabels(tradingHouse, itemCount, filteredItemCount)
    tradingHouse.resultCount:SetText(zo_strformat(GetString(SI_TRADING_HOUSE_RESULT_COUNT) .. " (<<2>>)", itemCount, filteredItemCount))
end

function SearchTabWrapper:InitializeFilters(tradingHouseWrapper)
    local saveData = self.saveData
    local tradingHouse = tradingHouseWrapper.tradingHouse

    local searchManager = AwesomeGuildStore.SearchManager:New(tradingHouseWrapper, saveData.searchManager) -- TODO
    saveData.searchManager = searchManager:GetSaveData()
    self.searchManager = searchManager -- TODO: move to tradinghouse wrapper
    self.categorySelector = AwesomeGuildStore.class.CategorySelector:New(tradingHouse.itemPane, searchManager) -- TODO pass the category filter to it
    tradingHouse.searchSortHeadersControl:SetAnchor(TOPRIGHT, self.categorySelector:GetControl(), BOTTOMRIGHT)
    TRADING_HOUSE_SCENE:AddFragment(self.categorySelector) -- TODO is this the right place?

    self.filterArea = AwesomeGuildStore.FilterArea:New(tradingHouse.browseItemsLeftPane, searchManager)

    searchManager:RegisterFilter(AwesomeGuildStore.class.ItemCategoryFilter:New())
    local category, subcategory = searchManager:GetCurrentCategories()
    self.categorySelector:Update(category, subcategory) -- TODO do this inside the selector

    local sortFilter = AwesomeGuildStore.class.SortFilter:New()
    sortFilter:RegisterSortOrder(AwesomeGuildStore.class.SortOrderTimeLeft:New(), true)
    sortFilter:RegisterSortOrder(AwesomeGuildStore.class.SortOrderLastSeen:New())
    sortFilter:RegisterSortOrder(AwesomeGuildStore.class.SortOrderPurchasePrice:New())
    sortFilter:RegisterSortOrder(AwesomeGuildStore.class.SortOrderUnitPrice:New())
    sortFilter:RegisterSortOrder(AwesomeGuildStore.class.SortOrderItemName:New())
    sortFilter:RegisterSortOrder(AwesomeGuildStore.class.SortOrderSellerName:New())
    sortFilter:RegisterSortOrder(AwesomeGuildStore.class.SortOrderSetName:New())
    sortFilter:RegisterSortOrder(AwesomeGuildStore.class.SortOrderItemQuality:New())
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.SortFilterFragment:New(sortFilter))
    searchManager:RegisterFilter(sortFilter)

    local priceFilter = AwesomeGuildStore.class.PriceFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.PriceRangeFilterFragment:New(priceFilter))
    searchManager:RegisterFilter(priceFilter)

    local levelFilter = AwesomeGuildStore.class.LevelFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.LevelRangeFilterFragment:New(levelFilter))
    searchManager:RegisterFilter(levelFilter)

    local unitPriceFilter = AwesomeGuildStore.class.UnitPriceFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.PriceRangeFilterFragment:New(unitPriceFilter))
    searchManager:RegisterFilter(unitPriceFilter)

    local qualityFilter = AwesomeGuildStore.class.QualityFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.QualityFilterFragment:New(qualityFilter))
    searchManager:RegisterFilter(qualityFilter)

    local textFilter = AwesomeGuildStore.class.TextFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.TextFilterFragment:New(textFilter))
    searchManager:RegisterFilter(textFilter)

    local itemStyleFilter = AwesomeGuildStore.class.ItemStyleFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiCategoryFilterFragment:New(itemStyleFilter))
    searchManager:RegisterFilter(itemStyleFilter)

    local weaponTraitFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.WEAPON_TRAIT_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(weaponTraitFilter))
    searchManager:RegisterFilter(weaponTraitFilter)

    local armorTraitFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.ARMOR_TRAIT_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(armorTraitFilter))
    searchManager:RegisterFilter(armorTraitFilter)

    local jewelryTraitFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.JEWELRY_TRAIT_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(jewelryTraitFilter))
    searchManager:RegisterFilter(jewelryTraitFilter)

    local weaponEnchantmentFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.WEAPON_ENCHANTMENT_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(weaponEnchantmentFilter))
    searchManager:RegisterFilter(weaponEnchantmentFilter)

    local armorEnchantmentFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.ARMOR_ENCHANTMENT_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(armorEnchantmentFilter))
    searchManager:RegisterFilter(armorEnchantmentFilter)

    local jewelryEnchantmentFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.JEWELRY_ENCHANTMENT_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(jewelryEnchantmentFilter))
    searchManager:RegisterFilter(jewelryEnchantmentFilter)

    local oneHandedFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.ONE_HANDED_WEAPON_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(oneHandedFilter))
    searchManager:RegisterFilter(oneHandedFilter)

    local twoHandedFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.TWO_HANDED_WEAPON_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(twoHandedFilter))
    searchManager:RegisterFilter(twoHandedFilter)

    local staffFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.STAFF_WEAPON_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(staffFilter))
    searchManager:RegisterFilter(staffFilter)

    local armorTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.ARMOR_EQUIP_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(armorTypeFilter))
    searchManager:RegisterFilter(armorTypeFilter)

    local blacksmithingMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.BLACKSMITHING_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(blacksmithingMaterialTypeFilter))
    searchManager:RegisterFilter(blacksmithingMaterialTypeFilter)

    local clothingMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.CLOTHING_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(clothingMaterialTypeFilter))
    searchManager:RegisterFilter(clothingMaterialTypeFilter)

    local woodworkingMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.WOODWORKING_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(woodworkingMaterialTypeFilter))
    searchManager:RegisterFilter(woodworkingMaterialTypeFilter)

    local styleMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.STYLE_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(styleMaterialTypeFilter))
    searchManager:RegisterFilter(styleMaterialTypeFilter)

    local alchemyMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.ALCHEMY_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(alchemyMaterialTypeFilter))
    searchManager:RegisterFilter(alchemyMaterialTypeFilter)

    local enchantingMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.ENCHANTING_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(enchantingMaterialTypeFilter))
    searchManager:RegisterFilter(enchantingMaterialTypeFilter)

    local provisioningMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.PROVISIONING_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(provisioningMaterialTypeFilter))
    searchManager:RegisterFilter(provisioningMaterialTypeFilter)

    local furnishingMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.FURNISHING_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(furnishingMaterialTypeFilter))
    searchManager:RegisterFilter(furnishingMaterialTypeFilter)

    local traitMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.TRAIT_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(traitMaterialTypeFilter))
    searchManager:RegisterFilter(traitMaterialTypeFilter)

    local jewelryMaterialTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.JEWELRY_MATERIAL_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(jewelryMaterialTypeFilter))
    searchManager:RegisterFilter(jewelryMaterialTypeFilter)

    local glyphTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.GLYPH_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(glyphTypeFilter))
    searchManager:RegisterFilter(glyphTypeFilter)

    local recipeTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.RECIPE_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(recipeTypeFilter))
    searchManager:RegisterFilter(recipeTypeFilter)

    local drinkTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.DRINK_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(drinkTypeFilter))
    searchManager:RegisterFilter(drinkTypeFilter)

    local foodTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.FOOD_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(foodTypeFilter))
    searchManager:RegisterFilter(foodTypeFilter)

    local siegeTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.SIEGE_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(siegeTypeFilter))
    searchManager:RegisterFilter(siegeTypeFilter)

    local trophyTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.TROPHY_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(trophyTypeFilter))
    searchManager:RegisterFilter(trophyTypeFilter)

    local recipeKnowledgeFilter = AwesomeGuildStore.class.RecipeKnowledgeFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(recipeKnowledgeFilter))
    searchManager:RegisterFilter(recipeKnowledgeFilter)

    local motifKnowledgeFilter = AwesomeGuildStore.class.MotifKnowledgeFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(motifKnowledgeFilter))
    searchManager:RegisterFilter(motifKnowledgeFilter)

    local traitKnowledgeFilter = AwesomeGuildStore.class.TraitKnowledgeFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(traitKnowledgeFilter))
    searchManager:RegisterFilter(traitKnowledgeFilter)

    local runeKnowledgeFilter = AwesomeGuildStore.class.RuneKnowledgeFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(runeKnowledgeFilter))
    searchManager:RegisterFilter(runeKnowledgeFilter)

    local itemSetFilter = AwesomeGuildStore.class.ItemSetFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(itemSetFilter))
    searchManager:RegisterFilter(itemSetFilter)

    local craftedItemFilter = AwesomeGuildStore.class.CraftedItemFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(craftedItemFilter))
    searchManager:RegisterFilter(craftedItemFilter)

    local skillRequirementsFilter = AwesomeGuildStore.class.SkillRequirementsFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(skillRequirementsFilter))
    searchManager:RegisterFilter(skillRequirementsFilter)

    local writTypeFilter = AwesomeGuildStore.class.GenericTradingHouseFilter:New(AwesomeGuildStore.data.MASTER_WRIT_TYPE_FILTER)
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiButtonFilterFragment:New(writTypeFilter))
    searchManager:RegisterFilter(writTypeFilter)

    local writVoucherFilter = AwesomeGuildStore.class.WritVoucherFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.PriceRangeFilterFragment:New(writVoucherFilter))
    searchManager:RegisterFilter(writVoucherFilter)

    local furnitureCategoryFilter = AwesomeGuildStore.class.FurnitureCategoryFilter:New()
    self.filterArea:RegisterFilterFragment(AwesomeGuildStore.class.MultiCategoryFilterFragment:New(furnitureCategoryFilter))
    searchManager:RegisterFilter(furnitureCategoryFilter)

    AwesomeGuildStore:FireCallbacks(AwesomeGuildStore.callback.AFTER_FILTER_SETUP, tradingHouseWrapper)

    self.searchResultList = AwesomeGuildStore.class.SearchResultListWrapper:New(tradingHouseWrapper, searchManager)
    searchManager:OnFiltersInitialized()
    self.filterArea:OnFiltersInitialized()
end

function SearchTabWrapper:AttachButton(button) -- TODO remove
end

function SearchTabWrapper:DetachButton(button) -- TODO remove
end

function SearchTabWrapper:InitializeButtons(tradingHouseWrapper) -- TODO remove?
end

function SearchTabWrapper:InitializeNavigation(tradingHouseWrapper) -- TODO: remove
end

function SearchTabWrapper:InitializeUnitPriceDisplay(tradingHouseWrapper) -- TODO remove
end

function SearchTabWrapper:PrintPurchaseMessageForEntry(entry)
    local count = entry.stackCount
    local seller = ZO_LinkHandler_CreateDisplayNameLink(entry.sellerName)
    local price = ZO_Currency_FormatPlatform(CURT_MONEY, entry.purchasePrice, ZO_CURRENCY_FORMAT_AMOUNT_ICON)
    local itemLink = AdjustLinkStyle(entry.itemLink, LINK_STYLE_BRACKETS)
    local guildName = entry.guildName
    -- TRANSLATORS: chat message when an item is bought from the store. <<1>> is replaced with the item count, <<t:2>> with the item link, <<3>> with the seller name, <<4>> with price and <<5>> with the guild store name. e.g. You have bought 1x [Rosin] from sirinsidiator for 5000g in Imperial Trading Company
    local message = gettext("You have bought <<1>>x <<t:2>> from <<3>> for <<4>> in <<5>>", count, itemLink, seller, price, guildName)
    Print(message)
end

function SearchTabWrapper:IsTradingHouseSearchResultPurchased(slotIndex) -- TODO: remove
    local entry = self.masterList[slotIndex]
    return (entry ~= nil) and entry.purchased
end

function SearchTabWrapper:GetTradingHouseSearchResultItemInfoAfterPurchase(slotIndex) -- TODO: remove
    self.returnPurchasedEntries = true
    local result = {GetTradingHouseSearchResultItemInfo(slotIndex)}
    self.returnPurchasedEntries = false
    return unpack(result)
end

function SearchTabWrapper:GetTradingHouseSearchResultItemLinkAfterPurchase(slotIndex, linkStyle) -- TODO: remove
    self.returnPurchasedEntries = true
    local link = GetTradingHouseSearchResultItemLink(slotIndex, linkStyle)
    self.returnPurchasedEntries = false
    return link
end

function SearchTabWrapper:InitializeSearchResultMasterList(tradingHouseWrapper) -- TODO: rename
    local test = AwesomeGuildStore.class.SearchHandler:New()
    self.searchList = AwesomeGuildStore.SearchList:New(self.searchManager) -- TODO
    self.masterList = {}
    self.numItemsOnPage = 0
    self.returnPurchasedEntries = false
    local saveData = self.saveData
    local tradingHouse = tradingHouseWrapper.tradingHouse
    local itemDatabase = tradingHouseWrapper.itemDatabase

    tradingHouse.control:UnregisterForEvent(EVENT_TRADING_HOUSE_CONFIRM_ITEM_PURCHASE)

    tradingHouseWrapper:Wrap("VerifyBuyItemAndShowErrors", function(originalVerifyBuyItemAndShowErrors, tradingHouse, inventorySlot)
        if(originalVerifyBuyItemAndShowErrors(tradingHouse, inventorySlot)) then
            local entry = ZO_ScrollList_GetData(inventorySlot:GetParent())
            if(not entry) then
                -- logger:Warn("no item for current inventorySlot")
                Zgoo(inventorySlot) -- TODO remove
                return false
            end

            if(entry.purchased) then
                -- TODO translation comment
                ZO_AlertNoSuppression(UI_ALERT_CATEGORY_ALERT, SOUNDS.PLAYER_ACTION_INSUFFICIENT_GOLD, gettext("Item is already in your possession."))
            else
                tradingHouse:ConfirmPendingPurchase(entry.itemUniqueId)
            end
        end
        return false -- always return false so SetPendingItemPurchase is not called in the inventoryslot.lua
    end)

    tradingHouseWrapper:Wrap("ConfirmPendingPurchase", function(originalConfirmPendingPurchase, tradingHouse, pendingPurchaseIndex)
        local originalZO_Dialogs_ShowDialog = ZO_Dialogs_ShowDialog
        ZO_Dialogs_ShowDialog = function() end
        originalConfirmPendingPurchase(tradingHouse, pendingPurchaseIndex)

        local dialog = ESO_Dialogs["CONFIRM_TRADING_HOUSE_PURCHASE"]
        dialog.buttons[1].callback = function(dialog)
            local itemData, guildId = itemDatabase:TryGetItemDataInCurrentGuildByUniqueId(dialog.purchaseIndex)
            tradingHouseWrapper.activityManager:PurchaseItem(guildId, itemData)
        end
        dialog.buttons[2].callback = function()
        -- nothing to do here
        end

        ZO_Dialogs_ShowDialog = originalZO_Dialogs_ShowDialog
        ZO_Dialogs_ShowDialog("CONFIRM_TRADING_HOUSE_PURCHASE")
        tradingHouse.ConfirmPendingPurchase = originalConfirmPendingPurchase
    end)

    AwesomeGuildStore:RegisterCallback(AwesomeGuildStore.callback.ITEM_PURCHASED, function(itemData)
        if(saveData.purchaseNotification) then
            self:PrintPurchaseMessageForEntry(itemData)
        end
        itemData.purchased = true
        self.searchResultList:RefreshVisible()
    end)

    tradingHouseWrapper:Wrap("CanBuyItem", function(originalCanBuyItem, tradingHouse, inventorySlot)
        if(not originalCanBuyItem(tradingHouse, inventorySlot)) then
            return false
        end

        local entry = ZO_ScrollList_GetData(inventorySlot:GetParent())
        if(entry.purchased or entry.soldout) then
            return false
        end

        return true
    end)
end

function SearchTabWrapper:InitializeKeybinds(tradingHouseWrapper) -- TODO: remove
    function AwesomeGuildStore.SuppressLocalFilters(pressed)
        self.suppressLocalFilters = pressed
        TRADING_HOUSE:RebuildSearchResultsPage()
    end
end

function SearchTabWrapper:OnOpen(tradingHouseWrapper)
    local tradingHouse = tradingHouseWrapper.tradingHouse
    self.categorySelector:GetControl():SetHidden(false)
    self.searchList:Show()
    PushActionLayerByName(ACTION_LAYER_NAME) -- TODO should this action layer only be active here or better in the whole trading house?
    self.isOpen = true
end

function SearchTabWrapper:OnClose(tradingHouseWrapper)
    self.searchList:Hide()
    self.categorySelector:GetControl():SetHidden(true)
    self.tradingHouseWrapper.activityManager:CancelSearch()
    self.tradingHouseWrapper.activityManager:CancelRequestNewest()
    RemoveActionLayerByName(ACTION_LAYER_NAME)

    self.isOpen = false
end
