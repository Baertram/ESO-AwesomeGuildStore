local CATEGORY_ID = {
    ALL = 1,
    WEAPONS = 2,
    ARMOR = 3,
    JEWELRY = 4,
    CONSUMABLE = 5,
    CRAFTING = 6,
    FURNISHING = 7,
    MISCELLANEOUS = 8,
}

local SUB_CATEGORY_ID = {
    ALL = 1,
    WEAPONS_ALL = 2,
    WEAPONS_ONE_HANDED = 3,
    WEAPONS_TWO_HANDED = 4,
    WEAPONS_BOW = 5,
    WEAPONS_DESTRUCTION_STAFF = 6,
    WEAPONS_RESTORATION_STAFF = 7,
    ARMOR_ALL = 8,
    ARMOR_HEAVY = 9,
    ARMOR_MEDIUM = 10,
    ARMOR_LIGHT = 11,
    ARMOR_SHIELD = 12,
    ARMOR_COSTUME = 13,
    JEWELRY_ALL = 14,
    JEWELRY_RING = 15,
    JEWELRY_NECK = 16,
    CONSUMABLE_ALL = 17,
    CONSUMABLE_FOOD = 18,
    CONSUMABLE_DRINK = 19,
    CONSUMABLE_RECIPE = 20,
    CONSUMABLE_POTION = 21,
    CONSUMABLE_POISON = 22,
    CONSUMABLE_WRIT = 23,
    CONSUMABLE_MOTIF = 24,
    CONSUMABLE_CONTAINER = 25,
    CONSUMABLE_TOOL = 26,
    CONSUMABLE_TROPHY = 27,
    CRAFTING_ALL = 28,
    CRAFTING_BLACKSMITHING = 29,
    CRAFTING_CLOTHIER = 30,
    CRAFTING_WOODWORKING = 31,
    CRAFTING_JEWELRY = 32,
    CRAFTING_ALCHEMY = 33,
    CRAFTING_ENCHANTING = 34,
    CRAFTING_PROVISIONING = 35,
    CRAFTING_STYLE_MATERIAL = 36,
    CRAFTING_TRAIT_MATERIAL = 37,
    CRAFTING_FURNISHING_MATERIAL = 38,
    FURNISHING_ALL = 39,
    FURNISHING_CRAFTING_STATION = 40,
    FURNISHING_LIGHT = 41,
    FURNISHING_ORNAMENTAL = 42,
    FURNISHING_SEATING = 43,
    FURNISHING_TARGET_DUMMY = 44,
    MISCELLANEOUS_ALL = 45,
    MISCELLANEOUS_GLYPHS = 46,
    MISCELLANEOUS_SOUL_GEM = 47,
    MISCELLANEOUS_SIEGE = 48,
    MISCELLANEOUS_FISHING = 49,
    MISCELLANEOUS_TOOL = 50,
    MISCELLANEOUS_TROPHY = 51,
}

