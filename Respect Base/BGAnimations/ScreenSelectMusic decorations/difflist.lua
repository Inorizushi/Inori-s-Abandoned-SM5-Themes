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
        if GetCurrentSteps(pn):GetDifficulty()==diff then return true end
    end
    return false
end

local function BothPlayersThisDiff(diff,self)
	if GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()==diff and GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty()==diff then return true end
	return false
end

local difficultiesToDraw = {
    'Difficulty_Easy',
    'Difficulty_Medium',
    'Difficulty_Hard',
    'Difficulty_Challenge'
}

local invDifficultiesToDraw = {}
for k, v in pairs(difficultiesToDraw) do
    invDifficultiesToDraw[v] = k
end

local itemSpacingX = "160"
local labelPos = "0"

local lastSong = nil
local lastSteps = {PlayerNumber_P1=nil, PlayerNumber_P2=nil}

local function DiffToXPos(diff)
	if invDifficultiesToDraw[diff] == nil then return nil end
	return ( itemSpacingX*( invDifficultiesToDraw[diff]-1) )
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

local ret = Def.ActorFrame{InitCommand=function(self) self:draworder(10):xy(SCREEN_CENTER_X+218,SCREEN_CENTER_Y-118):queuecommand("On"):SetUpdateFunction(Update) end,
    OffCommand=function(self) self:sleep(1):decelerate(1):addx(SCREEN_WIDTH) end}


local function AddContentsToOutput(tbl)
    for _, e in pairs(tbl) do
        table.insert(ret, e)
    end
end

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
for idx, diff in pairs(difficultiesToDraw) do
	local element = Def.ActorFrame{
		OnCommand=cmd(diffusealpha,0;sleep,0.3;diffusealpha,1);
		Name = "Row"..diff,
		SNDLUpdateMessageCommand = function(self) for _, item in pairs(self:GetChildren()) do item:playcommand("Update") end end,
		InitCommand=function(self) self:x(DiffToXPos(diff) ) end,
		Def.Sprite{
			Name = "Label",
			Texture = "diffempty.png",
			InitCommand = function(self) self:x(labelPos) end,
			CurrentSongChangedMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song and song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
					self:stoptweening():cropright(1):sleep(0.5):linear(0.2):cropright(0)
				end;
			end;
			SNDLUpdateMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local group = getenv("getgroupname");
				if song then
					if group_name[group] ~= nil then
						self:diffuse(color(group_colors[group]))
		        self:diffusealpha(1)
					else
						self:diffuse(color("0,1,0.5,1"))
					end;
					if AnyPlayerThisDiff(diff) then
						self:diffusealpha(1)
					elseif song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
						self:diffusealpha(1)
					else
						self:diffusealpha(0)
					end
				else
					self:diffusealpha(0)
				end
			end
		},
		Def.Sprite{
			Name = "Label",
			Texture = "difffill.png",
			InitCommand = function(self) self:x(labelPos):cropright(1) end,
			CurrentSongChangedMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song and song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
					self:stoptweening():cropright(1):sleep(0.5):linear(0.2):cropright(0)
				end;
			end;
			SNDLUpdateMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local group = getenv("getgroupname");
				if song then
					if group_name[group] ~= nil then
						self:diffuse(color(group_colors[group]))
		        self:diffusealpha(1)
					else
						self:diffuse(color("0,1,0.5,1"))
					end;
					if AnyPlayerThisDiff(diff) then
						self:decelerate(0.3):cropright(0)
					elseif song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
						self:cropright(1)
					else
						self:cropright(1)
					end
				else
					self:cropright(1)
				end
			end
		},
		LoadFont("_itc avant garde gothic lt Bold 16px")..{
			Name = "Label",
			Text=THEME:GetString("CustomDifficulty",ToEnumShortString(diff));
			InitCommand = function(self) self:x(labelPos):zoom(1.1):y(2) end,
			CurrentSongChangedMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song and song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
					self:stoptweening():cropright(1):sleep(0.5):linear(0.2):cropright(0)
				end;
			end;
			SNDLUpdateMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				local group = getenv("getgroupname");
				if song then
					if AnyPlayerThisDiff(diff) then
						self:diffuse(color("1,1,1,1"))
						self:diffusealpha(1)
					elseif song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
						if group_name[group] ~= nil then
							self:diffuse(color(group_colors[group]))
			        self:diffusealpha(1)
						else
							self:diffuse(color("0,1,0.5,1"))
							self:diffusealpha(1)
						end;
					else
						self:diffusealpha(0)
					end
				else
					self:diffusealpha(0)
				end
			end
		},
	}
	table.insert(ret, element)
end
end

return ret
