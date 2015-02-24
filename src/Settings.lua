
local defaultData = {
	version = 11,
	lastGuildName = "",
	replaceCategoryFilter = true,
	replacePriceFilter = true,
	replaceQualityFilter = true,
	replaceLevelFilter = true,
	keepFiltersOnClose = true,
	oldQualitySelectorBehavior = false,
	displayPerUnitPrice = true,
	keepSortOrderOnClose = true,
	listWithSingleClick = true,
	sortWithoutSearch = false,
	sortField = TRADING_HOUSE_SORT_SALE_PRICE,
	sortOrder = ZO_SORT_ORDER_UP,
	searchLibrary = {
		x = 980,
		y = -5,
		width = 730,
		height = 185,
		isActive = true,
		lastState = AwesomeGuildStore.DEFAULT_SEARCH_STATE,
		searches = {},
		showTooltips = true,
	}
}

local function CreateSettingsDialog(saveData)
	local L = AwesomeGuildStore.Localization
	local LAM = LibStub("LibAddonMenu-2.0")
	local panelData = {
		type = "panel",
		name = "Awesome Guild Store",
		author = "sirinsidiator",
		version = "VERSION_NUMBER",
		registerForDefaults = true
	}
	LAM:RegisterAddonPanel("AwesomeGuildStoreOptions", panelData)
	local optionsData = {
		[1] = {
			type = "checkbox",
			name = L["SETTINGS_REPLACE_CATEGORY_FILTER_LABEL"],
			tooltip = L["SETTINGS_REPLACE_CATEGORY_FILTER_DESCRIPTION"],
			getFunc = function() return saveData.replaceCategoryFilter end,
			setFunc = function(value) saveData.replaceCategoryFilter = value end,
			warning = L["SETTINGS_REQUIRES_RELOADUI_WARNING"],
			default = defaultData.replaceCategoryFilter
		},
		[2] = {
			type = "checkbox",
			name = L["SETTINGS_REPLACE_PRICE_FILTER_LABEL"],
			tooltip = L["SETTINGS_REPLACE_PRICE_FILTER_DESCRIPTION"],
			getFunc = function() return saveData.replacePriceFilter end,
			setFunc = function(value) saveData.replacePriceFilter = value end,
			warning = L["SETTINGS_REQUIRES_RELOADUI_WARNING"],
			default = defaultData.replacePriceFilter
		},
		[3] = {
			type = "checkbox",
			name = L["SETTINGS_REPLACE_LEVEL_FILTER_LABEL"],
			tooltip = L["SETTINGS_REPLACE_LEVEL_FILTER_DESCRIPTION"],
			getFunc = function() return saveData.replaceLevelFilter end,
			setFunc = function(value) saveData.replaceLevelFilter = value end,
			warning = L["SETTINGS_REQUIRES_RELOADUI_WARNING"],
			default = defaultData.replaceLevelFilter
		},
		[4] = {
			type = "checkbox",
			name = L["SETTINGS_REPLACE_QUALITY_FILTER_LABEL"],
			tooltip = L["SETTINGS_REPLACE_QUALITY_FILTER_DESCRIPTION"],
			getFunc = function() return saveData.replaceQualityFilter end,
			setFunc = function(value) saveData.replaceQualityFilter = value end,
			warning = L["SETTINGS_REQUIRES_RELOADUI_WARNING"],
			default = defaultData.replaceQualityFilter
		},
		[5] = {
			type = "checkbox",
			name = L["SETTINGS_KEEP_FILTERS_ON_CLOSE_LABEL"],
			tooltip = L["SETTINGS_KEEP_FILTERS_ON_CLOSE_DESCRIPTION"],
			getFunc = function() return saveData.keepFiltersOnClose end,
			setFunc = function(value) saveData.keepFiltersOnClose = value end,
			default = defaultData.keepFiltersOnClose
		},
		[6] = {
			type = "checkbox",
			name = L["SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_LABEL"],
			tooltip = L["SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_DESCRIPTION"],
			getFunc = function() return saveData.oldQualitySelectorBehavior end,
			setFunc = function(value) saveData.oldQualitySelectorBehavior = value end,
			default = defaultData.oldQualitySelectorBehavior
		},
		[7] = {
			type = "checkbox",
			name = L["SETTINGS_DISPLAY_PER_UNIT_PRICE_LABEL"],
			tooltip = L["SETTINGS_DISPLAY_PER_UNIT_PRICE_DESCRIPTION"],
			getFunc = function() return saveData.displayPerUnitPrice end,
			setFunc = function(value) saveData.displayPerUnitPrice = value end,
			default = defaultData.displayPerUnitPrice
		},
		[8] = {
			type = "checkbox",
			name = L["SETTINGS_SORT_WITHOUT_SEARCH_LABEL"],
			tooltip = L["SETTINGS_SORT_WITHOUT_SEARCH_DESCRIPTION"],
			getFunc = function() return saveData.sortWithoutSearch end,
			setFunc = function(value) saveData.sortWithoutSearch = value end,
			default = defaultData.sortWithoutSearch
		},
		[9] = {
			type = "checkbox",
			name = L["SETTINGS_KEEP_SORTORDER_ON_CLOSE_LABEL"],
			tooltip = L["SETTINGS_KEEP_SORTORDER_ON_CLOSE_DESCRIPTION"],
			getFunc = function() return saveData.keepSortOrderOnClose end,
			setFunc = function(value) saveData.keepSortOrderOnClose = value end,
			default = defaultData.keepSortOrderOnClose
		},
		[10] = {
			type = "checkbox",
			name = L["SETTINGS_LIST_WITH_SINGLE_CLICK_LABEL"],
			tooltip = L["SETTINGS_LIST_WITH_SINGLE_CLICK_DESCRIPTION"],
			getFunc = function() return saveData.listWithSingleClick end,
			setFunc = function(value) saveData.listWithSingleClick = value end,
			default = defaultData.listWithSingleClick
		},
		[11] = {
			type = "checkbox",
			name = L["SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_LABEL"],
			tooltip = L["SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_DESCRIPTION"],
			getFunc = function() return saveData.searchLibrary.showTooltips end,
			setFunc = function(value) saveData.searchLibrary.showTooltips = value end,
			default = defaultData.searchLibrary.showTooltips
		},
	}
	LAM:RegisterOptionControls("AwesomeGuildStoreOptions", optionsData)