local CATEGORY_MAPPING = {
    {
        category = CATEGORY_ID.ALL,
        subcategories = {
            SUB_CATEGORY_ID.ALL
        },
    },
    {
        category = CATEGORY_ID.WEAPONS,
        subcategories = {
            SUB_CATEGORY_ID.WEAPONS_ALL,
            SUB_CATEGORY_ID.WEAPONS_ONE_HANDED,
            SUB_CATEGORY_ID.WEAPONS_TWO_HANDED,
            SUB_CATEGORY_ID.WEAPONS_BOW,
            SUB_CATEGORY_ID.WEAPONS_DESTRUCTION_STAFF,
            SUB_CATEGORY_ID.WEAPONS_RESTORATION_STAFF,
        },
    },
    {
        category = CATEGORY_ID.ARMOR,
        subcategories = {
            SUB_CATEGORY_ID.ARMOR_ALL,
            SUB_CATEGORY_ID.ARMOR_HEAVY,
            SUB_CATEGORY_ID.ARMOR_MEDIUM,
            SUB_CATEGORY_ID.ARMOR_LIGHT,
            SUB_CATEGORY_ID.ARMOR_SHIELD,
            SUB_CATEGORY_ID.ARMOR_COSTUME,
        },
    },
    {
        category = CATEGORY_ID.JEWELRY,
        subcategories = {
            SUB_CATEGORY_ID.JEWELRY_ALL,
            SUB_CATEGORY_ID.JEWELRY_RING,
            SUB_CATEGORY_ID.JEWELRY_NECK,
        },
    },
    {
        category = CATEGORY_ID.CONSUMABLE,
        subcategories = {
            SUB_CATEGORY_ID.CONSUMABLE_ALL,
            SUB_CATEGORY_ID.CONSUMABLE_FOOD,
            SUB_CATEGORY_ID.CONSUMABLE_DRINK,
            SUB_CATEGORY_ID.CONSUMABLE_RECIPE,
            SUB_CATEGORY_ID.CONSUMABLE_POTION,
            SUB_CATEGORY_ID.CONSUMABLE_POISON,
            SUB_CATEGORY_ID.CONSUMABLE_WRIT,
            SUB_CATEGORY_ID.CONSUMABLE_MOTIF,
            SUB_CATEGORY_ID.CONSUMABLE_CONTAINER,
            SUB_CATEGORY_ID.CONSUMABLE_TOOL,
            SUB_CATEGORY_ID.CONSUMABLE_TROPHY,
        },
    },
    {
        category = CATEGORY_ID.CRAFTING,
        subcategories = {
            SUB_CATEGORY_ID.CRAFTING_ALL,
            SUB_CATEGORY_ID.CRAFTING_BLACKSMITHING,
            SUB_CATEGORY_ID.CRAFTING_CLOTHIER,
            SUB_CATEGORY_ID.CRAFTING_WOODWORKING,
            SUB_CATEGORY_ID.CRAFTING_JEWELRY,
            SUB_CATEGORY_ID.CRAFTING_ALCHEMY,
            SUB_CATEGORY_ID.CRAFTING_ENCHANTING,
            SUB_CATEGORY_ID.CRAFTING_PROVISIONING,
            SUB_CATEGORY_ID.CRAFTING_STYLE_MATERIAL,
            SUB_CATEGORY_ID.CRAFTING_TRAIT_MATERIAL,
            SUB_CATEGORY_ID.CRAFTING_FURNISHING_MATERIAL,
        },
    },
    {
        category = CATEGORY_ID.FURNISHING,
        subcategories = {
            SUB_CATEGORY_ID.FURNISHING_ALL,
            SUB_CATEGORY_ID.FURNISHING_CRAFTING_STATION,
            SUB_CATEGORY_ID.FURNISHING_LIGHT,
            SUB_CATEGORY_ID.FURNISHING_ORNAMENTAL,
            SUB_CATEGORY_ID.FURNISHING_SEATING,
            SUB_CATEGORY_ID.FURNISHING_TARGET_DUMMY,
        },
    },
    {
        category = CATEGORY_ID.MISCELLANEOUS,
        subcategories = {
            SUB_CATEGORY_ID.MISCELLANEOUS_ALL,
            SUB_CATEGORY_ID.MISCELLANEOUS_GLYPHS,
            SUB_CATEGORY_ID.MISCELLANEOUS_SOUL_GEM,
            SUB_CATEGORY_ID.MISCELLANEOUS_SIEGE,
            SUB_CATEGORY_ID.MISCELLANEOUS_FISHING,
            SUB_CATEGORY_ID.MISCELLANEOUS_TOOL,
            SUB_CATEGORY_ID.MISCELLANEOUS_TROPHY,
        },
    },
}

