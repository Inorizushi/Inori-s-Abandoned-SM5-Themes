local player = ...
local t = Def.ActorFrame{};

local function GetDifListX(self,offset)
        if player==PLAYER_1 then
                self:x(SCREEN_LEFT+148+offset)
        elseif player==PLAYER_2 then
                self:x(SCREEN_RIGHT-148-offset)
        end
end

t[#t+1] = Def.ActorFrame{
  OnCommand=function(self)
    GetDifListX(self, 6)
    self:y(_screen.cy-222)
    self:zoomx(player=='PlayerNumber_P2' and -1 or 1)
  end,
  LoadActor("scms_diff_window_tab.png");
  Def.ActorFrame{
    InitCommand=cmd(y,-14);
    LoadActor("jp_topword");
  };
};

local yspacing = 38;

local function DrawDifListItem(diff)
  local DifficultyListItem = Def.ActorFrame{
    InitCommand=cmd(y, _screen.cy-210 ),
    CurrentSongChangedMessageCommand=cmd(playcommand,"Set"),
    CurrentStepsP1ChangedMessageCommand=function(self) if player == PLAYER_1 then self:playcommand("Set") end end,
    CurrentStepsP2ChangedMessageCommand=function(self) if player == PLAYER_2 then self:playcommand("Set") end end,
    CurrentTrailP1ChangedMessageCommand=function(self) if player == PLAYER_1 then self:playcommand("Set") end end,
    CurrentTrailP2ChangedMessageCommand=function(self) if player == PLAYER_2 then self:playcommand("Set") end end,
    CurrentCourseChangedMessageCommand=cmd(playcommand,"Set"),
    OffCommand=function(self)
      if player == PLAYER_1 then
        (cmd(sleep,0.15; linear,0.25; addx,-500))(self);
      elseif player == PLAYER_2 then
        (cmd(sleep,0.15; linear,0.25; addx,500))(self);
      end;
    end;
    Def.Quad{
      Name="Background";
      InitCommand=cmd(setsize,248,25;diffusealpha,0.8;draworder,0;visible,false);
      SetCommand=function(self)
        local st=GAMESTATE:GetCurrentStyle():GetStepsType()
        local song=GAMESTATE:GetCurrentSong()
        if song then
          GetDifListX(self, 0)
          self:y(Difficulty:Reverse()[diff] * yspacing)
          if song:HasStepsTypeAndDifficulty( st, diff ) then
            local steps = song:GetOneSteps( st, diff )
            self:visible(true)
          else
            self:visible(false)
          end
        end;
      end;
    };

    Def.Sprite{
      Name="DiffLabel";
      InitCommand=function(self)
        self:halign(player=='PlayerNumber_P2' and 1 or 0):visible(false)
      end;
      SetCommand=function(self)
        local diffname = THEME:GetString("CustomDifficulty",ToEnumShortString(diff))
        self:Load(THEME:GetPathB("","ScreenSelectMusic overlay/deco/diff/"..diffname..".png"));
        local st=GAMESTATE:GetCurrentStyle():GetStepsType()
        local song=GAMESTATE:GetCurrentSong()
        if song then
          GetDifListX(self, -120)
          self:y(Difficulty:Reverse()[diff] * yspacing)
          if song:HasStepsTypeAndDifficulty( st, diff ) then
            local steps = song:GetOneSteps( st, diff )
            self:visible(true)
          else
            self:visible(false)
          end
        end;
      end;
    };
    Def.Quad{
      Name="MeterBG";
      InitCommand=cmd(setsize,25,25;visible,false);
      SetCommand=function(self)
        self:diffuse(CustomDifficultyToColor(diff))
        local st=GAMESTATE:GetCurrentStyle():GetStepsType()
        local song=GAMESTATE:GetCurrentSong()
        if song then
          GetDifListX(self, -28)
          self:y(Difficulty:Reverse()[diff] * yspacing)
          if song:HasStepsTypeAndDifficulty( st, diff ) then
            local steps = song:GetOneSteps( st, diff )
            self:visible(true)
          else
            self:visible(false)
          end
        end;
      end;
    };
    LoadFont("_geo 95 20px")..{
      Name="Meter";
      InitCommand=cmd(draworder,99;zoom,1.1;strokecolor,Color.Black;);
      SetCommand=function(self)
        self:settext("")
        local st=GAMESTATE:GetCurrentStyle():GetStepsType()
        local song=GAMESTATE:GetCurrentSong()
        if song then
          GetDifListX(self, -28)
          self:y( Difficulty:Reverse()[diff] * yspacing)
          self:addy(-8)
          if song:HasStepsTypeAndDifficulty( st, diff ) then
            local steps = song:GetOneSteps( st, diff )
            self:settext( steps:GetMeter() )
          end
        end;
      end;
    };

    LoadFont("_geo 95 20px")..{
      Name="Score";
      InitCommand=cmd(draworder,5;zoom,1.1;halign,1);
      BeginCommand=cmd(playcommand,"Set");
      SetCommand=function(self)
        self:settext("")

        local st=GAMESTATE:GetCurrentStyle():GetStepsType()
        local song=GAMESTATE:GetCurrentSong()
        if song then
          GetDifListX(self, 75)
          self:y( Difficulty:Reverse()[diff] * yspacing)
          self:addy(-10)
          if song:HasStepsTypeAndDifficulty(st,diff) then
            local steps = song:GetOneSteps(st,diff)

            if PROFILEMAN:IsPersistentProfile(player) then
              profile = PROFILEMAN:GetProfile(player)
            else
              profile = PROFILEMAN:GetMachineProfile()
            end;

            scorelist = profile:GetHighScoreList(song,steps)
            local scores = scorelist:GetHighScores()
            local topscore = 0

            if scores[1] then
              topscore = 10*math.round(SN2Scoring.GetSN2ScoreFromHighScore(steps, scores[1])/10)
            end;

            self:diffuse(Color.Black)
            self:diffusealpha(1)

            if topscore ~= 0 then
              if topscore < 1000000 then
                local scorel3 = topscore%1000
                local scorel2 = (topscore/1000)%1000
                self:settextf("%03d"..",".."%03d",scorel2,scorel3)
              else
                self:settext("1,000,000")
              end;
            end;
          end;
        end;
      end;
    };
    LoadActor(THEME:GetPathG("","myMusicWheel/Player Badge FullCombo"))..{
      InitCommand=cmd(shadowlength,1;zoom,0;draworder,5);
      BeginCommand=cmd(playcommand,"Set");
      OffCommand=cmd(decelerate,0.05;diffusealpha,0;);
      SetCommand=function(self)
        local st=GAMESTATE:GetCurrentStyle():GetStepsType();
        local song=GAMESTATE:GetCurrentSong();
        local course = GAMESTATE:GetCurrentCourse();
        if song then
          self:x(player=='PlayerNumber_P2' and (SCREEN_RIGHT-148-100) or (SCREEN_LEFT+148+100))
          self:y( (Difficulty:Reverse()[diff]) * yspacing + 4);
          if song:HasStepsTypeAndDifficulty(st,diff) then
            local steps = song:GetOneSteps( st, diff );
            if PROFILEMAN:IsPersistentProfile(player) then
              profile = PROFILEMAN:GetProfile(player);
            else
              profile = PROFILEMAN:GetMachineProfile();
            end;
            scorelist = profile:GetHighScoreList(song,steps);
            assert(scorelist);
            local scores = scorelist:GetHighScores();
            assert(scores);
            local topscore;
            if scores[1] then
              topscore = scores[1];
              assert(topscore);
              local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
              local boos = topscore:GetTapNoteScore("TapNoteScore_W5")
              local goods = topscore:GetTapNoteScore("TapNoteScore_W4")
              local greats = topscore:GetTapNoteScore("TapNoteScore_W3")
              local perfects = topscore:GetTapNoteScore("TapNoteScore_W2")
              local marvelous = topscore:GetTapNoteScore("TapNoteScore_W1")
              if (misses+boos) == 0 and scores[1]:GetScore() > 0 and (marvelous+perfects)>0 then
                if (greats+perfects) == 0 then
                  self:diffuse(GameColor.Judgment["JudgmentLine_W1"]);
                  self:glowblink();
                  self:effectperiod(0.20);
                  self:zoom(0.5);
                  self:addx(12);
                elseif greats == 0 then
                  self:diffuse(GameColor.Judgment["JudgmentLine_W2"]);
                  self:glowshift();
                  self:zoom(0.5);
                  self:addx(12);
                elseif (misses+boos+goods) == 0 then
                  self:diffuse(GameColor.Judgment["JudgmentLine_W3"]);
                  self:stopeffect();
                  self:zoom(0.5);
                  self:addx(12);
                elseif (misses+boos) == 0 then
                  self:diffuse(GameColor.Judgment["JudgmentLine_W4"]);
                  self:stopeffect();
                  self:zoom(0.5);
                  self:addx(10);
                end;
                self:diffusealpha(0.8);
              else
                self:diffusealpha(0);
              end;
            else
              self:diffusealpha(0);
            end;
          else
            self:diffusealpha(0);
          end;
        else
          self:diffusealpha(0);
        end;
      end
    };
    Def.Quad{
    InitCommand=cmd(draworder,5);
    BeginCommand=cmd(playcommand,"Set");
    SetCommand=function(self)
      local st=GAMESTATE:GetCurrentStyle():GetStepsType();
      local song=GAMESTATE:GetCurrentSong();
      if song then
        self:x(player=='PlayerNumber_P2' and (SCREEN_RIGHT-148-100) or (SCREEN_LEFT+148+134))
        self:halign(0)
        self:y( (Difficulty:Reverse()[diff]) * yspacing)
        if song:HasStepsTypeAndDifficulty(st,diff) then
          local steps = song:GetOneSteps(st, diff)
          if PROFILEMAN:IsPersistentProfile(player) then
            profile = PROFILEMAN:GetProfile(player)
          else
            profile = PROFILEMAN:GetMachineProfile()
          end

          scorelist = profile:GetHighScoreList(song,steps)
          local scores = scorelist:GetHighScores()

          local topscore=0
          if scores[1] then
            topscore = 10*math.round(SN2Scoring.GetSN2ScoreFromHighScore(steps, scores[1])/10)
          end

          local topgrade
          if scores[1] then
            topgrade = scores[1]:GetGrade();
            local tier = SN2Grading.ScoreToGrade(topscore, diff)
            assert(topgrade);
            if scores[1]:GetScore()>1  then
              self:LoadBackground(THEME:GetPathG("myMusicWheel/GradeDisplayEval",ToEnumShortString(tier)));
              self:diffusealpha(1);
              self:addx(-60);
            else
              self:diffusealpha(0);
            end;
          else
            self:diffusealpha(0);
          end;
        else
          self:diffusealpha(0);
        end;
      else
        self:diffusealpha(0);
      end;
    end;
    };
  };
  return DifficultyListItem