end

local function UpgradeSettings(saveData)
	if(saveData.version == 1) then
		saveData.replaceQualityFilter = defaultData.replaceQualityFilter
		saveData.replaceLevelFilter = defaultData.replaceLevelFilter
		saveData.keepFiltersOnClose = defaultData.keepFiltersOnClose
		saveData.version = 2
	end
	if(saveData.version == 2) then
		saveData.replacePriceFilter = defaultData.replacePriceFilter
		saveData.version = 3
	end
	if(saveData.version == 3) then
		saveData.replaceCategoryFilter = defaultData.replaceCategoryFilter
		saveData.version = 4
	end
	if(saveData.version == 4) then
		saveData.lastState = defaultData.searchLibrary.lastState
		saveData.version = 5
	end
	if(saveData.version == 5) then
		saveData.searchLibrary = ZO_ShallowTableCopy(defaultData.searchLibrary)
		saveData.searchLibrary.lastState = saveData.lastState
		saveData.lastState = nil
		saveData.version = 6
	end
	if(saveData.version == 6) then
		saveData.oldQualitySelectorBehavior = defaultData.oldQualitySelectorBehavior
		saveData.version = 7
	end
	if(saveData.version == 7) then
		saveData.displayPerUnitPrice = defaultData.displayPerUnitPrice
		saveData.searchLibrary.width = defaultData.searchLibrary.width
		saveData.searchLibrary.height = defaultData.searchLibrary.height
		saveData.version = 8
	end
	if(saveData.version == 8) then
		--saveData.lastGuildName = nil -- reverted
		saveData.version = 9
	end
	if(saveData.version == 9) then
		saveData.lastGuildName = saveData.lastGuildName or defaultData.lastGuildName
		saveData.version = 10
	end
	if(saveData.version == 10) then
		saveData.keepSortOrderOnClose = defaultData.keepSortOrderOnClose
		saveData.sortField = defaultData.sortField
		saveData.sortOrder = defaultData.sortOrder
		saveData.listWithSingleClick = defaultData.listWithSingleClick
		saveData.searchLibrary.showTooltips = defaultData.searchLibrary.showTooltips
		saveData.sortWithoutSearch = defaultData.sortWithoutSearch
		saveData.version = 11
	end
end

local function InitializeSettings()
	AwesomeGuildStore_Data = AwesomeGuildStore_Data or {}
	local saveData = AwesomeGuildStore_Data[GetDisplayName()] or ZO_DeepTableCopy(defaultData)
	AwesomeGuildStore_Data[GetDisplayName()] = saveData

	UpgradeSettings(saveData)
	CreateSettingsDialog(saveData)

	return saveData
end

AwesomeGuildStore.InitializeSettings = InitializeSettings
