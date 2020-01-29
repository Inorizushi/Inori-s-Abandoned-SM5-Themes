local function LoadMetric(name, isBoolean)
    local metricValue = THEME:GetMetric("DifficultyList", name)
    assert(metricValue, "DifficultyList: can't load metric "..name)
    --only numbers and booleans are supported right now
    if isBoolean then
        return (metricValue == "true") or (metricValue=="1")
    else
        local n = tonumber(metricValue)
        assert(n, "DifficultyList: metric "..name.." must be a number but is not")
        return n
    end
end

local function DiffToColor(diff)
    local color = CustomDifficultyToColor(ToEnumShortString(diff))
    return color
end

--we need this function because we need to get the current Steps for non-human players.
--however, non-human players don't actually have a current Steps.
local function GetCurrentSteps(pn)
	return GAMESTATE:GetCurrentSteps(pn)
end

local difficultiesToDraw = {
    'Difficulty_Beginner',
    'Difficulty_Easy',
    'Difficulty_Medium',
    'Difficulty_Hard',
    'Difficulty_Challenge'
}

local invDifficultiesToDraw = {}
for k, v in pairs(difficultiesToDraw) do
    invDifficultiesToDraw[v] = k
end

local startPos = LoadMetric "StartPositionY"
local itemSpacingY = LoadMetric "ItemSpacingY"
local labelPos = LoadMetric "LabelPositionX"
local tickPos = LoadMetric "TickPositionX"

local lastSong = nil
local lastSteps = {PlayerNumber_P1=nil, PlayerNumber_P2=nil}

local function DiffToYPos(diff)
    if invDifficultiesToDraw[diff] == nil then return nil end
    return startPos + ( itemSpacingY*( invDifficultiesToDraw[diff]-1 ) )
end

local function SetXFromPlayerNumber(that, pn)
    if pn == 'PlayerNumber_P1' then
        that:x(-95)
    elseif pn == 'PlayerNumber_P2' then
        that:x(55)
    end
end

local function Update(self, _)
    if GAMESTATE then
        local song = GAMESTATE:GetCurrentSong()
        local steps = {}
        local anyStepsChanged = false
        for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
            steps[pn] = GetCurrentSteps(pn)
            if steps[pn] ~= lastSteps[pn] then anyStepsChanged = true break end
        end
        local songChanged = song~=lastSong
        if songChanged or anyStepsChanged then
            MESSAGEMAN:Broadcast("SNDLUpdate", {SongChanged=songChanged, StepsChanged=anyStepsChanged})
        end
        lastSong = song
        lastSteps = steps
    end
end

local ret = Def.ActorFrame{InitCommand=function(self) self:xy(SCREEN_CENTER_X+230,SCREEN_CENTER_Y+50):SetUpdateFunction(Update) end,
    OffCommand=function(self) self:sleep(0.5):visible(false) end}

local function IndicatorUpdate(self, pn)
    if not GAMESTATE:IsPlayerEnabled(pn) then return end
    self:finishtweening()
    local currentlyVisible = self:GetVisible()
    local steps = GetCurrentSteps(pn)
    if steps and GAMESTATE:GetCurrentSong() then
        if currentlyVisible then
            self:linear(0.1)
        end
        local yPos = DiffToYPos(steps:GetDifficulty())
        if yPos then
            self:visible(true)
            self:y(yPos)
            return
        end
    end
end

local function AddContentsToOutput(tbl)
    for _, e in pairs(tbl) do
        table.insert(ret, e)
    end
end

do
    local indicatorLabels = {}
    for _, pn in pairs(PlayerNumber) do
        table.insert(indicatorLabels, LoadActor(THEME:GetPathG("","ScreenSelect curspr"))..{
            InitCommand=function(self) SetXFromPlayerNumber(self:visible(false), pn) self:shadowlength(3):zoomy(1.2):rotationy(pn=='PlayerNumber_P2' and 180 or 0) end,
						OnCommand=function(self) self:bounce():effectmagnitude(pn=='PlayerNumber_P2' and 8 or -8,0,0):effectperiod(0.8):effectoffset(0.2) end,
            SNDLUpdateMessageCommand=function(self) return IndicatorUpdate(self, pn) end,
            PlayerJoinedMessageCommand=function(self,p)
                if p.Player==pn then self:Load(THEME:GetPathG("","ScreenSelect curspr")) end
            end
        })
    end
    AddContentsToOutput(indicatorLabels)
end


for idx, diff in pairs(difficultiesToDraw) do
    local element = Def.ActorFrame{
        Name = "Row"..diff,
        SNDLUpdateMessageCommand = function(self) for _, item in pairs(self:GetChildren()) do item:playcommand("Update") end end,
        InitCommand = function(self) self:y( DiffToYPos(diff) ) end,
        LoadFont("_FFT reg.ini")..{
            Name = "Label",
            Text=THEME:GetString("CustomDifficulty",ToEnumShortString(diff));
            InitCommand = function(self) self:x(labelPos):diffuse{0.5,0.5,0.5,1}:halign(1):zoomy(0.75) end,
            SNDLUpdateMessageCommand=function(self)
                local song = GAMESTATE:GetCurrentSong()
                if song then
                    if song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
                        self:diffuse(DiffToColor(diff))
                    else
                        self:diffuse{1,1,1,1}
                    end
                else
                    self:diffuse(DiffToColor(diff))
                end
            end
        },
        Def.RollingNumbers{
          Font="_FFT reg.ini";
          InitCommand=function(self) self:Load("RollingNumbersMeter"):x(tickPos):halign(0):zoomy(0.75) end,
          SNDLUpdateMessageCommand=function(self)
            local song = GAMESTATE:GetCurrentSong()
            if song then
              local steps = song:GetOneSteps(GAMESTATE:GetCurrentStyle():GetStepsType(), diff)
              if steps then
                local meter = steps:GetMeter()
                if song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
                  self:diffuse(DiffToColor(diff))
                  self:settext(meter)
                end;
              else
                self:settext("")
              end
            else
              self:diffuse(DiffToColor(diff))
              self:settext("?")
            end;
          end;
        }
    }
    table.insert(ret, element)
end

return ret
