local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-195;queuecommand,"TweenOn");
  OffCommand=cmd(queuecommand,"TweenOff");
  ShowGameplayTopFrameMessageCommand=cmd(playcommand,"TweenOn");
  HideGameplayTopFrameMessageCommand=cmd(playcommand,"TweenOff");
  TweenOnCommand=cmd(visible,true);
  TweenOffCommand=cmd(visible,true);

  LoadActor("meter frame");

  Def.SongMeterDisplay{
    InitCommand=cmd(SetStreamWidth,172);
    Stream=LoadActor("meter stream")..{
      OnCommand=cmd(xy,SCREEN_LEFT+24,SCREEN_TOP+4);
    };
    Tip=LoadActor("tip")..{
      OnCommand=cmd(visible,false);
    };
  };

  Def.BitmapText{
    Font="_FFT reg.ini";
    OnCommand=cmd(y,-34;zoomx,1.25;shadowlength,0;maxwidth,235;visible,false);
    InitCommand=cmd(playcommand,"Update");
    CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
    UpdateCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      local text
      if song then
        text = song:GetDisplayFullTitle()
      else
        text = ""
      end
      self:settext(text)
    end;
  };
};



if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
t[#t+1] = Def.ActorFrame{
  OnCommand=cmd(sleep,0.5;queuecommand,"TweenOn");
  OffCommand=cmd(queuecommand,"TweenOff");
  ShowGameplayTopFrameMessageCommand=cmd(playcommand,"TweenOn");
  HideGameplayTopFrameMessageCommand=cmd(playcommand,"TweenOff");
  TweenOnCommand=cmd(visible,true);
  TweenOffCommand=cmd(visible,true);
  Def.ActorFrame{
    InitCommand=cmd(x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y-224);
    LoadActor("Lv.png");
    LoadActor("exp")..{
      OnCommand=cmd(xy,120,2);
    };
    Def.BitmapText{
      Font="_FFT2 white.ini";
      InitCommand=cmd(x,50);
      OnCommand=cmd(zoom,1.5;zoomx,1.8;playcommand,"Update");
      CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Update");
      UpdateCommand=function(self)
        local song = GAMESTATE:GetCurrentSong();
        local stepsP1 = GAMESTATE:GetCurrentSteps(PLAYER_1)
        if song then
          if stepsP1 ~= nil then
            local st = stepsP1:GetStepsType();
            local diff = stepsP1:GetDifficulty();
            local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
  					local cd = GetCustomDifficulty(st, diff, courseType);
            self:settext(stepsP1:GetMeter());
            self:diffuse(CustomDifficultyToColor(cd));
          end;
        end;
      end;
    }
  };
};
end;

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
t[#t+1] = Def.ActorFrame{
  OnCommand=cmd(sleep,0.5;queuecommand,"TweenOn");
  OffCommand=cmd(queuecommand,"TweenOff");
  ShowGameplayTopFrameMessageCommand=cmd(playcommand,"TweenOn");
  HideGameplayTopFrameMessageCommand=cmd(playcommand,"TweenOff");
  TweenOnCommand=cmd(visible,true);
  TweenOffCommand=cmd(visible,true);
  Def.ActorFrame{
    InitCommand=cmd(x,SCREEN_CENTER_X+51;y,SCREEN_CENTER_Y-224);
    LoadActor("Lv.png");
    LoadActor("exp")..{
      OnCommand=cmd(xy,120,2);
    };
    Def.BitmapText{
      Font="_FFT2 white.ini";
      InitCommand=cmd(x,50);
      OnCommand=cmd(zoom,1.5;zoomx,1.8;playcommand,"Update");
      CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Update");
      UpdateCommand=function(self)
        local song = GAMESTATE:GetCurrentSong();
        local stepsP2 = GAMESTATE:GetCurrentSteps(PLAYER_2)
        if song then
          if stepsP2 ~= nil then
            local st = stepsP2:GetStepsType();
            local diff = stepsP2:GetDifficulty();
            local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;
  					local cd = GetCustomDifficulty(st, diff, courseType);
            self:settext(stepsP2:GetMeter());
            self:diffuse(CustomDifficultyToColor(cd));
          end;
        end;
      end;
    }
  };
};
end;

return t;
