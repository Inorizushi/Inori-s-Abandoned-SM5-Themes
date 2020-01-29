local songoptions = GAMESTATE:GetSongOptionsString();
local ratemod = string.match(songoptions, "%d.%d");
if ratemod then
	ratemod = tonumber(ratemod);
else
	ratemod = 1.0
end


local function UpdateSingleBPM(self)
	local bpmDisplay = self:GetChild("BPMDisplay")
	local pn = GAMESTATE:GetMasterPlayerNumber()
	local pState = GAMESTATE:GetPlayerState(pn);
	local songPosition = pState:GetSongPosition()
	local bpm = songPosition:GetCurBPS() * 60 * ratemod
	bpmDisplay:settext( round(bpm) )
end

local t = Def.ActorFrame{};

local displaySingle = Def.ActorFrame{
	OnCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then
			(THEME:GetMetric("BPMDisplay","SetExtraCommand"))(self)
		elseif song:IsDisplayBpmRandom() then
			(THEME:GetMetric("BPMDisplay","SetRandomCommand"))(self)
		else
			local bpms = song:GetDisplayBpms()
			if bpms[1]==bpms[2] then
				(THEME:GetMetric("BPMDisplay","SetNormalCommand"))(self)
			else
				(THEME:GetMetric("BPMDisplay","SetChangeCommand"))(self)
			end
		end
	end;
	LoadFont("BPMDisplay bpm")..{
		Name="BPMDisplay";
		InitCommand=cmd(halign,1)
	};
	LoadActor(THEME:GetPathG("","BPMDisplay label"))..{
		Name="BPMLabel";
		InitCommand=cmd(halign,0)
	};
};

displaySingle.InitCommand=cmd(SetUpdateFunction,UpdateSingleBPM);

-- in CourseMode, both players should always be playing the same charts, right?
t[#t+1] = displaySingle

return t