local CATEGORY_DEFINITION = {
    [CATEGORY_ID.ALL] = {
        id = CATEGORY_ID.ALL,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_all_%s.dds",
        isDefault = true,
    },
    [CATEGORY_ID.WEAPONS] = {
        id = CATEGORY_ID.WEAPONS,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_WEAPONS),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_weapons_%s.dds",
    },
    [CATEGORY_ID.ARMOR] = {
        id = CATEGORY_ID.ARMOR,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ARMOR),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_armor_%s.dds",
    },
    [CATEGORY_ID.JEWELRY] = {
        id = CATEGORY_ID.JEWELRY,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_JEWELRY),
        icon = "AwesomeGuildStore/images/jewelry_%s.dds",
    },
    [CATEGORY_ID.CONSUMABLE] = {
        id = CATEGORY_ID.CONSUMABLE,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_CONSUMABLE),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_consumables_%s.dds",
    },
    [CATEGORY_ID.CRAFTING] = {
        id = CATEGORY_ID.CRAFTING,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_CRAFTING),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_crafting_%s.dds",
    },
    [CATEGORY_ID.FURNISHING] = {
        id = CATEGORY_ID.FURNISHING,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_FURNISHING),
        icon = "EsoUI/Art/treeIcons/collection_indexicon_furnishings_%s.dds",
    },
    [CATEGORY_ID.MISCELLANEOUS] = {
        id = CATEGORY_ID.MISCELLANEOUS,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_MISCELLANEOUS),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_misc_%s.dds",
    }
}

