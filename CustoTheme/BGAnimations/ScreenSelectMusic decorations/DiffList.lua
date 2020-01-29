local function LoadMetric(name, isBoolean)
    local metricValue = THEME:GetMetric("CustoDifficultyList", name)
    assert(metricValue, "CustoDifficultyList: can't load metric "..name)
    --only numbers and booleans are supported right now
    if isBoolean then
        return (metricValue == "true") or (metricValue=="1")
    else
        local n = tonumber(metricValue)
        assert(n, "CustoDifficultyList: metric "..name.." must be a number but is not")
        return n
    end
end

local hardColor = color "#FF0000"

local function DiffToColor(diff, dark)
    local color = CustomDifficultyToColor(ToEnumShortString(diff))
    if dark then
        return ColorDarkTone(color)
    else
        return color
    end
end

--we need this function because we need to get the current Steps for non-human players.
--however, non-human players don't actually have a current Steps.
local function GetCurrentSteps(pn)
	if not GAMESTATE:IsHumanPlayer(pn) then
		return GAMESTATE:GetCurrentSteps(GAMESTATE:GetMasterPlayerNumber())
	end
	return GAMESTATE:GetCurrentSteps(pn)
end

local function AnyPlayerThisDiff(diff)
    for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
        local curSteps = GetCurrentSteps(pn)
        if curSteps and curSteps:GetDifficulty()==diff then
            return true
        end
    end
    return false
end

local function PlayerLabelName(pn)
	local name = GAMESTATE:IsHumanPlayer(pn) and string.lower(ToEnumShortString(pn)) or "cpu"
	return '../../Graphics/_shared/Badges/Diff/base (doubleres)'
end

local difficultiesToDraw = {
    'Difficulty_Beginner',
    'Difficulty_Easy',
    'Difficulty_Medium',
    'Difficulty_Hard',
    'Difficulty_Challenge',
}

local invDifficultiesToDraw = {}
for k, v in pairs(difficultiesToDraw) do
    invDifficultiesToDraw[v] = k
end

local itemSpacingX = LoadMetric "ItemSpacingX"
local labelPos = LoadMetric "LabelPositionX"
local tickPos = LoadMetric "TickPositionX"
local glowFeet = LoadMetric("GlowIfMeterAbove10", true)
local indWidth = LoadMetric "IndicatorWidth"
local indX = LoadMetric "IndicatorX"
local plabelX = LoadMetric "PlayerLabelXOffset"

local lastSong = nil
local lastSteps = {PlayerNumber_P1=nil, PlayerNumber_P2=nil}

local function DiffToXPos(diff)
    if invDifficultiesToDraw[diff] == nil then return nil end
    return ( -itemSpacingX*( invDifficultiesToDraw[diff]-1 ) )
end

local function SetXFromPlayerNumber(that, pn)
    if pn == 'PlayerNumber_P1' then
        that:x(indX-(indWidth/2)-plabelX)
    elseif pn == 'PlayerNumber_P2' then
        that:x(indX+(indWidth/2)+plabelX)
    end
end

local ret = Def.ActorFrame{InitCommand=function(self) self:xy(SCREEN_CENTER_X+138,SCREEN_CENTER_Y-45):rotationz(-4) end,
    OffCommand=function(self) self:visible(false) end}

local function AddMessageReceivers(that, handler)
    local baseXMode = ThemePrefs.Get "XDifficultyList" == "X Style"
    local lastXMode = baseXMode
    local function check()
        local song = GAMESTATE:GetCurrentSong()
        if song then
            local mt = SongAttributes.GetMeterType(song)
            if mt ~= '_MeterType_Default' then
                local songXMode = mt ~= '_MeterType_DDR'
                lastXMode = songXMode
                return songXMode
            end
        end
        lastXMode = baseXMode
        return baseXMode
    end

    that.CurrentSongChangedMessageCommand = function(self, _) handler(self, true, check()) end
    for _, pn in pairs(PlayerNumber) do
        pn = ToEnumShortString(pn)
        that["CurrentSteps"..pn.."ChangedMessageCommand"] = function(self, _) handler(self, false, lastXMode) end
    end
end

local function IndicatorUpdate(self, pn)
    if not GAMESTATE:IsPlayerEnabled(pn) then return end
    self:finishtweening()
    local currentlyVisible = self:GetVisible()
    local steps = GetCurrentSteps(pn)
    if steps and GAMESTATE:GetCurrentSong() then
        if currentlyVisible then
            self:sleep(0)
        end
        local xPos = DiffToXPos(steps:GetDifficulty())
        if xPos then
            self:visible(true)
            self:x(xPos)
            return
        end
    end
    self:visible(false)
end

local function AddContentsToOutput(tbl)
    for _, e in pairs(tbl) do
        table.insert(ret, e)
    end
end

do
    local indicatorBackgrounds = {}
    local indicatorLabels = {}
    for _, pn in pairs(PlayerNumber) do
        --the initcommand here just prepares the things that are the same in both modes
        local indicatorLabel = Def.Sprite{
            Name='PlayerLabel',
            Texture=PlayerLabelName(pn),
            InitCommand=function(self) self:visible(false):diffuse(PlayerColor(pn)) end,
            PlayerJoinedMessageCommand=function(self,p)
                if p.Player==pn then self:Load(ResolveRelativePath(PlayerLabelName(pn),1)) end
            end
        }
        AddMessageReceivers(indicatorLabel, function(self, _, XMode) SetXFromPlayerNumber(self, pn, XMode)
            return IndicatorUpdate(self, pn) end)
        table.insert(indicatorLabels, indicatorLabel)
        table.insert(indicatorBackgrounds, indicatorBackground)
    end
    AddContentsToOutput(indicatorBackgrounds)
    AddContentsToOutput(indicatorLabels)
end

--here's where it gets hairy
for idx, diff in pairs(difficultiesToDraw) do

    --[[DIFFICULTY LABEL]]
    --[[METER NUMBER]]
    local meter = Def.BitmapText{
        Font="_pirates of cydonia 48px";
        InitCommand=function(self) self:diffuse{0.5,0.5,0.5,1}:halign(0.5):zoom(0.7) end
    }
    AddMessageReceivers(meter, function(self, _, XMode)
        self:visible(true)
        local song = GAMESTATE:GetCurrentSong()
        if song then
            local steps = song:GetOneSteps(GAMESTATE:GetCurrentStyle():GetStepsType(), diff)
            if steps then
                local meter = steps:GetMeter()
                if AnyPlayerThisDiff(diff) then
                    self:diffuse(DiffToColor(diff))
                    self:settext(tostring(meter))
                elseif song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
                    self:diffuse(DiffToColor(diff))
                    self:settext(tostring(meter))
                end
            else
                self:settext ""
            end
        else
            self:settext ""
        end
    end)


    local element = Def.ActorFrame{
        Name = "Row"..diff,
        InitCommand = function(self) self:x( DiffToXPos(diff) ) end,
        label, ticksUnder, ticksOver, meter
    }
    table.insert(ret, element)
end

return ret
