local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(y,SCREEN_TOP+44;diffusealpha,0.5);
  OffCommand=cmd(sleep,1;decelerate,1;addy,-200);
  --Header
  LoadActor("_Game")..{
    InitCommand=cmd(x,SCREEN_LEFT+112);
  };
  LoadFont("_gotham book 30px")..{
    InitCommand=cmd(x,SCREEN_LEFT+168;y,-6;halign,0;settext,"BUTTON";zoom,0.7);
  };
  LoadFont("_itc avant garde gothic lt Bold 16px")..{
    InitCommand=cmd(x,SCREEN_LEFT+168;y,12;halign,0;settext,"TUNES";);
  };
  LoadFont("_gotham book 30px")..{
    InitCommand=cmd(x,SCREEN_LEFT+260;halign,0;zoom,1.75;playcommand,"Set");
    SetCommand=function(self)
      self:settext(GAMESTATE:GetCurrentStyle():ColumnsPerPlayer())
    end;
  };
};

t[#t+1] = Def.ActorFrame{
  --Footer
  Def.ActorFrame{
    OffCommand=cmd(sleep,1;decelerate,1.5;addy,100);
    Def.Quad{
      InitCommand=cmd(diffuse,color("0,0,0,0.5");setsize,SCREEN_WIDTH,84;valign,1;xy,SCREEN_CENTER_X,SCREEN_BOTTOM);
    };
  };
  Def.ActorFrame{
    OffCommand=cmd(sleep,1;decelerate,1;addx,-SCREEN_WIDTH);
    Def.Quad{
      InitCommand=cmd(diffusealpha,0.5;setsize,4,52;valign,0;xy,SCREEN_LEFT+154,SCREEN_TOP);
    }
  }
};

--Diff Names
t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-404;diffuse,color("0,0,0,1"));
  OffCommand=cmd(sleep,1;decelerate,1;addx,-SCREEN_WIDTH);
  LoadFont("_gotham book 30px")..{
    InitCommand=cmd(x,-170;settext,"NM";zoom,0.6);
  };
  LoadFont("_gotham book 30px")..{
    InitCommand=cmd(x,-110;settext,"HD";zoom,0.6);
  };
  LoadFont("_gotham book 30px")..{
    InitCommand=cmd(x,-50;settext,"MX";zoom,0.6);
  };
  LoadFont("_gotham book 30px")..{
    InitCommand=cmd(x,10;settext,"SC";zoom,0.6);
  };
};

