-- when they say fallback they mean fallback, as in "sorry, we're going to
-- import the stuff from ScreenSelectMusic decorations anyways" fallback.
local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")
t[#t+1] = StandardDecorationFromFile("NumCourseStages","NumCourseStages")

-- course contents list (the worst part)
t[#t+1] = StandardDecorationFromFile("CourseContentsList","CourseContentsList")

t[#t+1] = LoadActor("explanation")..{
	InitCommand=cmd(xy,SCREEN_CENTER_X+336,SCREEN_TOP+68);
	OnCommand=cmd(rotationz,90;sleep,0.5;bounceend,0.5;rotationz,0);
	OffCommand=cmd(bouncebegin,0.5;rotationz,90;);
};

t[#t+1] = StandardDecorationFromFileOptional("SongTime","SongTime") .. {
	SetCommand=function(self)
		local curSelection = nil;
		local length = 0.0;
		if GAMESTATE:IsCourseMode() then
			curSelection = GAMESTATE:GetCurrentCourse();
			self:playcommand("Reset");
			if curSelection then
				local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber());
				if trail then
					length = TrailUtil.GetTotalSeconds(trail);
				else
					length = 0.0;
				end;
			else
				length = 0.0;
			end;
		else
			curSelection = GAMESTATE:GetCurrentSong();
			self:playcommand("Reset");
			if curSelection then
				length = curSelection:MusicLengthSeconds();
        self:diffusealpha(1);
			else
				length = 0.0;
        self:diffusealpha(0);
			end;
		end;
		self:settext( SecondsToMMSSMsMs(length) );
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
}

-- StepsDisplay
local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState(player);
	end

	local name = "StepsDisplaySelCourse";

	local sd = Def.StepsDisplay {
		InitCommand=cmd(Load,name..ToEnumShortString(pn),GAMESTATE:GetPlayerState(pn););
		CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if not song then
				-- hacky hack 1: set all feet to nothing!
				self:GetChild("Ticks"):settext("0000000000");
				-- hacky hack 2: diffuse to beginner
				self:GetChild("Ticks"):diffuse(CustomDifficultyToColor("Beginner"))
			end
		end;
	};

	if pn == PLAYER_1 then
		sd.CurrentStepsP1ChangedMessageCommand=function(self) set(self, pn); end;
		sd.CurrentTrailP1ChangedMessageCommand=function(self) set(self, pn); end;
	else
		sd.CurrentStepsP2ChangedMessageCommand=function(self) set(self, pn); end;
		sd.CurrentTrailP2ChangedMessageCommand=function(self) set(self, pn); end;
	end

	return sd;
end

if ShowStandardDecoration("StepsDisplay") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		-- stepsdisplay
		local MetricsName = "StepsDisplay" .. PlayerNumberToString(pn);
		t[#t+1] = StepsDisplay(pn) .. {
			InitCommand=function(self)
				self:player(pn);
				self:name(MetricsName);
				ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
			end;
		};
	end
end

return t