end;

local difficulties = {"Beginner", "Easy", "Medium", "Hard", "Challenge"}

for difficulty in ivalues(difficulties) do
        t[#t+1] = DrawDifListItem("Difficulty_" .. difficulty);
end

t[#t+1] = Def.ActorFrame{
  InitCommand=function(self)
    GetDifListX(self, -1)
    self:diffusealpha(0)
  end;
  OffCommand=function(self)
    if player == PLAYER_1 then
      (cmd(sleep,0.15; linear,0.25; addx,-500))(self);
    elseif player == PLAYER_2 then
      (cmd(sleep,0.15; linear,0.25; addx,500))(self);
    end;
  end;
  ["CurrentSteps" .. ToEnumShortString(player) .. "ChangedMessageCommand"]=function(self)
    self:finishtweening()
    self:linear(0.2):diffusealpha(1)
    local song=GAMESTATE:GetCurrentSong()
    if song then
      local steps = GAMESTATE:GetCurrentSteps(player)
      if steps then
        local diff = steps:GetDifficulty();
        local st=GAMESTATE:GetCurrentStyle():GetStepsType();
        self:y(150+(Difficulty:Reverse()[diff] * yspacing))
        self:queuecommand("Anim")
      end;
    end;
  end;
  CurrentSongChangedMessageCommand=cmd(queuecommand,"Anim");
  LoadActor("dif_windo_cursor_line_bk.png")..{
    InitCommand=cmd(diffusealpha,0.5);
  };
  LoadActor("dif_windo_cursor_line.png")..{
    InitCommand=cmd(diffusealpha,0.25);
    AnimCommand=cmd(diffusealpha,0;linear,0.05;diffusealpha,0.75;linear,0.5;diffusealpha,0;sleep,0.1;queuecommand,"Anim");
  };
  LoadActor("dif_windo_cross_point.png")..{
    Name="topleft";
    InitCommand=cmd(xy,-124,-16;diffusealpha,0.75);
    AnimCommand=function(self)
      self:stoptweening():linear(0.2):rotationz(45):linear(0.2):rotationz(0)
    end;
  };
  LoadActor("dif_windo_cross_point.png")..{
    Name="topright";
    InitCommand=cmd(xy,128,-16;diffusealpha,0.75);
    AnimCommand=function(self)
      self:stoptweening():linear(0.2):rotationz(45):linear(0.2):rotationz(0)
    end;
  };
  LoadActor("dif_windo_cross_point.png")..{
    Name="bottomright";
    InitCommand=cmd(xy,128,16;diffusealpha,0.75);
    AnimCommand=function(self)
      self:stoptweening():linear(0.2):rotationz(45):linear(0.2):rotationz(0)
    end;
  };
  LoadActor("dif_windo_cross_point.png")..{
    Name="bottomleft";
    InitCommand=cmd(xy,-124,16;diffusealpha,0.75);
    AnimCommand=function(self)
      self:stoptweening():linear(0.2):rotationz(45):linear(0.2):rotationz(0)
    end;
  };
};

return t;
