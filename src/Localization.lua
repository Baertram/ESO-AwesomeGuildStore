local localization = {
	en = {
		FILTER_CATEGORY_ALL = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
		FILTER_CATEGORY_WEAPON = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_WEAPONS),
		FILTER_CATEGORY_ARMOR = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ARMOR),
		FILTER_CATEGORY_CONSUMEABLE = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_CONSUMABLE),
		FILTER_CATEGORY_CRAFTING = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_CRAFTING),
		FILTER_CATEGORY_MISC = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_MISCELLANEOUS),

		FILTER_SUBCATEGORY_ALL = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
		FILTER_SUBCATEGORY_ONEHANDED = GetString("SI_EQUIPTYPE", EQUIP_TYPE_ONE_HAND),
		FILTER_SUBCATEGORY_TWOHANDED = GetString("SI_EQUIPTYPE", EQUIP_TYPE_TWO_HAND),
		FILTER_SUBCATEGORY_BOW = GetString("SI_WEAPONTYPE", WEAPONTYPE_BOW),
		FILTER_SUBCATEGORY_DESTRUCTION_STAFF = zo_strformat(SI_SKILLS_TREE_NAME_FORMAT, GetSkillLineInfo(SKILL_TYPE_WEAPON, 5)),
		FILTER_SUBCATEGORY_RESTORATION_STAFF = zo_strformat(SI_SKILLS_TREE_NAME_FORMAT, GetSkillLineInfo(SKILL_TYPE_WEAPON, 6)),

		FILTER_SUBCATEGORY_HEAVYARMOR = GetString(SI_TRADING_HOUSE_BROWSE_ARMOR_TYPE_HEAVY),
		FILTER_SUBCATEGORY_MEDIUMARMOR = GetString(SI_TRADING_HOUSE_BROWSE_ARMOR_TYPE_MEDIUM),
		FILTER_SUBCATEGORY_LIGHTARMOR = GetString(SI_TRADING_HOUSE_BROWSE_ARMOR_TYPE_LIGHT),
		FILTER_SUBCATEGORY_SHIELD = GetString(SI_TRADING_HOUSE_BROWSE_ARMOR_TYPE_SHIELD),
		FILTER_SUBCATEGORY_RING = GetString("SI_EQUIPTYPE", EQUIP_TYPE_RING),
		FILTER_SUBCATEGORY_NECK = GetString("SI_EQUIPTYPE", EQUIP_TYPE_NECK),
		FILTER_SUBCATEGORY_COSTUME = GetString("SI_EQUIPTYPE", EQUIP_TYPE_COSTUME),

		FILTER_SUBCATEGORY_FOOD = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_FOOD)),
		FILTER_SUBCATEGORY_DRINK = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_DRINK)),
		FILTER_SUBCATEGORY_RECIPE = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_RECIPE)),
		FILTER_SUBCATEGORY_POTION = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_POTION)),
		FILTER_SUBCATEGORY_MOTIF = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_RACIAL_STYLE_MOTIF)),
		FILTER_SUBCATEGORY_REPAIR = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_AVA_REPAIR)),

		FILTER_SUBCATEGORY_BLACKSMITHING = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetCraftingSkillName(CRAFTING_TYPE_BLACKSMITHING)),
		FILTER_SUBCATEGORY_CLOTHING = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetCraftingSkillName(CRAFTING_TYPE_CLOTHIER)),
		FILTER_SUBCATEGORY_WOODWORKING = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetCraftingSkillName(CRAFTING_TYPE_WOODWORKING)),
		FILTER_SUBCATEGORY_ALCHEMY = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetCraftingSkillName(CRAFTING_TYPE_ALCHEMY)),
		FILTER_SUBCATEGORY_ENCHANTING = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetCraftingSkillName(CRAFTING_TYPE_ENCHANTING)),
		FILTER_SUBCATEGORY_PROVISIONING = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetCraftingSkillName(CRAFTING_TYPE_PROVISIONING)),
		FILTER_SUBCATEGORY_STYLE = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_STYLE_MATERIAL)),
		FILTER_SUBCATEGORY_WEAPONTRAIT = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_WEAPON_TRAIT)),
		FILTER_SUBCATEGORY_ARMORTRAIT = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_ARMOR_TRAIT)),

		FILTER_SUBCATEGORY_GLYPHS = "Glyph",
		FILTER_SUBCATEGORY_SOULGEMS = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_SOUL_GEM)),
		FILTER_SUBCATEGORY_SIEGE = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_SIEGE)),
		FILTER_SUBCATEGORY_BAIT = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_LURE)),
		FILTER_SUBCATEGORY_TOOLS = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_TOOL)),

		SUBFILTER_WEAPON_TRAIT_LABEL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_WEAPON_TRAIT)),
		SUBFILTER_WEAPON_TRAIT_POWERED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_POWERED),
		SUBFILTER_WEAPON_TRAIT_CHARGED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_CHARGED),
		SUBFILTER_WEAPON_TRAIT_PRECISE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_PRECISE),
		SUBFILTER_WEAPON_TRAIT_INFUSED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_INFUSED),
		SUBFILTER_WEAPON_TRAIT_DEFENDING = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_DEFENDING),
		SUBFILTER_WEAPON_TRAIT_TRAINING = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_TRAINING),
		SUBFILTER_WEAPON_TRAIT_SHARPENED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_SHARPENED),
		SUBFILTER_WEAPON_TRAIT_WEIGHTED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_WEIGHTED),
		SUBFILTER_WEAPON_TRAIT_ORNATE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_ORNATE),
		SUBFILTER_WEAPON_TRAIT_INTRICATE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_INTRICATE),

		SUBFILTER_WEAPON_TYPE_LABEL = "Weapon Type",
		SUBFILTER_WEAPON_TYPE_AXE = GetString("SI_WEAPONTYPE", WEAPONTYPE_AXE),
		SUBFILTER_WEAPON_TYPE_MACE = GetString("SI_WEAPONTYPE", WEAPONTYPE_HAMMER),
		SUBFILTER_WEAPON_TYPE_SWORD = GetString("SI_WEAPONTYPE", WEAPONTYPE_SWORD),
		SUBFILTER_WEAPON_TYPE_DAGGER = GetString("SI_WEAPONTYPE", WEAPONTYPE_DAGGER),
		SUBFILTER_WEAPON_TYPE_FIRE = GetString("SI_WEAPONTYPE", WEAPONTYPE_FIRE_STAFF),
		SUBFILTER_WEAPON_TYPE_FROST = GetString("SI_WEAPONTYPE", WEAPONTYPE_FROST_STAFF),
		SUBFILTER_WEAPON_TYPE_LIGHTNING = GetString("SI_WEAPONTYPE", WEAPONTYPE_LIGHTNING_STAFF),

		SUBFILTER_ARMOR_TYPE_LABEL = "Armor Type",
		SUBFILTER_ARMOR_TYPE_HEAD = GetString("SI_EQUIPTYPE", EQUIP_TYPE_HEAD),
		SUBFILTER_ARMOR_TYPE_CHEST = GetString("SI_EQUIPTYPE", EQUIP_TYPE_CHEST),
		SUBFILTER_ARMOR_TYPE_SHOULDERS = GetString("SI_EQUIPTYPE", EQUIP_TYPE_SHOULDERS),
		SUBFILTER_ARMOR_TYPE_WAIST = GetString("SI_EQUIPTYPE", EQUIP_TYPE_WAIST),
		SUBFILTER_ARMOR_TYPE_LEGS = GetString("SI_EQUIPTYPE", EQUIP_TYPE_LEGS),
		SUBFILTER_ARMOR_TYPE_FEET = GetString("SI_EQUIPTYPE", EQUIP_TYPE_FEET),
		SUBFILTER_ARMOR_TYPE_HAND = GetString("SI_EQUIPTYPE", EQUIP_TYPE_HAND),

		SUBFILTER_ARMOR_TRAIT_LABEL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_ARMOR_TRAIT)),
		SUBFILTER_ARMOR_TRAIT_STURDY = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_STURDY),
		SUBFILTER_ARMOR_TRAIT_IMPENETRABLE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_IMPENETRABLE),
		SUBFILTER_ARMOR_TRAIT_REINFORCED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_REINFORCED),
		SUBFILTER_ARMOR_TRAIT_WELLFITTED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_WELL_FITTED),
		SUBFILTER_ARMOR_TRAIT_TRAINING = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_TRAINING),
		SUBFILTER_ARMOR_TRAIT_INFUSED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_INFUSED),
		SUBFILTER_ARMOR_TRAIT_EXPLORATION = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_EXPLORATION),
		SUBFILTER_ARMOR_TRAIT_DIVINES = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_DIVINES),
		SUBFILTER_ARMOR_TRAIT_ORNATE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_ORNATE),
		SUBFILTER_ARMOR_TRAIT_INTRICATE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_INTRICATE),

		SUBFILTER_JEWELRY_TRAIT_LABEL = "Jewelry Trait",
		SUBFILTER_JEWELRY_TRAIT_HEALTHY = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_JEWELRY_HEALTHY),
		SUBFILTER_JEWELRY_TRAIT_ARCANE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_JEWELRY_ARCANE),
		SUBFILTER_JEWELRY_TRAIT_ROBUST = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_JEWELRY_ROBUST),
		SUBFILTER_JEWELRY_TRAIT_ORNATE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_JEWELRY_ORNATE),

		SUBFILTER_MATERIAL_TYPE_LABEL = "Material Type",
		SUBFILTER_MATERIAL_BLACKSMITHING_RAWMATERIAL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_BLACKSMITHING_RAW_MATERIAL)),
		SUBFILTER_MATERIAL_BLACKSMITHING_MATERIAL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_BLACKSMITHING_MATERIAL)),
		SUBFILTER_MATERIAL_BLACKSMITHING_BOOSTER = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_BLACKSMITHING_BOOSTER)),
		SUBFILTER_MATERIAL_CLOTHING_RAWMATERIAL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_CLOTHIER_RAW_MATERIAL)),
		SUBFILTER_MATERIAL_CLOTHING_MATERIAL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_CLOTHIER_MATERIAL)),
		SUBFILTER_MATERIAL_CLOTHING_BOOSTER = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_CLOTHIER_BOOSTER)),
		SUBFILTER_MATERIAL_WOODWORKING_RAWMATERIAL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_WOODWORKING_RAW_MATERIAL)),
		SUBFILTER_MATERIAL_WOODWORKING_MATERIAL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_WOODWORKING_MATERIAL)),
		SUBFILTER_MATERIAL_WOODWORKING_BOOSTER = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_WOODWORKING_BOOSTER)),

		SUBFILTER_INGREDIENT_TYPE_LABEL = "Ingredient Type",
		SUBFILTER_INGREDIENT_TYPE_SOLVENT = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_ALCHEMY_BASE)),
		SUBFILTER_INGREDIENT_TYPE_REAGENT = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_REAGENT)),

		SUBFILTER_RUNE_TYPE_LABEL = "Rune Type",
		SUBFILTER_RUNE_TYPE_ASPECT = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_ENCHANTING_RUNE_ASPECT)),
		SUBFILTER_RUNE_TYPE_ESSENCE = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_ENCHANTING_RUNE_ESSENCE)),
		SUBFILTER_RUNE_TYPE_POTENCY = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_ENCHANTING_RUNE_POTENCY)),

		SUBFILTER_GLYPH_TYPE_LABEL = "Glyph Type",
		SUBFILTER_GLYPH_TYPE_ARMOR = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_GLYPH_ARMOR)),
		SUBFILTER_GLYPH_TYPE_WEAPON = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_GLYPH_WEAPON)),
		SUBFILTER_GLYPH_TYPE_JEWELRY = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_GLYPH_JEWELRY)),

		NORMAL_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_NORMAL),
		MAGIC_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_MAGIC),
		ARCANE_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_ARCANE),
		ARTIFACT_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_ARTIFACT),
		LEGENDARY_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_LEGENDARY),

		START_SEARCH_LABEL = GetString(SI_TRADING_HOUSE_DO_SEARCH),
		RESET_ALL_FILTERS_LABEL = "Reset All Filters",
		RESET_FILTER_LABEL_TEMPLATE = "Reset %s Filter",

		QUALITY_SELECTOR_TITLE = "Quality Range:",

		ITEM_NAME_QUICK_FILTER_TEXT = "Filter Item Name",
		ITEM_NAME_QUICK_FILTER_RESET = "Reset Item Name Filter",
		ITEM_NAME_QUICK_FILTER_ITEMCOUNT_TEMPLATE = GetString(SI_TRADING_HOUSE_RESULT_COUNT) .. " (<<2>>)",

		WARNING_SUBFILTER_LIMIT = "Cannot filter for more than 8 at a time",

		SETTINGS_REQUIRES_RELOADUI_WARNING = "Only is applied after you reload the UI",
		SETTINGS_REPLACE_CATEGORY_FILTER_LABEL = "Use awesome category selection",
		SETTINGS_REPLACE_CATEGORY_FILTER_DESCRIPTION = "Replaces the default dropdown selection with lots of tiny buttons",
		SETTINGS_REPLACE_PRICE_FILTER_LABEL = "Use awesome price range slider",
		SETTINGS_REPLACE_PRICE_FILTER_DESCRIPTION = "Adds a useful slider for price range selection",
		SETTINGS_REPLACE_LEVEL_FILTER_LABEL = "Use awesome level range slider",
		SETTINGS_REPLACE_LEVEL_FILTER_DESCRIPTION = "Adds a useful slider for level range selection",
		SETTINGS_REPLACE_QUALITY_FILTER_LABEL = "Use awesome quality selector",
		SETTINGS_REPLACE_QUALITY_FILTER_DESCRIPTION = "Replaces the default dropdown quality selection with a range selection",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_LABEL = "Remember filters between store visits",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_DESCRIPTION = "Leaves the store filters set during a play session instead of clearing it when you close the guild store window",
	},
	de = {
		FILTER_SUBCATEGORY_GLYPHS = "Glyphe",
		SUBFILTER_WEAPON_TYPE_LABEL = "Waffentyp",
		SUBFILTER_ARMOR_TYPE_LABEL = "Rüstungstyp",
		SUBFILTER_JEWELRY_TRAIT_LABEL = "Schmuckeigenschaften",
		SUBFILTER_MATERIAL_TYPE_LABEL = "Materialtyp",
		SUBFILTER_INGREDIENT_TYPE_LABEL = "Zutatentyp",
		SUBFILTER_RUNE_TYPE_LABEL = "Runensteintyp",
		SUBFILTER_GLYPH_TYPE_LABEL = "Glyphentyp",

		RESET_ALL_FILTERS_LABEL = "Alle Filter zurücksetzen",
		RESET_FILTER_LABEL_TEMPLATE = "%s zurücksetzen",

		QUALITY_SELECTOR_TITLE = "Qualität:",

		ITEM_NAME_QUICK_FILTER_TEXT = "Nach Namen filtern",
		ITEM_NAME_QUICK_FILTER_RESET = "Namesfilter zurücksetzen",

		WARNING_SUBFILTER_LIMIT = "Kann nur nach 8 gleichzeitig filtern",

		SETTINGS_REQUIRES_RELOADUI_WARNING = "Wird erst angewandt wenn das Interface neu geladen wurde",
		SETTINGS_REPLACE_CATEGORY_FILTER_LABEL = "Kategorieauswahl ersetzen",
		SETTINGS_REPLACE_CATEGORY_FILTER_DESCRIPTION = "Ersetzt die normale Kategorieauswahl mit vielen kleinen Schaltflächen",
		SETTINGS_REPLACE_PRICE_FILTER_LABEL = "Preisbereichauswahl verbessern",
		SETTINGS_REPLACE_PRICE_FILTER_DESCRIPTION = "Fügt einen nützlichen Schieberegler für die Preisbereichauswahl hinzu",
		SETTINGS_REPLACE_LEVEL_FILTER_LABEL = "Levelbereichauswahl verbessern",
		SETTINGS_REPLACE_LEVEL_FILTER_DESCRIPTION = "Fügt einen nützlichen Schieberegler für die Levelbereichauswahl hinzu",
		SETTINGS_REPLACE_QUALITY_FILTER_LABEL = "Qualitätsauswahl ersetzen",
		SETTINGS_REPLACE_QUALITY_FILTER_DESCRIPTION = "Ersetzt die normale Qualitätsauswahl mit einem Schieberegler",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_LABEL = "Filtereinstellungen merken",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_DESCRIPTION = "Anstatt die Filter beim Schließen des Ladenfensters zurückzusetzen bleiben sie während einer Spielesitzung erhalten",
	},
	fr = {
	}
}

local language = GetCVar("language.2")
local stringTable = ZO_ShallowTableCopy(localization["en"])

if(language ~= "en" and localization[language]) then
	ZO_ShallowTableCopy(localization[language], stringTable)
end
AwesomeGuildStore.Localization = stringTable
