local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")
t[#t+1] = StandardDecorationFromFileOptional("SortDisplay","SortDisplay")
t[#t+1] = StandardDecorationFromFileOptional("AvailableDifficulties", "AvailableDifficulties")
t[#t+1] = StandardDecorationFromFileOptional("GrooveRadar","GrooveRadar")
t[#t+1] = StandardDecorationFromFileOptional("StepsDisplayList","StepsDisplayList");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")

if not GAMESTATE:IsCourseMode() then
	t[#t+1] = LoadActor ("_panedisplayp1") .. {
			InitCommand=cmd(draworder,98;x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y-40;visible,GAMESTATE:IsHumanPlayer(PLAYER_1););
			OnCommand=cmd(addx,-320;linear,0.5;addx,320);
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd(visible,true))(self);
				end;
			end;
			OffCommand=cmd(linear,0.5;addx,-320);
		};

	t[#t+1] = LoadActor ("_panedisplayp2") .. {
			InitCommand=cmd(draworder,98;x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+40;visible,GAMESTATE:IsHumanPlayer(PLAYER_2););
			OnCommand=cmd(addx,-320;linear,0.5;addx,320);
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd(visible,true))(self);
				end;
			end;
			OffCommand=cmd(linear,0.5;addx,-320);
		};
end;

t[#t+1] = LoadActor( "bomb" ) .. {
	InitCommand=cmd(draworder,100;x,SCREEN_CENTER_X+68;y,SCREEN_CENTER_Y+14;zoom,0;playcommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		local zoom = 0
		if song then
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
			if steps then
				if steps:GetRadarValues(PLAYER_1):GetValue('RadarCategory_Mines') == 0 then
					zoom = 0
				else
					zoom = 1
				end
			else
				zoom = 0
			end
		else
			zoom = 0
		end
		self:finishtweening()
		self:bounceend(0.1)
		self:zoom(zoom)
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	OffCommand=cmd(bounceend,0.1;zoom,0);
};

-- ShockArrow mark 2P
t[#t+1] = LoadActor( "bomb" ) .. {
	InitCommand=cmd(draworder,100;x,SCREEN_CENTER_X+244;y,SCREEN_CENTER_Y+14;rotationy,180;zoom,0;playcommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		local zoom = 0
		if song then
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
			if steps then
				if steps:GetRadarValues(PLAYER_2):GetValue('RadarCategory_Mines') == 0 then
					zoom = 0
				else
					zoom = 1
				end
			else
				zoom = 0
			end
		else
			zoom = 0
		end
		self:finishtweening()
		self:bounceend(0.1)
		self:zoom(zoom)
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
	OffCommand=cmd(bounceend,0.1;zoom,0);
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

if not GAMESTATE:IsCourseMode() then
	local function GenerateModIconRow(pn)
		local MetricsName = "ModIcons" .. ToEnumShortString(pn);
		return Def.ActorFrame {
			InitCommand=function(self) self:name(MetricsName); ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); end;
			LoadActor( THEME:GetPathG("OptionIcon","Player") )..{
				InitCommand=cmd(pause;x,-310);
				BeginCommand=function(self)
					self:setstate( pn == PLAYER_1 and 0 or 1 );
				end;
				OnCommand=cmd(zoomy,0;linear,0.5;zoomy,1;);
				OffCommand=cmd(linear,0.5;zoomy,0;);
			};
			Def.ModIconRow {
				InitCommand=cmd(Load,"ModIconRowSelectMusic"..ToEnumShortString(pn),pn;);
				OnCommand=cmd(zoomy,0;linear,0.5;zoomy,1;);
				OffCommand=cmd(linear,0.5;zoomy,0;);
			};
		};
	end;

	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		if ShowStandardDecoration("ModIcons") then
			t[#t+1] = GenerateModIconRow(pn);
		end
	end;
end;

-- difficulty icons
if ShowStandardDecoration("DifficultyIcons") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local diffFrame = LoadActor(THEME:GetPathG(Var "LoadingScreen", "DifficultyFrame"), pn)
		t[#t+1] = StandardDecorationFromTable( "DifficultyFrame" .. ToEnumShortString(pn), diffFrame );

		local diffIcon = LoadActor(THEME:GetPathG(Var "LoadingScreen", "DifficultyIcon"), pn)
		t[#t+1] = StandardDecorationFromTable( "DifficultyIcon" .. ToEnumShortString(pn), diffIcon );
	end
end

-- StepsDisplay
local function StepsDisplay(pn)
	local function set(self, player)
		self:SetFromGameState(player);
	end

	local name = "StepsDisplaySelMusic";

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
		-- frame
		local meterFrame = LoadActor(THEME:GetPathG(Var "LoadingScreen", "MeterFrame"), pn)
		t[#t+1] = StandardDecorationFromTable( "MeterFrame" .. ToEnumShortString(pn), meterFrame );

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

if AllowOptionsMenu() then
	t[#t+1] = StandardDecorationFromFile("OptionsMessage","OptionsMessage")
end

t[#t+1] = StandardDecorationFromFile( "Balloon", "Balloon" );

return t;