local SUB_CATEGORY_DEFINITION = {
    [SUB_CATEGORY_ID.ALL] =  {
        id = SUB_CATEGORY_ID.ALL,
        category = CATEGORY_ID.ALL,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_all_%s.dds",
        isDefault = true,
    },
    [SUB_CATEGORY_ID.WEAPONS_ALL] = {
        id = SUB_CATEGORY_ID.WEAPONS_ALL,
        category = CATEGORY_ID.WEAPONS,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_all_%s.dds",
        isDefault = true,
    },
    [SUB_CATEGORY_ID.WEAPONS_ONE_HANDED] = {
        id = SUB_CATEGORY_ID.WEAPONS_ONE_HANDED,
        category = CATEGORY_ID.WEAPONS,
        label = GetString("SI_EQUIPTYPE", EQUIP_TYPE_ONE_HAND),
        icon = "AwesomeGuildStore/images/weapon/onehand_%s.dds",
    },
    [SUB_CATEGORY_ID.WEAPONS_TWO_HANDED] = {
        id = SUB_CATEGORY_ID.WEAPONS_TWO_HANDED,
        category = CATEGORY_ID.WEAPONS,
        label = GetString("SI_EQUIPTYPE", EQUIP_TYPE_TWO_HAND),
        icon = "AwesomeGuildStore/images/weapon/twohand_%s.dds",
    },
    [SUB_CATEGORY_ID.WEAPONS_BOW] = {
        id = SUB_CATEGORY_ID.WEAPONS_BOW,
        category = CATEGORY_ID.WEAPONS,
        label = GetString("SI_WEAPONTYPE", WEAPONTYPE_BOW),
        icon = "AwesomeGuildStore/images/weapon/bow_%s.dds",
    },
    [SUB_CATEGORY_ID.WEAPONS_DESTRUCTION_STAFF] = {
        id = SUB_CATEGORY_ID.WEAPONS_DESTRUCTION_STAFF,
        category = CATEGORY_ID.WEAPONS,
        label = zo_strformat(SI_SKILLS_TREE_NAME_FORMAT, GetSkillLineInfo(SKILL_TYPE_WEAPON, 5)),
        icon = "AwesomeGuildStore/images/weapon/fire_%s.dds",
    },
    [SUB_CATEGORY_ID.WEAPONS_RESTORATION_STAFF] = {
        id = SUB_CATEGORY_ID.WEAPONS_RESTORATION_STAFF,
        category = CATEGORY_ID.WEAPONS,
        label = zo_strformat(SI_SKILLS_TREE_NAME_FORMAT, GetSkillLineInfo(SKILL_TYPE_WEAPON, 6)),
        icon = "AwesomeGuildStore/images/weapon/restoration_%s.dds",
    },
    [SUB_CATEGORY_ID.ARMOR_ALL] = {
        id = SUB_CATEGORY_ID.ARMOR_ALL,
        category = CATEGORY_ID.ARMOR,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_all_%s.dds",
        isDefault = true,
    },
    [SUB_CATEGORY_ID.ARMOR_HEAVY] = {
        id = SUB_CATEGORY_ID.ARMOR_HEAVY,
        category = CATEGORY_ID.ARMOR,
        label = GetString("SI_ARMORTYPE_TRADINGHOUSECATEGORY", ARMORTYPE_HEAVY),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_armor_%s.dds",
    },
    [SUB_CATEGORY_ID.ARMOR_MEDIUM] = {
        id = SUB_CATEGORY_ID.ARMOR_MEDIUM,
        category = CATEGORY_ID.ARMOR,
        label = GetString("SI_ARMORTYPE_TRADINGHOUSECATEGORY", ARMORTYPE_MEDIUM),
        icon = "AwesomeGuildStore/images/armor/medium_%s.dds",
    },
    [SUB_CATEGORY_ID.ARMOR_LIGHT] = {
        id = SUB_CATEGORY_ID.ARMOR_LIGHT,
        category = CATEGORY_ID.ARMOR,
        label = GetString("SI_ARMORTYPE_TRADINGHOUSECATEGORY", ARMORTYPE_LIGHT),
        icon = "AwesomeGuildStore/images/armor/light_%s.dds",
    },
    [SUB_CATEGORY_ID.ARMOR_SHIELD] = {
        id = SUB_CATEGORY_ID.ARMOR_SHIELD,
        category = CATEGORY_ID.ARMOR,
        label = GetString(SI_TRADING_HOUSE_BROWSE_ARMOR_TYPE_SHIELD),
        icon = "AwesomeGuildStore/images/armor/shield_%s.dds",
    },
    [SUB_CATEGORY_ID.ARMOR_COSTUME] = {
        id = SUB_CATEGORY_ID.ARMOR_COSTUME,
        category = CATEGORY_ID.ARMOR,
        label = GetString("SI_EQUIPTYPE", EQUIP_TYPE_COSTUME),
        icon = "AwesomeGuildStore/images/armor/costume_%s.dds",
    },
    [SUB_CATEGORY_ID.JEWELRY_ALL] = {
        id = SUB_CATEGORY_ID.JEWELRY_ALL,
        category = CATEGORY_ID.JEWELRY,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_all_%s.dds",
        isDefault = true,
    },
    [SUB_CATEGORY_ID.JEWELRY_RING] = {
        id = SUB_CATEGORY_ID.JEWELRY_RING,
        category = CATEGORY_ID.JEWELRY,
        label = GetString("SI_EQUIPTYPE", EQUIP_TYPE_RING),
        icon = "AwesomeGuildStore/images/armor/ring_%s.dds",
    },
    [SUB_CATEGORY_ID.JEWELRY_NECK] = {
        id = SUB_CATEGORY_ID.JEWELRY_NECK,
        category = CATEGORY_ID.JEWELRY,
        label = GetString("SI_EQUIPTYPE", EQUIP_TYPE_NECK),
        icon = "AwesomeGuildStore/images/armor/neck_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_ALL] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_ALL,
        category = CATEGORY_ID.CONSUMABLE,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_all_%s.dds",
        isDefault = true,
    },
    [SUB_CATEGORY_ID.CONSUMABLE_FOOD] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_FOOD,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_FOOD)),
        icon = "EsoUI/Art/Crafting/provisioner_indexIcon_meat_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_DRINK] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_DRINK,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_DRINK)),
        icon = "EsoUI/Art/Crafting/provisioner_indexIcon_beer_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_RECIPE] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_RECIPE,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_RECIPE)),
        icon = "EsoUI/Art/Guild/tabIcon_roster_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_POTION] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_POTION,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_POTION)),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_consumables_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_POISON] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_POISON,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_POISON)),
        icon = "EsoUI/Art/Crafting/alchemy_tabIcon_solvent_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_WRIT] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_WRIT,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_MASTER_WRIT)),
        icon = "EsoUI/Art/crafting/formulae_tabicon_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_MOTIF] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_MOTIF,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_RACIAL_STYLE_MOTIF)),
        icon = "EsoUI/Art/MainMenu/menuBar_journal_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_CONTAINER] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_CONTAINER,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_CONTAINER)),
        icon = "EsoUI/Art/MainMenu/menuBar_inventory_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_TOOL] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_TOOL,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_AVA_REPAIR)),
        icon = "EsoUI/Art/Vendor/vendor_tabIcon_repair_%s.dds",
    },
    [SUB_CATEGORY_ID.CONSUMABLE_TROPHY] = {
        id = SUB_CATEGORY_ID.CONSUMABLE_TROPHY,
        category = CATEGORY_ID.CONSUMABLE,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_TROPHY)),
        icon = "EsoUI/Art/Journal/journal_tabIcon_leaderboard_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_ALL] = {
        id = SUB_CATEGORY_ID.CRAFTING_ALL,
        category = CATEGORY_ID.CRAFTING,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_all_%s.dds",
        isDefault = true,
    },
    [SUB_CATEGORY_ID.CRAFTING_BLACKSMITHING] = {
        id = SUB_CATEGORY_ID.CRAFTING_BLACKSMITHING,
        category = CATEGORY_ID.CRAFTING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, ZO_GetCraftingSkillName(CRAFTING_TYPE_BLACKSMITHING)),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftbag_blacksmithing_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_CLOTHIER] = {
        id = SUB_CATEGORY_ID.CRAFTING_CLOTHIER,
        category = CATEGORY_ID.CRAFTING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, ZO_GetCraftingSkillName(CRAFTING_TYPE_CLOTHIER)),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftbag_clothing_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_WOODWORKING] = {
        id = SUB_CATEGORY_ID.CRAFTING_WOODWORKING,
        category = CATEGORY_ID.CRAFTING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, ZO_GetCraftingSkillName(CRAFTING_TYPE_WOODWORKING)),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftbag_woodworking_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_JEWELRY] = {
        id = SUB_CATEGORY_ID.CRAFTING_JEWELRY,
        category = CATEGORY_ID.CRAFTING,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_JEWELRY),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftBag_jewelryCrafting_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_ALCHEMY] = {
        id = SUB_CATEGORY_ID.CRAFTING_ALCHEMY,
        category = CATEGORY_ID.CRAFTING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, ZO_GetCraftingSkillName(CRAFTING_TYPE_ALCHEMY)),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftbag_alchemy_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_ENCHANTING] = {
        id = SUB_CATEGORY_ID.CRAFTING_ENCHANTING,
        category = CATEGORY_ID.CRAFTING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, ZO_GetCraftingSkillName(CRAFTING_TYPE_ENCHANTING)),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftbag_enchanting_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_PROVISIONING] = {
        id = SUB_CATEGORY_ID.CRAFTING_PROVISIONING,
        category = CATEGORY_ID.CRAFTING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, ZO_GetCraftingSkillName(CRAFTING_TYPE_PROVISIONING)),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftbag_provisioning_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_STYLE_MATERIAL] = {
        id = SUB_CATEGORY_ID.CRAFTING_STYLE_MATERIAL,
        category = CATEGORY_ID.CRAFTING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_STYLE_MATERIAL)),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftbag_stylematerial_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_TRAIT_MATERIAL] = {
        id = SUB_CATEGORY_ID.CRAFTING_TRAIT_MATERIAL,
        category = CATEGORY_ID.CRAFTING,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_TRAIT_ITEMS),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftBag_itemTrait_%s.dds",
    },
    [SUB_CATEGORY_ID.CRAFTING_FURNISHING_MATERIAL] = {
        id = SUB_CATEGORY_ID.CRAFTING_FURNISHING_MATERIAL,
        category = CATEGORY_ID.CRAFTING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_SPECIALIZEDITEMTYPE", SPECIALIZED_ITEMTYPE_FURNISHING_ORNAMENTAL)),
        icon = "EsoUI/Art/treeIcons/collection_indexicon_furnishings_%s.dds",
    },
    [SUB_CATEGORY_ID.FURNISHING_ALL] = {
        id = SUB_CATEGORY_ID.FURNISHING_ALL,
        category = CATEGORY_ID.FURNISHING,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_all_%s.dds",
        isDefault = true,
    },
    [SUB_CATEGORY_ID.FURNISHING_CRAFTING_STATION] = {
        id = SUB_CATEGORY_ID.FURNISHING_CRAFTING_STATION,
        category = CATEGORY_ID.FURNISHING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_SPECIALIZEDITEMTYPE", SPECIALIZED_ITEMTYPE_FURNISHING_CRAFTING_STATION)),
        icon = "EsoUI/Art/treeIcons/housing_indexicon_workshop_%s.dds",
    },
    [SUB_CATEGORY_ID.FURNISHING_LIGHT] = {
        id = SUB_CATEGORY_ID.FURNISHING_LIGHT,
        category = CATEGORY_ID.FURNISHING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_SPECIALIZEDITEMTYPE", SPECIALIZED_ITEMTYPE_FURNISHING_LIGHT)),
        icon = "EsoUI/Art/treeIcons/housing_indexicon_shrine_%s.dds",
    },
    [SUB_CATEGORY_ID.FURNISHING_ORNAMENTAL] = {
        id = SUB_CATEGORY_ID.FURNISHING_ORNAMENTAL,
        category = CATEGORY_ID.FURNISHING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_SPECIALIZEDITEMTYPE", SPECIALIZED_ITEMTYPE_FURNISHING_ORNAMENTAL)),
        icon = "EsoUI/Art/treeIcons/housing_indexicon_gallery_%s.dds",
    },
    [SUB_CATEGORY_ID.FURNISHING_SEATING] = {
        id = SUB_CATEGORY_ID.FURNISHING_SEATING,
        category = CATEGORY_ID.FURNISHING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_SPECIALIZEDITEMTYPE", SPECIALIZED_ITEMTYPE_FURNISHING_SEATING)),
        icon = "EsoUI/Art/treeIcons/collection_indexicon_furnishings_%s.dds",
    },
    [SUB_CATEGORY_ID.FURNISHING_TARGET_DUMMY] = {
        id = SUB_CATEGORY_ID.FURNISHING_TARGET_DUMMY,
        category = CATEGORY_ID.FURNISHING,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_SPECIALIZEDITEMTYPE", SPECIALIZED_ITEMTYPE_FURNISHING_TARGET_DUMMY)),
        icon = "EsoUI/Art/treeIcons/collection_indexicon_weapons+armor_%s.dds",
    },
    [SUB_CATEGORY_ID.MISCELLANEOUS_ALL] = {
        id = SUB_CATEGORY_ID.MISCELLANEOUS_ALL,
        category = CATEGORY_ID.MISCELLANEOUS,
        label = GetString("SI_ITEMFILTERTYPE", ITEMFILTERTYPE_ALL),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_all_%s.dds",
        isDefault = true,
    },
    [SUB_CATEGORY_ID.MISCELLANEOUS_GLYPHS] = {
        id = SUB_CATEGORY_ID.MISCELLANEOUS_GLYPHS,
        category = CATEGORY_ID.MISCELLANEOUS,
        label = GetString(SI_GAMEPADITEMCATEGORY13),
        icon = "AwesomeGuildStore/images/misc/glyphs_%s.dds",
    },
    [SUB_CATEGORY_ID.MISCELLANEOUS_SOUL_GEM] = {
        id = SUB_CATEGORY_ID.MISCELLANEOUS_SOUL_GEM,
        category = CATEGORY_ID.MISCELLANEOUS,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_SOUL_GEM)),
        icon = "AwesomeGuildStore/images/misc/soulgem_%s.dds",
    },
    [SUB_CATEGORY_ID.MISCELLANEOUS_SIEGE] = {
        id = SUB_CATEGORY_ID.MISCELLANEOUS_SIEGE,
        category = CATEGORY_ID.MISCELLANEOUS,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_SIEGE)),
        icon = "EsoUI/Art/MainMenu/menuBar_ava_%s.dds",
    },
    [SUB_CATEGORY_ID.MISCELLANEOUS_FISHING] = {
        id = SUB_CATEGORY_ID.MISCELLANEOUS_FISHING,
        category = CATEGORY_ID.MISCELLANEOUS,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_LURE)),
        icon = "EsoUI/Art/Inventory/inventory_tabIcon_craftbag_fishing_%s.dds",
    },
    [SUB_CATEGORY_ID.MISCELLANEOUS_TOOL] = {
        id = SUB_CATEGORY_ID.MISCELLANEOUS_TOOL,
        category = CATEGORY_ID.MISCELLANEOUS,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_TOOL)),
        icon = "EsoUI/Art/Vendor/vendor_tabIcon_repair_%s.dds",
    },
    [SUB_CATEGORY_ID.MISCELLANEOUS_TROPHY] = {
        id = SUB_CATEGORY_ID.MISCELLANEOUS_TROPHY,
        category = CATEGORY_ID.MISCELLANEOUS,
        label = zo_strformat(SI_TOOLTIP_ITEM_NAME, GetString("SI_ITEMTYPE", ITEMTYPE_TROPHY)),
        icon = "EsoUI/Art/Journal/journal_tabIcon_leaderboard_%s.dds",
    },
}

