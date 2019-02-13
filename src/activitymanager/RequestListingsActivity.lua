local AGS = AwesomeGuildStore

local ActivityBase = AGS.class.ActivityBase

local logger = AGS.internal.logger
local gettext = AGS.internal.gettext

local Promise = LibStub("LibPromises")
local sformat = string.format


local RequestListingsActivity = ActivityBase:Subclass()
AGS.class.RequestListingsActivity = RequestListingsActivity

function RequestListingsActivity:New(...)
    return ActivityBase.New(self, ...)
end

function RequestListingsActivity:Initialize(tradingHouseWrapper, guildId)
    local key = RequestListingsActivity.CreateKey(guildId)
    ActivityBase.Initialize(self, tradingHouseWrapper, key, ActivityBase.PRIORITY_MEDIUM, guildId)
end

function RequestListingsActivity:Update()
    self.canExecute = self.guildSelection:IsAppliedGuildId(self.guildId) or (GetTradingHouseCooldownRemaining() == 0)
end

function RequestListingsActivity:RequestListings()
    if(not self.responsePromise) then
        self.responsePromise = Promise:New()
        if(not HasTradingHouseListings()) then
            RequestTradingHouseListings()
        else
            self.state = ActivityBase.STATE_SUCCEEDED
            self.result = TRADING_HOUSE_RESULT_SUCCESS
            self.responsePromise:Resolve(self)
        end
    end
    return self.responsePromise
end

function RequestListingsActivity:DoExecute(panel)
    return self:ApplyGuildId(panel):Then(self.RequestListings)
end

function RequestListingsActivity:GetLogEntry()
    if(not self.logEntry) then
        -- TRANSLATORS: log text shown to the user for each listings request. Placeholder is for the guild name
        self.logEntry = zo_strformat(gettext("Request listings in <<1>>"), GetGuildName(self.guildId))
    end
    return self.logEntry
end

function RequestListingsActivity:GetType()
    return ActivityBase.ACTIVITY_TYPE_REQUEST_LISTINGS
end

function RequestListingsActivity.CreateKey(guildId)
    return sformat("%d_%d", ActivityBase.ACTIVITY_TYPE_REQUEST_LISTINGS, guildId)
end
