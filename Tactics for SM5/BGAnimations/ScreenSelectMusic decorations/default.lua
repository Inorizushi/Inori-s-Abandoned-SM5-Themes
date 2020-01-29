local t = LoadFallbackB();

t[#t+1] = Def.ActorFrame{
  LoadActor("../Banner underlay")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-166);
    OnCommand=cmd(zoomy,.5;diffusealpha,0;linear,.2;zoomy,1;diffusealpha,1);
    OffCommand=cmd(zoomy,1;diffusealpha,1;linear,.2;zoomy,.5;diffusealpha,0);
  };
  LoadActor("Artist")..{
    InitCommand=cmd(x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y-167);
    OffCommand=cmd(visible,false);
  };
  Def.BitmapText{
    Font="_FFT2 reg";
    Text="BPM";
    InitCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y-132;shadowlength,0;zoomx,1.25);
    OffCommand=cmd(visible,false);
  }
}

if not GAMESTATE:IsCourseMode() then
  t[#t+1] = Def.ActorFrame{
    OnCommand=cmd(x,SCREEN_CENTER_X-148;y,SCREEN_CENTER_Y+118;zoom,0;linear,.2;zoom,1);
    OffCommand=cmd(zoom,0);
    LoadActor("SongWheel.png");
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Songs";
      InitCommand=cmd(x,-117;y,-112;shadowlength,0;zoomx,1.25);
    };
  };
  t[#t+1] = Def.ActorFrame{
    OnCommand=cmd(x,SCREEN_CENTER_X+215;y,SCREEN_CENTER_Y+103;zoom,0;linear,.2;zoom,1);
    OffCommand=cmd(zoom,0);
    LoadActor("Difficulty.png");
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Difficulty";
      InitCommand=cmd(x,-22;y,-80;shadowlength,0;zoomx,1.25);
    };
  };
  t[#t+1] = LoadActor("DifficultyList.lua");
  t[#t+1] = Def.ActorFrame{
    Def.BitmapText{
      Font="_FFT2 Pane.ini";
      Text="ALALALA";
      InitCommand=cmd(x,SCREEN_CENTER_X+48;y,SCREEN_CENTER_Y-202;horizalign,left;zoomx,1.25;shadowlength,0;maxwidth,30);
      OffCommand=cmd(zoom,0);
      SetCommand=function(self)
        local song = GAMESTATE:GetCurrentSong()
        if song then
          local group = song:GetGroupName()
          self:settext(SONGMAN:GetSongRank(song));
        else
          self:settext("");
        end;
      end;
      CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
    };
    Def.BitmapText{
      Font="_FFT reg.ini";
      Text="ALALALA";
      InitCommand=cmd(x,SCREEN_CENTER_X+90;y,SCREEN_CENTER_Y-200;zoomx,1.25;shadowlength,0;horizalign,left;maxwidth,160);
      OffCommand=cmd(zoom,0);
      SetCommand=function(self)
        local song = GAMESTATE:GetCurrentSong()
        if song then
          self:settext(song:GetDisplayFullTitle());
        else
          self:settext("");
        end;
      end;
      CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
    };
    Def.BitmapText{
      Font="_FFT reg.ini";
      Text="ALALALA";
      InitCommand=cmd(x,SCREEN_CENTER_X+30;y,SCREEN_CENTER_Y-168;zoomx,1.25;shadowlength,0;horizalign,left;maxwidth,205);
      OffCommand=cmd(zoom,0);
      SetCommand=function(self)
        local song = GAMESTATE:GetCurrentSong()
        if song then
          self:settext(song:GetDisplayArtist());
        else
          self:settext("");
        end;
      end;
      CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
    };
  };
else
  t[#t+1] = Def.ActorFrame{
    OnCommand=cmd(x,SCREEN_CENTER_X-148;y,SCREEN_CENTER_Y-12;zoom,0;linear,.2;zoom,1);
    OffCommand=cmd(zoom,0);
    LoadActor("CourseWheel.png");
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Courses";
      InitCommand=cmd(x,-106;y,-88;shadowlength,0;zoomx,1.25);
    };
  };
  t[#t+1] = Def.ActorFrame{
    OnCommand=cmd(x,SCREEN_CENTER_X-148;y,SCREEN_CENTER_Y+158;zoom,0;linear,.2;zoom,1);
    OffCommand=cmd(zoom,0);
    LoadActor("Contents.png");
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Courses";
      InitCommand=cmd(x,-105;y,-65;shadowlength,0;zoomx,1.25);
    };
  };
end;

if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
  t[#t+1] = Def.ActorFrame{
    InitCommand=cmd(xy,SCREEN_CENTER_X-147,SCREEN_CENTER_Y-59);
    OnCommand=cmd(zoom,0;linear,0.2;zoom,1);
    OffCommand=cmd(zoom,0);
    LoadActor("PaneDisplay under")..{
      InitCommand=cmd(y,3);
    };
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Player 1";
      InitCommand=cmd(xy,-91,-45;zoomx,1.25);
    };
    LoadActor("_panedisplayp1.lua")..{
      InitCommand=cmd(x,-38);
    }
  };
end;

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
  t[#t+1] = Def.ActorFrame{
    InitCommand=cmd(xy,SCREEN_CENTER_X+162,SCREEN_CENTER_Y-59);
    OnCommand=cmd(zoom,0;linear,0.2;zoom,1);
    OffCommand=cmd(zoom,0);
    LoadActor("PaneDisplay under")..{
      InitCommand=cmd(y,3);
    };
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Player 2";
      InitCommand=cmd(xy,-91,-45;zoomx,1.25);
    };
    LoadActor("_panedisplayp2.lua")..{
      InitCommand=cmd(x,-38);
    }
  };
end;

t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")
t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")

t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")

return t;