--Banner Area
t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_CENTER_X+496,SCREEN_CENTER_Y-156;diffusealpha,1;draworder,1;fov,10);
  OffCommand=cmd(sleep,1;decelerate,1;addx,SCREEN_WIDTH);
  Def.ActorFrame{
    NextSongMessageCommand=cmd(stoptweening;rotationx,-90;decelerate,0.3;rotationx,0);
    PreviousSongMessageCommand=cmd(stoptweening;rotationx,90;decelerate,0.3;rotationx,0);
    LoadActor("bannerframe");
    Def.Banner{
      CurrentSongChangedMessageCommand=cmd(stoptweening;sleep,0.1;queuecommand,"Set");
      SetCommand=function(self,params)
      local song = GAMESTATE:GetCurrentSong();
      local group = getenv("getgroupname");
      if song then
        if song:HasBackground() then
          self:diffusealpha(1);
          self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
          self:zoomtowidth(764);
          self:zoomtoheight(446);
        elseif song:HasJacket() then
          self:diffusealpha(1);
          self:LoadBackground(song:GetJacketPath());
          self:zoomtowidth(446);
          self:zoomtoheight(446);
        end;
      elseif group then
        if group_name[group] ~= nil then
          self:Load(THEME:GetPathG("","_backgrounds/group/"..group_name[group]..".png"))
          self:zoomtowidth(764);
          self:zoomtoheight(446);
        else
          self:LoadFromSongGroup(group);
        end;
        self:diffusealpha(1);
      else
        self:diffusealpha(0);
      end;
    end;
    };
    Def.Quad{
      InitCommand=function(self)
        self:zoomtowidth(764);
        self:zoomtoheight(446);
        self:diffuse(color("#000000"))
        self:croptop(1)
        self:cropbottom(1)
      end;
      --CurrentSongChangedMessageCommand=cmd(stoptweening;diffusealpha,1;sleep,0.2;linear,0.1;diffusealpha,0);
      NextSongMessageCommand=cmd(stoptweening;cropbottom,1;croptop,0;decelerate,0.15;cropbottom,0;decelerate,0.15;croptop,1;);
      PreviousSongMessageCommand=cmd(stoptweening;croptop,1;cropbottom,0;decelerate,0.15;croptop,0;decelerate,0.15;cropbottom,1;);
    };
    LoadActor("banner cover"); --Add Shade over Image
  };
  --[[Def.Quad{
    --Fake Transition between songs
    InitCommand=cmd(setsize,764,446;diffuse,color("0,0,0,1");croptop,1;croptop,1);
    NextSongMessageCommand=cmd(stoptweening;croptop,1;cropbottom,0;accelerate,0.1;croptop,0;sleep,0.25;accelerate,0.1;cropbottom,1;);
    PreviousSongMessageCommand=cmd(stoptweening;cropbottom,1;croptop,0;accelerate,0.1;cropbottom,0;sleep,0.25;accelerate,0.1;croptop,1;);
  };]]--
  Def.ActorFrame{
    --Group Name
    InitCommand=cmd(halign,0;x,-324;y,-211);
    OnCommand=function(self)
      self:stoptweening():cropright(1):sleep(0.5):linear(0.2):cropright(0)
    end;
    LoadActor("Group")..{
      SetCommand=function(self,param)
        local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
        local Song = GAMESTATE:GetCurrentSong();
        if Song then
          local group = Song:GetGroupName();
          if group_name[group] ~= nil then
            self:diffuse(color(group_colors[group]))
            self:diffusealpha(1)
          else
            self:diffuse(color("1,1,1,1"))
          end;
          self:stoptweening():cropright(1):sleep(0.5):linear(0.2):cropright(0)
        else
          self:stoptweening():cropright(1)
        end;
      end;
      CurrentSongChangedMessageCommand=cmd(stoptweening;cropright,1;queuecommand,"Set");
    };
    LoadFont("_itc avant garde gothic lt Bold 16px")..{
      InitCommand=cmd(halign,0;x,-54;maxwidth,100;wrapwidthpixels,2^24;);
      SetCommand=function(self,param)
        local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
        local Song = GAMESTATE:GetCurrentSong();
        if Song then
          local group = Song:GetGroupName();
          if group_name[group] ~= nil then
            self:settext(group_rename[group])
            self:diffuse(color("0,0,0,0.5"))
          else
            self:settext(group);
            self:diffuse(color("0,0,0,0.5"))
          end;
          self:stoptweening():cropright(1):sleep(0.5):linear(0.2):cropright(0)
        else
          self:stoptweening():cropright(1)
        end;
      end;
      CurrentSongChangedMessageCommand=cmd(stoptweening;cropright,1;queuecommand,"Set");
    };
  };
  Def.BitmapText{
    --Song Title/Group Name
    Font="_gotham light 48px";
    InitCommand=cmd(halign,0;x,-370;y,-170;maxwidth,600;wrapwidthpixels,2^24;queuecommand,"Set");
    SetCommand=function(self, param)
      local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
      local Song = GAMESTATE:GetCurrentSong();
			if Song then
        self:settext(Song:GetDisplayFullTitle());
			else
        if mw:GetSelectedType('WheelItemDataType_Section') then
          local group = mw:GetSelectedSection()
          if group_name[group] ~= nil then
            self:settext(group_rename[group])
          else
            self:settext(group);
          end;
        else
          self:settext("")
        end;
			end;
      self:stoptweening():cropright(1):sleep(0.5):linear(0.2):cropright(0)
	   end;
   CurrentSongChangedMessageCommand=cmd(stoptweening;cropright,1;queuecommand,"Set");
  };
  Def.BitmapText{
    --Artist Name
    Font="_itc avant garde gothic lt Bold 16px";
    InitCommand=cmd(halign,0;x,-368;y,-124;zoom,1.2;diffusealpha,0.5;maxwidth,600;wrapwidthpixels,2^24;queuecommand,"Set");
    SetCommand=function(self, param)
      local Song = GAMESTATE:GetCurrentSong();
			if Song then
        self:settext(Song:GetDisplayArtist());
      else
        self:settext("")
      end;
      self:stoptweening():cropright(1):sleep(0.5):linear(0.2):cropright(0)
    end;
    CurrentSongChangedMessageCommand=cmd(stoptweening;cropright,1;queuecommand,"Set");
  };
  Def.Quad{
    --Diff Backer
    InitCommand=cmd(setsize,764,224;y,111;diffuse,color("0,0,0,0.75"));
    CurrentSongChangedMessageCommand=cmd(stoptweening;cropright,1;queuecommand,"Set");
    SetCommand=function(self)
      local Song = GAMESTATE:GetCurrentSong()
      if Song then
        self:visible(true)
      else
        self:visible(false)
      end;
      self:stoptweening():cropright(1):sleep(0.5):decelerate(0.7):cropright(0)
    end;
  };
  Def.ActorFrame{
    --Ticks
    InitCommand=cmd(x,-360;y,88);
    Def.Sprite{
      Name = "TicksUnder",
      Texture = "15tick",
      InitCommand=function(self) self:halign(0):cropright(1):diffuse(color("#000000")):queuecommand("Set") end,
      SetCommand=function(self, params)
        local song = GAMESTATE:GetCurrentSong();
        if song then
          self:stoptweening():cropright(1):decelerate(0.5):cropright(0);
        else
          self:stoptweening():cropright(1)
        end;
      end;
      CurrentSongChangedMessageCommand=cmd(finishtweening;cropright,1;sleep,0.5;queuecommand,"Set");
    };
    Def.Sprite{
      Name = "TicksOver",
      Texture = "15tick",
      InitCommand=function(self) self:halign(0):cropright(1):queuecommand("Set") end,
      SetCommand=function(self, params)
        local song = GAMESTATE:GetCurrentSong();
        if song then
          local steps = song:GetOneSteps(GAMESTATE:GetCurrentStyle():GetStepsType(), GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty())
          if steps then
            local meter = steps:GetMeter()
            self:finishtweening():diffuse(color("#f5b000")):cropright(1):sleep(0.5):decelerate(0.5):cropright(1-meter/15);
          else
            self:stopeffect():cropright(1)
          end;
        else
          self:stopeffect():cropright(1)
        end;
      end;
      CurrentSongChangedMessageCommand=cmd(finishtweening;cropright,1;queuecommand,"Set");
      CurrentStepsP1ChangedMessageCommand=cmd(stoptweening;queuecommand,"Set");
    };
  };
};

