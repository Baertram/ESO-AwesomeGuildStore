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
		FILTER_SUBCATEGORY_JEWELRY = "Jewelry",
		FILTER_SUBCATEGORY_COSTUME = GetString("SI_EQUIPTYPE", EQUIP_TYPE_COSTUME),

		FILTER_SUBCATEGORY_FOOD = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_FOOD)),
		FILTER_SUBCATEGORY_DRINK = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_DRINK)),
		FILTER_SUBCATEGORY_RECIPE = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_RECIPE)),
		FILTER_SUBCATEGORY_POTION = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_POTION)),
		FILTER_SUBCATEGORY_MOTIF = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_RACIAL_STYLE_MOTIF)),
		FILTER_SUBCATEGORY_CONTAINER = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_CONTAINER)),
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
		FILTER_SUBCATEGORY_TROPHY = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_TROPHY)),

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
		SUBFILTER_WEAPON_TRAIT_NIRNHONED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_WEAPON_NIRNHONED),

		SUBFILTER_WEAPON_ENCHANTMENT_LABEL = "Weapon Enchantment",

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

		SUBFILTER_ARMOR_ENCHANTMENT_LABEL = "Armor Enchantment",

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
		SUBFILTER_ARMOR_TRAIT_NIRNHONED = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_ARMOR_NIRNHONED),

		SUBFILTER_JEWELRY_TYPE_LABEL = "Jewelry Type",
		SUBFILTER_JEWELRY_TYPE_RING = GetString("SI_EQUIPTYPE", EQUIP_TYPE_RING),
		SUBFILTER_JEWELRY_TYPE_NECK = GetString("SI_EQUIPTYPE", EQUIP_TYPE_NECK),

		SUBFILTER_JEWELRY_TRAIT_LABEL = "Jewelry Trait",
		SUBFILTER_JEWELRY_TRAIT_HEALTHY = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_JEWELRY_HEALTHY),
		SUBFILTER_JEWELRY_TRAIT_ARCANE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_JEWELRY_ARCANE),
		SUBFILTER_JEWELRY_TRAIT_ROBUST = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_JEWELRY_ROBUST),
		SUBFILTER_JEWELRY_TRAIT_ORNATE = GetString("SI_ITEMTRAITTYPE", ITEM_TRAIT_TYPE_JEWELRY_ORNATE),

		SUBFILTER_JEWELRY_ENCHANTMENT_LABEL = "Jewelry Enchantment",

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
		SUBFILTER_MATERIAL_STYLE_RAWMATERIAL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_RAW_MATERIAL)),
		SUBFILTER_MATERIAL_STYLE_MATERIAL = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_STYLE_MATERIAL)),

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

		SUBFILTER_RECIPE_KNOWLEDGE_LABEL = "Recipe Knowledge",
		SUBFILTER_RECIPE_KNOWLEDGE_UNKNOWN = "Unkown Recipes",
		SUBFILTER_RECIPE_KNOWLEDGE_KNOWN = "Known Recipes",

		SUBFILTER_MOTIF_KNOWLEDGE_LABEL = "Motif Knowledge",
		SUBFILTER_MOTIF_KNOWLEDGE_UNKNOWN = "Unkown Motifs",
		SUBFILTER_MOTIF_KNOWLEDGE_KNOWN = "Known Motifs",

		NORMAL_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_NORMAL),
		MAGIC_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_MAGIC),
		ARCANE_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_ARCANE),
		ARTIFACT_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_ARTIFACT),
		LEGENDARY_QUALITY_LABEL = GetString(SI_TRADING_HOUSE_BROWSE_QUALITY_LEGENDARY),

		START_SEARCH_LABEL = GetString(SI_TRADING_HOUSE_DO_SEARCH),
		SEARCH_PREVIOUS_PAGE_LABEL = "Show Previous Page",
		SEARCH_SHOW_MORE_LABEL = "Show More Results",
		RESET_ALL_FILTERS_LABEL = "Reset All Filters",
		RESET_FILTER_LABEL_TEMPLATE = "Reset %s Filter",

		CATEGORY_TITLE = "Category",
		SUBCATEGORY_TITLE = "Subcategory",

		PRICE_SELECTOR_TITLE = GetString(SI_TRADING_HOUSE_BROWSE_PRICE_RANGE_LABEL),

		LEVEL_SELECTOR_TITLE = GetString(SI_TRADING_HOUSE_BROWSE_LEVEL_RANGE_LABEL),
		VR_SELECTOR_TITLE = GetString(SI_TRADING_HOUSE_BROWSE_VETERAN_RANK_RANGE_LABEL),

		QUALITY_SELECTOR_TITLE = "Quality Range:",

		TEXT_FILTER_TITLE = "Text Filter:",
		TEXT_FILTER_TEXT = "Filter by text",
		TEXT_FILTER_ITEMCOUNT_TEMPLATE = GetString(SI_TRADING_HOUSE_RESULT_COUNT) .. " (<<2>>)",

		UNIT_PRICE_FILTER_TITLE = "Unit Price Filter:",

		WARNING_SUBFILTER_LIMIT = "Cannot filter for more than 8 at a time",

		SEARCH_LIBRARY_TOGGLE_LABEL = "Toggle Search Library",
		SEARCH_LIBRARY_HISTORY_LABEL = "History",
		SEARCH_LIBRARY_FAVORITES_LABEL = "Favorites",
		SEARCH_LIBRARY_FAVORITE_BUTTON_ADD_TOOLTIP = "Add to Favorites",
		SEARCH_LIBRARY_FAVORITE_BUTTON_REMOVE_TOOLTIP = "Remove from Favorites",
		SEARCH_LIBRARY_EDIT_LABEL_BUTTON_TOOLTIP = "Rename Entry",
		SEARCH_LIBRARY_DELETE_LABEL_BUTTON_TOOLTIP = "Remove from History",
		SEARCH_LIBRARY_MENU_OPEN_SETTINGS = "Open Addon Settings",
		SEARCH_LIBRARY_MENU_CLEAR_HISTORY = "Clear History",
		SEARCH_LIBRARY_MENU_CLEAR_FAVORITES = "Clear Favorites",
		SEARCH_LIBRARY_MENU_UNDO_ACTION = "Undo Last Action",
		SEARCH_LIBRARY_MENU_UNLOCK_WINDOW = "Unlock Window",
		SEARCH_LIBRARY_MENU_LOCK_WINDOW = "Lock Window",
		SEARCH_LIBRARY_MENU_RESET_WINDOW = "Reset Window",
		SEARCH_LIBRARY_MENU_CLOSE_WINDOW = "Close Window",

		TOOLTIP_LESS_THAN = "under ",
		TOOLTIP_GREATER_THAN = "over ",

		MAIL_AUGMENTATION_MESSAGE_BODY = "You sold <<2>> <<t:1>> to <<3>>.",
		MAIL_AUGMENTATION_INVOICE_SELL_VALUE = "Sell Value",
		MAIL_AUGMENTATION_INVOICE_LISTING_FEE = "Listing Fee",
		MAIL_AUGMENTATION_INVOICE_GUILD_BANK = "Guild Bank",
		MAIL_AUGMENTATION_INVOICE_COMMISSION = "Commission",
		MAIL_AUGMENTATION_INVOICE_LISTING_FEE_REFUND = "Listing Fee (refund)",
		MAIL_AUGMENTATION_INVOICE_PROFIT = "Profit",
		MAIL_AUGMENTATION_REQUEST_DATA = "Load Details",

		SETTINGS_REQUIRES_RELOADUI_WARNING = "Only is applied after you reload the UI",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_LABEL = "Remember filters between store visits",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_DESCRIPTION = "Leaves the store filters set during a play session instead of clearing it when you close the guild store window and restores the last active state when the UI is loaded",
		SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_LABEL = "Use old quality selector behavior",
		SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_DESCRIPTION = "When enabled left and right click set lower and upper quality and double or shift click sets both to the same value",
		SETTINGS_DISPLAY_PER_UNIT_PRICE_LABEL = "Show per unit price in search results",
		SETTINGS_DISPLAY_PER_UNIT_PRICE_DESCRIPTION = "When enabled the results of a guild store search show the per unit price of a stack below the overall price",
		SETTINGS_SORT_WITHOUT_SEARCH_LABEL = "Select order without search",
		SETTINGS_SORT_WITHOUT_SEARCH_DESCRIPTION = "Allows you to change the sort order without triggering a new search. The currently shown results will only change after a manual search",
		SETTINGS_KEEP_SORTORDER_ON_CLOSE_LABEL = "Remember sort order",
		SETTINGS_KEEP_SORTORDER_ON_CLOSE_DESCRIPTION = "Leaves the store sort order set between play sessions instead of clearing it.",
		SETTINGS_LIST_WITH_SINGLE_CLICK_LABEL = "Single click item listing",
		SETTINGS_LIST_WITH_SINGLE_CLICK_DESCRIPTION = "Select items for sale with a single click in the sell tab.",
		SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_LABEL = "Tooltips in Search Library",
		SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_DESCRIPTION = "When active, a tooltip with details like level and quality is shown for each entry in the search library.",
		SETTINGS_SHOW_TRADER_TOOLTIPS_LABEL = "Trader Tooltips",
		SETTINGS_SHOW_TRADER_TOOLTIPS_DESCRIPTION = "Show the currently hired trader for a guild that you are a member of, when hovering over the name or an entry in the drop down menu",
		SETTINGS_AUTO_CLEAR_HISTORY_LABEL = "Auto clear history",
		SETTINGS_AUTO_CLEAR_HISTORY_DESCRIPTION = "Automatically deletes all history entries when you open the guild store for the first time in a game session. You can undo the deletion via the menu in the search library",
		SETTINGS_MAIL_AUGMENTATION_LABEL = "Mail augmentation",
		SETTINGS_MAIL_AUGMENTATION_DESCRIPTION = "Adds detailed information about a transaction to an incoming Guild Store Mail if the data is available in the Guild Activity Log.",

		INVALID_STATE = "Invalid Store State.\nThis is a bug in the game and should be fixed soon.",

		LOCAL_FILTER_EXPLANATION_TOOLTIP = "This filter is local and only applies to the currently visible page",
	},
	de = {
		FILTER_SUBCATEGORY_GLYPHS = "Glyphe",
		FILTER_SUBCATEGORY_JEWELRY = "Schmuck",
		SUBFILTER_WEAPON_TYPE_LABEL = "Waffentyp",
		SUBFILTER_ARMOR_TYPE_LABEL = "Rüstungstyp",
		SUBFILTER_JEWELRY_TYPE_LABEL = "Schmucktyp",
		SUBFILTER_JEWELRY_TRAIT_LABEL = "Schmuckeigenschaften",
		SUBFILTER_MATERIAL_TYPE_LABEL = "Materialtyp",
		SUBFILTER_INGREDIENT_TYPE_LABEL = "Zutatentyp",
		SUBFILTER_RUNE_TYPE_LABEL = "Runensteintyp",
		SUBFILTER_GLYPH_TYPE_LABEL = "Glyphentyp",

		SUBFILTER_RECIPE_KNOWLEDGE_LABEL = "Rezeptwissen",
		SUBFILTER_RECIPE_KNOWLEDGE_UNKNOWN = "Unbekannte Rezepte",
		SUBFILTER_RECIPE_KNOWLEDGE_KNOWN = "Bekannte Rezepte",

		SUBFILTER_MOTIF_KNOWLEDGE_LABEL = "Motivwissen",
		SUBFILTER_MOTIF_KNOWLEDGE_UNKNOWN = "Unbekannte Motive",
		SUBFILTER_MOTIF_KNOWLEDGE_KNOWN = "Bekannte Motive",

		SEARCH_PREVIOUS_PAGE_LABEL = "Vorherige Seite anzeigen",
		SEARCH_SHOW_MORE_LABEL = "Mehr Ergebnisse anzeigen",
		RESET_ALL_FILTERS_LABEL = "Alle Filter zurücksetzen",
		RESET_FILTER_LABEL_TEMPLATE = "%s zurücksetzen",

		CATEGORY_TITLE = "Kategorie",
		SUBCATEGORY_TITLE = "Unterkategorie",

		QUALITY_SELECTOR_TITLE = "Qualität:",

		TEXT_FILTER_TITLE = "Textfilter:",
		TEXT_FILTER_TEXT = "Nach Text filtern",

		UNIT_PRICE_FILTER_TITLE = "Stückpreisfilter:",

		WARNING_SUBFILTER_LIMIT = "Kann nur nach 8 gleichzeitig filtern",

		SEARCH_LIBRARY_TOGGLE_LABEL = "Suchbibliothek umschalten",
		SEARCH_LIBRARY_HISTORY_LABEL = "Verlauf",
		SEARCH_LIBRARY_FAVORITES_LABEL = "Favoriten",
		SEARCH_LIBRARY_FAVORITE_BUTTON_ADD_TOOLTIP = "Zu Favoriten hinzufügen",
		SEARCH_LIBRARY_FAVORITE_BUTTON_REMOVE_TOOLTIP = "Von Favoriten entfernen",
		SEARCH_LIBRARY_EDIT_LABEL_BUTTON_TOOLTIP = "Eintrag umbenennen",
		SEARCH_LIBRARY_DELETE_LABEL_BUTTON_TOOLTIP = "Aus Verlauf entfernen",
		SEARCH_LIBRARY_MENU_OPEN_SETTINGS = "Einstellungen öffnen",
		SEARCH_LIBRARY_MENU_CLEAR_HISTORY = "Verlauf löschen",
		SEARCH_LIBRARY_MENU_CLEAR_FAVORITES = "Favoriten löschen",
		SEARCH_LIBRARY_MENU_UNDO_ACTION = "Aktion rückgängig machen",
		SEARCH_LIBRARY_MENU_UNLOCK_WINDOW = "Fenster entsperren",
		SEARCH_LIBRARY_MENU_LOCK_WINDOW = "Fenster sperren",
		SEARCH_LIBRARY_MENU_RESET_WINDOW = "Fenster zurücksetzen",
		SEARCH_LIBRARY_MENU_CLOSE_WINDOW = "Fenster schließen",

		TOOLTIP_LESS_THAN = "unter ",
		TOOLTIP_GREATER_THAN = "über ",

		MAIL_AUGMENTATION_MESSAGE_BODY = "Du hast <<2>> <<t:1>> an <<3>> verkauft.",
		MAIL_AUGMENTATION_INVOICE_SELL_VALUE = "Verkaufswert",
		MAIL_AUGMENTATION_INVOICE_LISTING_FEE = "Einstellgebühr",
		MAIL_AUGMENTATION_INVOICE_GUILD_BANK = "Gildenbank",
		MAIL_AUGMENTATION_INVOICE_COMMISSION = "Provision",
		MAIL_AUGMENTATION_INVOICE_LISTING_FEE_REFUND = "Einstellgebühr (Rückzahlung)",
		MAIL_AUGMENTATION_INVOICE_PROFIT = "Gewinn",
		MAIL_AUGMENTATION_REQUEST_DATA = "Lade Details",

		SETTINGS_REQUIRES_RELOADUI_WARNING = "Wird erst angewandt wenn das Interface neu geladen wurde",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_LABEL = "Filtereinstellungen merken",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_DESCRIPTION = "Anstatt die Filter beim Schließen des Ladenfensters zurückzusetzen bleiben sie während einer Spielesitzung erhalten, außerdem werden beim Laden der UI die letzten aktiven Einstellungen wiederhergestellt",
		SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_LABEL = "Verwende altes Qualitätsfilterverhalten",
		SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_DESCRIPTION = "Wenn aktiviert, setzt ein Links- und Rechtsklick die Unter- bzw. Obergrenze und Doppel- oder Shift-Klick beide Grenzen auf den selben Wert",
		SETTINGS_DISPLAY_PER_UNIT_PRICE_LABEL = "Stückpreis in Ergebnissen anzeigen",
		SETTINGS_DISPLAY_PER_UNIT_PRICE_DESCRIPTION = "Wenn aktiviert, wird in Suchergebnissen unterhalb des Gesamtpreises eines Stapels der Stückpreis angezeigt",
		SETTINGS_SORT_WITHOUT_SEARCH_LABEL = "Sortierung ohne Suchen wählen",
		SETTINGS_SORT_WITHOUT_SEARCH_DESCRIPTION = "Erlaubt das Ändern der Sortierung ohne automatisch eine neue Suche zu starten. Die angezeigten Resultate ändern sich erst bei einer manuellen Suche",
		SETTINGS_KEEP_SORTORDER_ON_CLOSE_LABEL = "Sortierung merken",
		SETTINGS_KEEP_SORTORDER_ON_CLOSE_DESCRIPTION = "Speichert die Sortierung im Ladenfensters zwischen Spielesitzungen",
		SETTINGS_LIST_WITH_SINGLE_CLICK_LABEL = "Mit einem Klick anbieten",
		SETTINGS_LIST_WITH_SINGLE_CLICK_DESCRIPTION = "Gegenstände werden im Verkaufsreiter mit einem Klick angeboten",
		SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_LABEL = "Kurzinfo in der Suchbibliothek",
		SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_DESCRIPTION = "Wenn aktiviert, werden Kurzinfos mit Details wie Level und Qualität zu den Einträgen in der Suchbibliothek angezeigt",
		SETTINGS_SHOW_TRADER_TOOLTIPS_LABEL = "Händler Kurzinfo",
		SETTINGS_SHOW_TRADER_TOOLTIPS_DESCRIPTION = "Zeigt den derzeit angeheuerten Händler einer Gilde der du angehörst, wenn du die Maus über den Namen oder einen Eintrag in der Selektion bewegst",
		SETTINGS_AUTO_CLEAR_HISTORY_LABEL = "Verlauf automatisch entleeren",
		SETTINGS_AUTO_CLEAR_HISTORY_DESCRIPTION = "Löscht automatisch alle Einträge im Verlauf wenn du den Gildenladen zum ersten Mal während einer Spielesitzung besuchst. Du kannst die Löschung über das Menü in der Suchbibliothek rückgängig machen",

		INVALID_STATE = "Ungültiger Händlerzustand.\nDas ist ein Fehler im Spiel und sollte bald behoben werden.",

		LOCAL_FILTER_EXPLANATION_TOOLTIP = "Dieser Filter ist lokal und wirkt nur auf der derzeit sichtbaren Seite",
	},
	fr = {
		FILTER_SUBCATEGORY_JEWELRY = GetString(SI_GAMEPADITEMCATEGORY38),
		FILTER_SUBCATEGORY_GLYPHS = GetString(SI_GAMEPADITEMCATEGORY13),

		SUBFILTER_WEAPON_ENCHANTMENT_LABEL = "Enchantement d'arme",
		SUBFILTER_WEAPON_TYPE_LABEL = "Type d'arme",
		SUBFILTER_ARMOR_TYPE_LABEL = "Type d'armure",
		SUBFILTER_ARMOR_ENCHANTMENT_LABEL = "Enchantement d'armure",
		SUBFILTER_JEWELRY_TYPE_LABEL = "Type de bijou",
		SUBFILTER_JEWELRY_TRAIT_LABEL = "Trait du bijou",
		SUBFILTER_JEWELRY_ENCHANTMENT_LABEL = "Enchantement du bijou",
		SUBFILTER_MATERIAL_TYPE_LABEL = "Type de matériau",
		SUBFILTER_INGREDIENT_TYPE_LABEL = "Type d'ingrédient",
		SUBFILTER_RUNE_TYPE_LABEL = "Type de rune",
		SUBFILTER_GLYPH_TYPE_LABEL = "Type de glyphe",
		SUBFILTER_RECIPE_KNOWLEDGE_LABEL = "Type de recette",
		SUBFILTER_RECIPE_KNOWLEDGE_UNKNOWN = "Recettes inconnues",
		SUBFILTER_RECIPE_KNOWLEDGE_KNOWN = "Recettes connues",
		SUBFILTER_MOTIF_KNOWLEDGE_LABEL = "Connaissance du motif",
		SUBFILTER_MOTIF_KNOWLEDGE_UNKNOWN = "Motif inconnu",
		SUBFILTER_MOTIF_KNOWLEDGE_KNOWN = "Motif connu",

		SEARCH_PREVIOUS_PAGE_LABEL = "Afficher la page précédente",
		SEARCH_SHOW_MORE_LABEL = "Afficher les résultats suivants",

		RESET_ALL_FILTERS_LABEL = "Réinitialiser tous les filtres",
		RESET_FILTER_LABEL_TEMPLATE = "Réinitialiser le filtre %s",

		CATEGORY_TITLE = "Catégorie",
		SUBCATEGORY_TITLE = "Sous-catégorie",

		QUALITY_SELECTOR_TITLE = "Qualité de l'objet:",

		TEXT_FILTER_TITLE = "Filtre textuel:",
		TEXT_FILTER_TEXT = "Filtrer selon le nom",

		WARNING_SUBFILTER_LIMIT = "Votre filtre est trop complexe, veuillez vous limiter à 8 critères",

		SEARCH_LIBRARY_TOGGLE_LABEL = "Afficher/Masquer la fenêtre de recherche",
		SEARCH_LIBRARY_HISTORY_LABEL = "Historique",
		SEARCH_LIBRARY_FAVORITES_LABEL = "Favoris",
		SEARCH_LIBRARY_FAVORITE_BUTTON_ADD_TOOLTIP = "Ajouter aux favoris",
		SEARCH_LIBRARY_FAVORITE_BUTTON_REMOVE_TOOLTIP = "Supprimer des favoris",
		SEARCH_LIBRARY_EDIT_LABEL_BUTTON_TOOLTIP = "Renommer l'entrée ",
		SEARCH_LIBRARY_DELETE_LABEL_BUTTON_TOOLTIP = "Supprimer de l'historique",
		SEARCH_LIBRARY_MENU_OPEN_SETTINGS = "Afficher le paramétrage de l'addon",
		SEARCH_LIBRARY_MENU_CLEAR_HISTORY = "Effacer l'historique",
		SEARCH_LIBRARY_MENU_CLEAR_FAVORITES = "Effacer les favoris",
		SEARCH_LIBRARY_MENU_UNDO_ACTION = "Annuler la dernière action",
		SEARCH_LIBRARY_MENU_UNLOCK_WINDOW = "Déverrouiller la fenêtre",
		SEARCH_LIBRARY_MENU_LOCK_WINDOW = "Verrouiller la fenêtre",
		SEARCH_LIBRARY_MENU_RESET_WINDOW = "Réinitialiser la fenêtre",
		SEARCH_LIBRARY_MENU_CLOSE_WINDOW = "Fermer la fenêtre",

		TOOLTIP_LESS_THAN = "moins de ",
		TOOLTIP_GREATER_THAN = "plus que ",

		MAIL_AUGMENTATION_MESSAGE_BODY = "Vous avez vendu <<2>> <<t:1>> à <<3>>.",
		MAIL_AUGMENTATION_INVOICE_SELL_VALUE = GetString(SI_TRADING_HOUSE_POSTING_PRICE_TOTAL),
		MAIL_AUGMENTATION_INVOICE_LISTING_FEE = GetString(SI_TRADING_HOUSE_POSTING_LISTING_FEE),
		MAIL_AUGMENTATION_INVOICE_GUILD_BANK = GetString(SI_TRADING_HOUSE_POSTING_TH_CUT),
		MAIL_AUGMENTATION_INVOICE_COMMISSION = "Commission",
		MAIL_AUGMENTATION_INVOICE_LISTING_FEE_REFUND = GetString(SI_TRADING_HOUSE_POSTING_LISTING_FEE) .. " (remboursement)",
		MAIL_AUGMENTATION_INVOICE_PROFIT = GetString(SI_TRADING_HOUSE_POSTING_PROFIT),
		MAIL_AUGMENTATION_REQUEST_DATA = "Chargement des détails",

		SETTINGS_REQUIRES_RELOADUI_WARNING = "Sera appliqué uniquement après le rechargement de l'interface (ReloadUI)",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_LABEL = "Se souvenir des filtres entre les boutiques",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_DESCRIPTION = "Se souvenir des filtres de recherche entre les différentes boutiques et entre les sessions de jeu",
		SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_LABEL = "Filtres de qualité à la souris",
		SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_DESCRIPTION = "Lorsque l'option est activée, le clic gauche et le clic droit sur un filtre de qualité permettront d'augmenter ou de diminuer le type de qualité de l'objet à rechercher. Un double clic ou un Shift-Clic sélectionnera lui la qualité sélectionnée",
		SETTINGS_DISPLAY_PER_UNIT_PRICE_LABEL = "Afficher le prix unitaire",
		SETTINGS_DISPLAY_PER_UNIT_PRICE_DESCRIPTION = "Lorsque cette option est activée, le prix unitaire est affiché sous le prix de la transaction",
		SETTINGS_SORT_WITHOUT_SEARCH_LABEL = "Ordre de tri manuel",
		SETTINGS_SORT_WITHOUT_SEARCH_DESCRIPTION = "Vous permet de sélectionner l'ordre de tri avant une recherche. Veuillez noter qu'il vous faudra valider une nouvelle recherche pour afficher les résultats dans un ordre différent",
		SETTINGS_KEEP_SORTORDER_ON_CLOSE_LABEL = "Se souvenir de l'ordre de tri",
		SETTINGS_KEEP_SORTORDER_ON_CLOSE_DESCRIPTION = "Mémorise les préférences de tri en se déconnectant",
		SETTINGS_LIST_WITH_SINGLE_CLICK_LABEL = "Vente en 1 clic",
		SETTINGS_LIST_WITH_SINGLE_CLICK_DESCRIPTION = "Placez vos objets en vente en 1 clic au lieu d'un double clic dans l'onglet de vente.",
		SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_LABEL = "Infobulles dans la fenêtre de recherche",
		SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_DESCRIPTION = "Lorsque l'option est activée, une infobulle affichant les informations détaillées de l'entrée est affichée lorsque vous passez la souris au-dessus de celle-ci",
		SETTINGS_SHOW_TRADER_TOOLTIPS_LABEL = "Infobulle sur le vendeur",
		SETTINGS_SHOW_TRADER_TOOLTIPS_DESCRIPTION = "Affiche la localisation du vendeur actuellement embauché pour la guilde dont vous êtes membre lorsque vous passez la souris au-dessus du nom de celle-ci ou en la sélectionnant dans la liste déroulante",
		SETTINGS_AUTO_CLEAR_HISTORY_LABEL = "Effacer automatiquement l'historique",
		SETTINGS_AUTO_CLEAR_HISTORY_DESCRIPTION = "Supprime automatiquement l'historique à chaque lancement du jeu. Vous pouvez annuler la suppression via le menu dans la fenêtre de recherche",
		SETTINGS_MAIL_AUGMENTATION_LABEL = "Détail des transactions dans les mails",
		SETTINGS_MAIL_AUGMENTATION_DESCRIPTION = "Affiche un récapitulatif détaillé des transactions effectuées à la boutique de guilde si les informations sont disponibles via l'historique des ventes de celle-ci.",
		INVALID_STATE = "Boutique de guilde indisponible.\nCeci est un bug du jeu et devrait être résolu bientôt.",
		LOCAL_FILTER_EXPLANATION_TOOLTIP = "Ce filtre est visuel et ne s'applique qu'à la page en cours",
	},
	ru = {
		FILTER_SUBCATEGORY_JEWELRY = "Àèæóòepèü",
		FILTER_SUBCATEGORY_GLYPHS = "Âìèñÿ",
		SUBFILTER_WEAPON_ENCHANTMENT_LABEL = "Çaùapoáaîèü opóæèü",
		SUBFILTER_WEAPON_TYPE_LABEL = "Òèï opóæèü",
		SUBFILTER_ARMOR_TYPE_LABEL = "Òèï àpoîè",
		SUBFILTER_ARMOR_ENCHANTMENT_LABEL = "Çaùapoáaîèü àpoîè",
		SUBFILTER_JEWELRY_TYPE_LABEL = "Òèï àèæóòepèè",
		SUBFILTER_JEWELRY_TRAIT_LABEL = "Ocoàeîîocòö àèæóòepèè",
		SUBFILTER_JEWELRY_ENCHANTMENT_LABEL = "Çaùapoáaîèe àèæóòepèè",
		SUBFILTER_MATERIAL_TYPE_LABEL = "Òèï íaòepèaìa",
		SUBFILTER_INGREDIENT_TYPE_LABEL = "Òèï èâpeäèeîòa",
		SUBFILTER_RUNE_TYPE_LABEL = "Òèï póîÿ",
		SUBFILTER_GLYPH_TYPE_LABEL = "Òèï âìèña",

		SUBFILTER_RECIPE_KNOWLEDGE_LABEL = "Çîaîèe peœeïòoá",
		SUBFILTER_RECIPE_KNOWLEDGE_UNKNOWN = "Îeèçáecòîÿe peœeïòÿ",
		SUBFILTER_RECIPE_KNOWLEDGE_KNOWN = "Èçáecòîÿe peœeïòÿ",

		SUBFILTER_MOTIF_KNOWLEDGE_LABEL = "Çîaîèe còèìeé",
		SUBFILTER_MOTIF_KNOWLEDGE_UNKNOWN = "Îeèçáecòîÿe còèìè",
		SUBFILTER_MOTIF_KNOWLEDGE_KNOWN = "Èçáecòîÿe còèìè",

		SEARCH_PREVIOUS_PAGE_LABEL = "Ïoêaçaòö ïpeä. còp.",
		SEARCH_SHOW_MORE_LABEL = "Ïoêaçaòö àoìöúe peçóìöòaòoá",
		RESET_ALL_FILTERS_LABEL = "Càpocèòö áce ñèìöòpÿ",
		RESET_FILTER_LABEL_TEMPLATE = "Càpocèòö ñèìöòp %s",

		CATEGORY_TITLE = "Êaòeâopèü",
		SUBCATEGORY_TITLE = "Ïoäêaòeâopèü",

		QUALITY_SELECTOR_TITLE = "Êaùecòáo:",

		TEXT_FILTER_TITLE = "Òeêcòoáÿé ñèìöòp:",
		TEXT_FILTER_TEXT = "Ñèìöòp ïo òeêcòó",

		WARNING_SUBFILTER_LIMIT = "Îeìöçü oòoàpaòö àoìee ùeí ïo 8 ñèìöòpaí",

		SEARCH_LIBRARY_TOGGLE_LABEL = "Àèàìèoòeêa ïoècêa",
		SEARCH_LIBRARY_HISTORY_LABEL = "Ècòopèü",
		SEARCH_LIBRARY_FAVORITES_LABEL = "Èçàpaîîoe",
		SEARCH_LIBRARY_FAVORITE_BUTTON_ADD_TOOLTIP = "Äoàaáèòö á èçàpaîîoe",
		SEARCH_LIBRARY_FAVORITE_BUTTON_REMOVE_TOOLTIP = "Óäaìèòö èç èçàpaîîoâo",
		SEARCH_LIBRARY_EDIT_LABEL_BUTTON_TOOLTIP = "Ïepeèíeîoáaòö",
		SEARCH_LIBRARY_DELETE_LABEL_BUTTON_TOOLTIP = "Óäaìèòö èç ècòopèè",
		SEARCH_LIBRARY_MENU_OPEN_SETTINGS = "Oòêpÿòö îacòpoéêè aääoîa",
		SEARCH_LIBRARY_MENU_CLEAR_HISTORY = "Oùècòèòö ècòopèô",
		SEARCH_LIBRARY_MENU_CLEAR_FAVORITES = "Oùècòèòö èçàpaîîoe",
		SEARCH_LIBRARY_MENU_UNDO_ACTION = "Oòíeîèòö ïocìeäîee äeécòáèe",
		SEARCH_LIBRARY_MENU_UNLOCK_WINDOW = "Paçàìoêèpoáaòö oêîo",
		SEARCH_LIBRARY_MENU_LOCK_WINDOW = "Çaàìoêèpoáaòö oêîo",
		SEARCH_LIBRARY_MENU_RESET_WINDOW = "Càpocèòö ïoìoæeîèe oêîa",
		SEARCH_LIBRARY_MENU_CLOSE_WINDOW = "Çaêpÿòö oêîo",

		TOOLTIP_LESS_THAN = "íeîöúe ",
		TOOLTIP_GREATER_THAN = "àoìöúe ",

		SETTINGS_REQUIRES_RELOADUI_WARNING = "Àóäeò ïpèíeîeîo òoìöêo ïocìe ïepeçaâpóçêè UI",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_LABEL = "Çaïoíèîaòö ñèìöòpÿ íeæäó áèçèòaíè á íaâaçèî",
		SETTINGS_KEEP_FILTERS_ON_CLOSE_DESCRIPTION = "Çaïoíèîaeò áÿàpaîîÿe áaíè ñèìöòpÿ è ïpè ïocìeäóôûeí áèçèòe á íaâaçèî ïocìeäîèe ècïoìöçoáaîîÿe ñèìöòpÿ óæe àóäóò áêìôùeîÿ",
		SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_LABEL = "Ècïoìöçoáaòö còapÿé còèìö áÿàopa êaùecòáa",
		SETTINGS_OLD_QUALITY_SELECTOR_BEHAVIOR_DESCRIPTION = "Ecìè áêìôùeîo, ìeáÿé è ïpaáÿé êìèê ïoáÿúaôò è ïoîèæaôò êaùecòáo, a äáoéîoé êìèê èìè êìèê c úèñòoí ïoçáoìüeò áÿàpaòö îecêoìöêo çîaùeîèé",
		SETTINGS_DISPLAY_PER_UNIT_PRICE_LABEL = "Ïoêaçÿáaòö œeîó ça oäèî ïpeäíeò",
		SETTINGS_DISPLAY_PER_UNIT_PRICE_DESCRIPTION = "Êoâäa áêìôùeîo, ïoêaçÿáaeò œeîó ça eäèîèœó òoáapa, áíecòo còoèíocòè còaêa",
		SETTINGS_SORT_WITHOUT_SEARCH_LABEL = "Íeîüòö ïopüäoê àeç ïoècêa",
		SETTINGS_SORT_WITHOUT_SEARCH_DESCRIPTION = "Ïoçáoìüeò íeîüòö ïopüäoê copòèpoáêè àeç îeoàxoäèíocòè çaïócêa îoáoâo ïoècêa. Òeêóûèe peçóìöòaòÿ ïoècêa èçíeîüòcü òoìöêo ïocìe póùîoâo ïoècêa.",
		SETTINGS_KEEP_SORTORDER_ON_CLOSE_LABEL = "Çaïoíèîaòö copòèpoáó",
		SETTINGS_KEEP_SORTORDER_ON_CLOSE_DESCRIPTION = "Çaïoíèîaeò ïopüäoê copòèpoáêè ïpeäíeòoá íeæäó áèçèòaíè á íaâaçî áíecòo eâo càpoca.",
		SETTINGS_LIST_WITH_SINGLE_CLICK_LABEL = "Áÿcòaáìüòö oäîèí êìèêoí",
		SETTINGS_LIST_WITH_SINGLE_CLICK_DESCRIPTION = "Áÿcòaáìüòö ïpeäíeò îa ïpoäaæó ïo oäîoíó êìèêó íÿúè.",
		SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_LABEL = "Ïoäcêaçêè á àèàìèoòeêe ïoècêa",
		SETTINGS_SHOW_SEARCH_LIBRARY_TOOLTIPS_DESCRIPTION = "Êoâäa áêìôùeîo, àóäeò áÿáoäèòcü äeòaìöîaü èîñopíaœèü äì êaæäoé çaïècè á àèàìèoòeêe ïoècêa.",
		SETTINGS_SHOW_TRADER_TOOLTIPS_LABEL = "Ïoäcêaçêa òopâoáœa",
		SETTINGS_SHOW_TRADER_TOOLTIPS_DESCRIPTION = "Ïoêaçÿáaeò îaîüòoâo áaúèíè âèìöäèüíè òopâoáœa, êoâäa îaáoäèòe îa îaçáaîèe âèìöäèè á cïècêe âèìöäèé",
		SETTINGS_AUTO_CLEAR_HISTORY_LABEL = "Aáòooùècòêa ècòopèè",
		SETTINGS_AUTO_CLEAR_HISTORY_DESCRIPTION = "Aáòoíaòèùecêè oùèûaeò ácô ècòopèô ïpè ïepáoí c îaùaìa èâpoáoé ceccèè áèçèòe ê òopâoáœó. Áÿíoæeòe oòíeîèòö óäaìeîèe á íeîô ècòopèè ïoècêa",

		INVALID_STATE = "Oúèàêa.\nËòo àaâ èâpÿ è oî äoìæeî àÿòö ïoïpaáìeî á àìèæaéúee ápeíü.",

		LOCAL_FILTER_EXPLANATION_TOOLTIP = "Ëòoò ñèìöòp ìoêaìöîÿé è paàoòaeò òoìöêo äìü oòoàpaæaeíoé còpaîèœÿ",
	},
}

local language = GetCVar("language.2")
local stringTable = ZO_ShallowTableCopy(localization["en"])

if(language ~= "en" and localization[language]) then
	ZO_ShallowTableCopy(localization[language], stringTable)
end
AwesomeGuildStore.Localization = stringTable
