local t = LoadFallbackB();
SOUND:DimMusic(1,math.huge)


t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")
t[#t+1] = StandardDecorationFromFileOptional("SortDisplay","SortDisplay")
t[#t+1] = StandardDecorationFromFileOptional( "BannerFrame","BannerFrame" );

-------------------------------------------------------------------------------------------------------------------
-- Groove Radars
-------------------------------------------------------------------------------------------------------------------
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X-300;y,SCREEN_CENTER_Y-100;zoom,0.8);
	LoadActor("radar (doubleres)");
};

t[#t+1] = Def.ActorFrame{
	Name = "Player 1";
	OnCommand=cmd(diffusealpha,0;addx,-400;sleep,0.1;linear,0.52;diffusealpha,0;addx,400;sleep,0.3;diffusealpha,0.75);
	CurrentSongChangedMessageCommand=function(self)
		local Song=GAMESTATE:GetCurrentSong()
			if not Song then
				self:diffusealpha(0)
			else
				self:diffusealpha(0.75)
			end;
		end;
	OffCommand=cmd(sleep,0.033;accelerate,0.33;addx,-400);
	create_ddr_groove_radar("P1_radar", SCREEN_CENTER_X-300, SCREEN_CENTER_Y-100,
		PLAYER_1, 120, color("1,1,1,0.25"),
		{ColorGR.PLAYER_1, ColorGR.PLAYER_1, ColorGR.PLAYER_1, ColorGR.PLAYER_1, ColorGR.PLAYER_1},
		"accelerate", .25, true)
};
t[#t+1] = Def.ActorFrame{
	Name = "Player 2";
	OnCommand=cmd(diffusealpha,0;addx,-400;sleep,0.1;linear,0.52;diffusealpha,0;addx,400;sleep,0.3;diffusealpha,1);
	CurrentSongChangedMessageCommand=function(self)
		local Song=GAMESTATE:GetCurrentSong()
			if not Song then
				self:diffusealpha(0)
			else
				self:diffusealpha(0.75)
			end;
		end;
	OffCommand=cmd(sleep,0.033;accelerate,0.33;addx,-400);
	create_ddr_groove_radar("P2_radar", SCREEN_CENTER_X-300, SCREEN_CENTER_Y-100,
		PLAYER_2, 120, color("1,1,1,0.25"),
		{ColorGR.PLAYER_2, ColorGR.PLAYER_2, ColorGR.PLAYER_2, ColorGR.PLAYER_2, ColorGR.PLAYER_2},
		"accelerate", .25, true)
};

t[#t+1] = Def.ActorFrame{
	InitCommand=function(self)
		self:fov(90);
	end;
	LoadActor("labels (doubleres)")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-300;y,SCREEN_CENTER_Y-100;rotationy,-20;);
	}
};

-- song options text (e.g. 1.5xmusic)
t[#t+1] = StandardDecorationFromFileOptional("SongOptions","SongOptions")

-- other items (balloons, etc.)
t[#t+1] = StandardDecorationFromFile( "Balloon", "Balloon" );
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","Music_In"))..{
		OnCommand=cmd(play);
	};
};

t[#t+1] = Def.ActorFrame{
	LoadFont("_pirates of cydonia 48px")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y-146;rotationz,1;zoom,0.4;maxwidth,600;halign,1);
		SetCommand=function(self)
			local group = getenv("getgroupname");
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:diffusealpha(1);
				self:settext(song:GetDisplayMainTitle());
			elseif group then
				if group_name[group] ~= nil then
					self:settext(group_name[group]);
				else
					self:settext(group)
				end;
			else
				self:diffusealpha(0);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	};
	LoadFont("_pirates of cydonia 48px")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y-120;rotationz,1;diffuse,color("0,0,0,1");zoom,0.4;maxwidth,600;halign,1);
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:diffusealpha(1);
				self:settext(song:GetDisplayArtist());
			else
				self:diffusealpha(0);
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
		ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	};
	LoadActor("DiffList.lua");
	--P1 Diff
	LoadFont("_pirates of cydonia 48px")..{
		InitCommand=cmd(xy,SCREEN_CENTER_X+75,SCREEN_CENTER_Y-70;rotationz,-2;zoom,0.4;maxwidth,600;halign,1);
		CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
					local diff = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
					self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
					self:diffuse(CustomDifficultyToColor(diff))
				else
					self:settext("")
				end;
			else
				self:settext("")
			end;
		end;
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	};
}

return t