t[#t+1] = LoadActor("difflist.lua");
--Beginner Badge
t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_CENTER_X+180,SCREEN_CENTER_Y-220;diffusealpha,1;draworder,1);
  LoadActor("beginner/frame.png")..{
    InitCommand=cmd(zoom,0);
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong();
      local group = getenv("getgroupname");
      if song then
        if GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() == 'Difficulty_Beginner' then
          self:zoom(0):linear(0.2):zoom(1)
          if group_name[group] ~= nil then
						self:diffuse(color(group_colors[group]))
		        self:diffusealpha(1)
					else
						self:diffuse(color("0,1,0.5,1"))
					end;
        else
          self:linear(0.2):zoom(0)
        end;
      else
        self:zoom(0)
      end;
    end;
    CurrentSongChangedMessageCommand=cmd(stoptweening;queuecommand,"Set");
    CurrentStepsP1ChangedMessageCommand=cmd(stoptweening;queuecommand,"Set");
  };
  LoadActor("beginner/text.png")..{
    InitCommand=cmd(zoom,0);
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong();
      local group = getenv("getgroupname");
      if song then
        if GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() == 'Difficulty_Beginner' then
          self:rotationz(2000):zoom(0):linear(0.2):zoom(1):rotationz(0)
        else
          self:linear(0.2):zoom(0):rotationz(2000)
        end;
      else
        self:zoom(0)
      end;
    end;
    CurrentSongChangedMessageCommand=cmd(stoptweening;queuecommand,"Set");
    CurrentStepsP1ChangedMessageCommand=cmd(stoptweening;queuecommand,"Set");
  };
  LoadActor("beginner/wakaba.png")..{
    InitCommand=cmd(zoom,0);
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong();
      local group = getenv("getgroupname");
      if song then
        if GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty() == 'Difficulty_Beginner' then
          self:rotationz(2000):zoom(0):linear(0.2):zoom(1):rotationz(0)
        else
          self:linear(0.2):zoom(0):rotationz(2000)
        end;
      else
        self:zoom(0)
      end;
    end;
    CurrentSongChangedMessageCommand=cmd(stoptweening;queuecommand,"Set");
    CurrentStepsP1ChangedMessageCommand=cmd(stoptweening;queuecommand,"Set");
  };
}

return t;