local DEFAULT_CATEGORY_ID = CATEGORY_ID.ALL
local DEFAULT_SUB_CATEGORY_ID = {
    [CATEGORY_ID.ALL] = SUB_CATEGORY_ID.ALL,
    [CATEGORY_ID.WEAPONS] = SUB_CATEGORY_ID.WEAPONS_ALL,
    [CATEGORY_ID.ARMOR] = SUB_CATEGORY_ID.ARMOR_ALL,
    [CATEGORY_ID.JEWELRY] = SUB_CATEGORY_ID.JEWELRY_ALL,
    [CATEGORY_ID.CONSUMABLE] = SUB_CATEGORY_ID.CONSUMABLE_ALL,
    [CATEGORY_ID.CRAFTING] = SUB_CATEGORY_ID.CRAFTING_ALL,
    [CATEGORY_ID.FURNISHING] = SUB_CATEGORY_ID.FURNISHING_ALL,
    [CATEGORY_ID.MISCELLANEOUS] = SUB_CATEGORY_ID.MISCELLANEOUS_ALL
}

local AGS = AwesomeGuildStore
AGS.data.CATEGORY_ID = CATEGORY_ID
AGS.data.SUB_CATEGORY_ID = SUB_CATEGORY_ID
AGS.data.CATEGORY_MAPPING = CATEGORY_MAPPING
AGS.data.CATEGORY_DEFINITION = CATEGORY_DEFINITION
AGS.data.SUB_CATEGORY_DEFINITION = SUB_CATEGORY_DEFINITION
AGS.data.DEFAULT_CATEGORY_ID = DEFAULT_CATEGORY_ID
AGS.data.DEFAULT_SUB_CATEGORY_ID = DEFAULT_SUB_CATEGORY_ID