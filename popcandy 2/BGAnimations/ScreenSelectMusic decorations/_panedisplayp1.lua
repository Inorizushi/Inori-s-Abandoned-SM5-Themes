local t = Def.ActorFrame {};
-- Taps
t[#t+1] = LoadActor("Pane icons/taps") .. {
		  InitCommand=cmd(addx,12);
};

-- Holds
t[#t+1] = LoadActor("Pane icons/holds") .. {
		  InitCommand=cmd(addx,70);
};

-- Mines
t[#t+1] = LoadActor("Pane icons/mines") .. {
		  InitCommand=cmd(addx,128);
};

t[#t+1] = LoadActor("Pane icons/machinehighscore") .. {
		  InitCommand=cmd(addx,184);
};

t[#t+1] = LoadActor("Pane icons/highscore") .. {
		  InitCommand=cmd(addx,258);
};

--taps num
t[#t+1] = LoadFont("_shared3") .. {
	InitCommand=cmd(shadowlength,1;horizalign,right;zoom,0.5;addx,60);
  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
	PlayerJoinedMessageCommand=cmd(playcommand,"Set";);
  ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if stepsP1 ~= nil then
				local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				local P1Taps = Getp1Radar:GetValue('RadarCategory_TapsAndHolds')+Getp1Radar:GetValue('RadarCategory_Jumps')+Getp1Radar:GetValue('RadarCategory_Hands');
				if P1Taps >= 1 and P1Taps < 200 then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif P1Taps >= 200 and P1Taps < 350 then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif P1Taps >= 350 and P1Taps < 550 then
					self:stopeffect():diffuse(color("0.9,0.9,0,1"))
				elseif P1Taps >= 550 and P1Taps < 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1"))
				elseif P1Taps >= 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1")):glowshift():effectclock(beatnooffset):effectperiod(1)
				end;
				self:settext(P1Taps);
			else
				self:settext("")
			end
		else
			self:settext("?")
			self:stopeffect()
			self:diffuse(color("#FFFFFF"))
		end
  end
};

--Hold num
t[#t+1] = LoadFont("_shared3") .. {
	InitCommand=cmd(shadowlength,1;horizalign,right;zoom,0.5;addx,118);
  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
  ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if stepsP1 ~= nil then
				local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				local P1Holds = Getp1Radar:GetValue('RadarCategory_Holds');
				if P1Holds >= 1 and P1Holds < 200 then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif P1Holds >= 200 and P1Holds < 350 then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif P1Holds >= 350 and P1Holds < 550 then
					self:stopeffect():diffuse(color("0.9,0.9,0,1"))
				elseif P1Holds >= 550 and P1Holds < 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1"))
				elseif P1Holds >= 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1")):glowshift():effectclock(beatnooffset):effectperiod(1)
				end;
				self:settext(P1Holds);
			else
				self:settext("")
			end
		else
			self:settext("?")
			self:stopeffect()
			self:diffuse(color("#FFFFFF"))
		end
  end
};

--Mine num
t[#t+1] = LoadFont("_shared3") .. {
	InitCommand=cmd(shadowlength,1;horizalign,right;zoom,0.5;addx,175);
	OnCommand=cmd(queuecommand,"Transition";);
  CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			if stepsP1 ~= nil then
				local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				local P1Mines = Getp1Radar:GetValue('RadarCategory_Mines');
				if P1Mines >= 1 and P1Mines < 200 then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif P1Mines >= 200 and P1Mines < 350 then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif P1Mines >= 350 and P1Mines < 550 then
					self:stopeffect():diffuse(color("0.9,0.9,0,1"))
				elseif P1Mines >= 550 and P1Mines < 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1"))
				elseif P1Mines >= 9999 then
					self:stopeffect():diffuse(color("1,0,0.2,1")):glowshift():effectclock(beatnooffset):effectperiod(1)
				else
					self:stopeffect():diffuse(color("#FFFFFF"))
				end;
				self:settext(P1Mines);
			else
				self:settext("")
			end
		else
			self:settext("?")
			self:stopeffect()
			self:diffuse(color("#FFFFFF"))
		end
  end
};

--MachineHS num
t[#t+1] = LoadFont("_shared3")..{
	InitCommand=cmd(shadowlength,1;zoom,0.5;horizalign,right;playcommand,"Set";addx,248);
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local SongOrCourse, StepsOrTrail;
		if GAMESTATE:IsCourseMode() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
			StepsOrTrail = GAMESTATE:GetCurrentTrail(PLAYER_1);
		else
			SongOrCourse = GAMESTATE:GetCurrentSong();
			StepsOrTrail = GAMESTATE:GetCurrentSteps(PLAYER_1);
		end;

		local profile, scorelist;
		local text = "";
		if SongOrCourse and StepsOrTrail then
			local st = StepsOrTrail:GetStepsType();
			local diff = StepsOrTrail:GetDifficulty();
			local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

				-- machine profile
				profile = PROFILEMAN:GetMachineProfile();

			scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
			assert(scorelist)
			local scores = scorelist:GetHighScores();
			local topscore = scores[1];
			if topscore then
				text = string.format("%.2f%%", topscore:GetPercentDP()*100.0);
				if text >= "0.01%" and text < "80.01%" then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif text >= "80.01%" and text < "101.00%" then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif text >= "101.00%" then
					self:stopeffect():diffuse(color("0,0.9,1,1"))
				else
					self:stopeffect():diffuse(color("#FFFFFF"))
				end;
				-- 100% hack
				if text == "100.00%" then
					text = "100.00%";
				end;
			else
				text = string.format("%.2f%%", 0);
			end;
		else
			text = "?";
		end;
		self:settext(text);
	end;
}

--ProfileHS num
t[#t+1] = LoadFont("_shared3")..{
	InitCommand=cmd(shadowlength,1;zoom,0.5;horizalign,right;playcommand,"Set";addx,320);
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local SongOrCourse, StepsOrTrail;
		if GAMESTATE:IsCourseMode() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
			StepsOrTrail = GAMESTATE:GetCurrentTrail(PLAYER_1);
		else
			SongOrCourse = GAMESTATE:GetCurrentSong();
			StepsOrTrail = GAMESTATE:GetCurrentSteps(PLAYER_1);
		end;

		local profile, scorelist;
		local text = "";
		if SongOrCourse and StepsOrTrail then
			local st = StepsOrTrail:GetStepsType();
			local diff = StepsOrTrail:GetDifficulty();
			local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

			if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
				-- player profile
				profile = PROFILEMAN:GetProfile(PLAYER_1);
			else
				-- machine profile
				profile = PROFILEMAN:GetMachineProfile();
			end;

			scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
			assert(scorelist)
			local scores = scorelist:GetHighScores();
			local topscore = scores[1];
			if topscore then
				text = string.format("%.2f%%", topscore:GetPercentDP()*100.0);
				if text >= "0.01%" and text < "80.00%" then
					self:stopeffect():diffuse(color("#FFFFFF"))
				elseif text >= "80.01%" and text < "101.00%" then
					self:stopeffect():diffuse(color("0.2,1,0.2,1"))
				elseif text >= "101.00%" then
					self:stopeffect():diffuse(color("0,0.9,1,1"))
				else
					self:stopeffect():diffuse(color("#FFFFFF"))
				end;
				-- 100% hack
				if text == "100.00%" then
					text = "100.00%";
				end;
			else
				text = "N/A"
			end;
		else
			text = "?";
		end;
		self:settext(text);
	end;
}

return t
