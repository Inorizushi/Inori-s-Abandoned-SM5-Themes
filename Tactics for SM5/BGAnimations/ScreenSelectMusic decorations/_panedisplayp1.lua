local t = Def.ActorFrame {};

-- Taps
t[#t+1] = LoadFont("_FFT2 pane") .. {
	InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,-38;y,-26+22*0);
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
		self:settext("Steps_")
	end;
};

-- Holds
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,-38;y,-26+22*1);
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
			PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
				self:settext("Holds_")
		  end;
};

-- MachineHighScore
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,-66;y,-26+22*2);
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
			PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
			self:settext("Best")
		  end;
};

-- ProfileHighScore
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,-66;y,-26+22*3);
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
			PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
			self:settext("Card")
		  end;
};

-- Jumps
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,128;y,-26+22*0);
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
			PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
			self:settext("Jumps_")
		  end;
};

-- Mines
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,128;y,-26+22*1);
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
			PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
			self:settext("Mines_")
		  end;
};

-- Hands
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,128;y,-26+22*2);
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
			self:settext("Hands_")
		  end;
};

-- Rolls
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,128;y,-26+22*3);
			PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
				self:settext("Rolls_")
		  end;
};

-- Taps num
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,29;y,-26+22*0);
      CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
		  PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
			stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if stepsP1 ~= nil then
					local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
					local P1Taps = Getp1Radar:GetValue('RadarCategory_TapsAndHolds')+Getp1Radar:GetValue('RadarCategory_Jumps')+Getp1Radar:GetValue('RadarCategory_Hands');
					self:settext(P1Taps);
				else
					self:settext("")
				end
			else
				self:settext("")
			end
         end
};

--Holds num
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,29;y,-26+22*1);
      CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
		  PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
			stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if stepsP1 ~= nil then
					local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
					local P1Holds = Getp1Radar:GetValue('RadarCategory_Holds');
					self:settext(P1Holds);
				else
					self:settext("")
				end
			else
				self:settext("")
			end
         end
};

--ProfileHS num
t[#t+1] = LoadFont("_FFT2 pane")..{
	InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,29;y,-26+22*2);
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
	ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
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
				-- 100% hack
				if text == "100.00%" then
					text = "100.00%";
				end;
			else
				text = string.format("%.2f%%", 0);
			end;
		else
			text = "";
		end;
		self:settext(text);
	end;
}

--Jumps num
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,165;y,-26+22*0);
      CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
		  PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
			stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if stepsP1 ~= nil then
					local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
					local P1Holds = Getp1Radar:GetValue('RadarCategory_Jumps');
					self:settext(P1Holds);
				else
					self:settext("")
				end
			else
				self:settext("")
			end
         end
};

--Mines num
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,165;y,-26+22*1);
      CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
		  PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
          SetCommand=function(self)
			stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if stepsP1 ~= nil then
					local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
					local P1Mines = Getp1Radar:GetValue('RadarCategory_Mines');
					self:settext(P1Mines);
				else
					self:settext("")
				end
			else
				self:settext("")
			end
         end
};

--Hands num
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,165;y,-26+22*2);
      CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
		  PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
          SetCommand=function(self)
			stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if stepsP1 ~= nil then
					local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
					local P1Mines = Getp1Radar:GetValue('RadarCategory_Hands');
					self:settext(P1Mines);
				else
					self:settext("")
				end
			else
				self:settext("")
			end
         end
};

--Rolls num
t[#t+1] = LoadFont("_FFT2 pane") .. {
		  InitCommand=cmd(horizalign,right;zoomy,0.8;zoomx,1;playcommand,"Set";x,165;y,-26+22*3);
      CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set";);
		  PlayerJoinedMessageCommand=cmd(playcommand,"Set");
      ChangedLanguageDisplayMessageCommand=cmd(playcommand,"Set");
          SetCommand=function(self)
			stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if stepsP1 ~= nil then
					local Getp1Radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
					local P1Mines = Getp1Radar:GetValue('RadarCategory_Rolls');
					self:settext(P1Mines);
				else
					self:settext("")
				end
			else
				self:settext("")
			end
         end
};

return t
