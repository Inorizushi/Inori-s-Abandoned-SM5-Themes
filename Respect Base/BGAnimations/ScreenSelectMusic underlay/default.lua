local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  Def.Sprite{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-SCREEN_HEIGHT;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0.5;);
    OnCommand=cmd(stoptweening;sleep,0.1;decelerate,0.5;y,SCREEN_CENTER_Y;playcommand,"Set");
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong();
      local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
      if song then
        if song:HasBackground() then
          if song:HasBGChanges() then
            local bg = song:GetSongDir();
            local bgvideo = {}
            local listing = FILEMAN:GetDirListing(bg, false, true)
            if not listing then return nil end
            for _, file in pairs(listing) do
              if ActorUtil.GetFileType(file) == 'FileType_Movie' then
                table.insert(bgvideo,file)
              end
            end;
            if song:HasBGChanges() and #bgvideo ~= 0 then
              self:Load(bgvideo[1])
              self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
              self:diffusealpha(1)
            else
              self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
              self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
              self:diffusealpha(1)
            end;
          else
            self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
            self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
            self:diffusealpha(1)
          end;
        else
          local group = song:GetGroupName();
          if group_name[group] ~= nil then
            self:Load(THEME:GetPathG("","_backgrounds/group/"..group_name[group]..".png"))
            self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
            self:diffusealpha(1)
          else
            self:Load(THEME:GetPathG("","Common fallback background"));
            self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
            self:diffusealpha(1)
          end;
        end;
      elseif mw:GetSelectedType('WheelItemDataType_Section') then
        local group = mw:GetSelectedSection()
        if group_name[group] ~= nil then
          self:Load(THEME:GetPathG("","_backgrounds/group/"..group_name[group]..".png"))
          self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
          self:diffusealpha(1)
        else
          self:Load(THEME:GetPathG("","Common fallback background"));
          self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
          self:diffusealpha(1)
        end;
      else
        self:Load(THEME:GetPathG("","Common fallback background"));
        self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
        self:diffusealpha(1)
      end;
    end;
    CurrentSongChangedMessageCommand=cmd(stoptweening;sleep,1;queuecommand,"Set");
  };
  LoadActor("blur thing")..{
    InitCommand=cmd(FullScreen;blend,'BlendMode_WeightedMultiply';diffusealpha,0.5;);
  };
  LoadActor("../stripes")..{
    InitCommand=cmd(FullScreen;diffusealpha,0.5;);
  };
};

t[#t+1] = Def.ActorFrame{
  OnCommand=cmd(diffusealpha,0;sleep,2;diffusealpha,1);
  --red
  Def.ActorFrame{
    InitCommand=cmd(diffuse,color("0.3,0.3,0.3,1");x,-(SCREEN_WIDTH*2);CenterY);
    CurrentSongChangedMessageCommand=cmd(stoptweening;x,-(SCREEN_WIDTH*2);diffusealpha,1;accelerate,0.5;x,SCREEN_WIDTH;sleep,0.75;diffusealpha,0);
    Def.ActorFrame{
      Def.Quad{
        InitCommand=cmd(setsize,SCREEN_WIDTH*2,SCREEN_HEIGHT)
      };
      LoadActor("corner")..{
        InitCommand=cmd(halign,0;x,SCREEN_WIDTH);
      };
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(diffuse,color("0.1,0.1,0.1,1");x,-(SCREEN_WIDTH*2);CenterY);
    CurrentSongChangedMessageCommand=cmd(stoptweening;x,-(SCREEN_WIDTH*2);diffusealpha,1;sleep,0.5;accelerate,0.75;x,SCREEN_WIDTH;sleep,0.1;diffusealpha,0);
    Def.ActorFrame{
      Def.Quad{
        InitCommand=cmd(setsize,SCREEN_WIDTH*2,SCREEN_HEIGHT)
      };
      LoadActor("corner")..{
        InitCommand=cmd(halign,0;x,SCREEN_WIDTH);
      };
    };
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_CENTER_X-404,SCREEN_CENTER_Y;);
  OffCommand=cmd(sleep,1;decelerate,1;x,SCREEN_CENTER_X);
  Def.Sprite{
    SetCommand=function(self, params)
      local song = GAMESTATE:GetCurrentSong();
      local MusicWheel = SCREENMAN:GetTopScreen("ScreenSelectMusic"):GetChild("MusicWheel");
      local group={};
      if MusicWheel:GetSelectedType() == 'WheelItemDataType_Song' then
        group = song:GetGroupName();
      elseif MusicWheel:GetSelectedType() == 'WheelItemDataType_Section' then
        group = getenv("getgroupname");
      end;
      if group==group_name[group] then
        local group_extender1 = group_name[group];
				local group_extender2 = group_extend[group_extender1];
				self:Load(THEME:GetPathG("","_hl/"..group_extender2..".png"))
      else
        self:Load(THEME:GetPathG("","_hl/light blue.png"));
      end;
    end;
    CurrentSongChangedMessageCommand=function(self,param)
      self:stoptweening():queuecommand("Set",params);
      --:stoptweening():cropright(1):decelerate(0.5):cropright(0)
    end;
  };
  LoadFont("_gotham book 30px")..{
    InitCommand=cmd(halign,0;x,-396;maxwidth,600;wrapwidthpixels,2^24;queuecommand,"Set";diffusealpha,0);
    SetCommand=function(self)
      local Song = GAMESTATE:GetCurrentSong()
      if Song then
        self:settext(Song:GetDisplayFullTitle())
      end;
    end;
    OffCommand=cmd(diffusealpha,1);
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
  };
  Def.Quad{
    InitCommand=cmd(x,-433;setsize,60,60;diffuse,color("0.3,0.3,0.3,1");diffusealpha,0);
    SetMessageCommand=function(self,param)
      local Song = GAMESTATE:GetCurrentSong()
      if Song then
        if Song:HasJacket() then
          self:LoadBackground(Song:GetJacketPath())
          self:diffuse(color("1,1,1,0"))
          self:setsize(60,60)
        else
          local group = Song:GetGroupName();
          if group_name[group] ~= nil then
            self:Load(THEME:GetPathG("","_jackets/group/"..group_name[group]..".png"))
            self:diffuse(color("1,1,1,0"))
            self:setsize(60,60)
          else
            self:Load(THEME:GetPathG("","Common fallback jacket"))
            self:diffuse(color("1,1,1,0"))
            self:setsize(60,60)
          end;
        end;
      else
        self:diffusealpha(0);
      end;
    end;
    OffCommand=cmd(diffusealpha,1);
    CurrentSongChangedMessageCommand=cmd(stoptweening;diffusealpha,0;queuecommand,"Set");
  };
  Def.Quad{
    InitCommand=cmd(x,-401;setsize,4,60;diffusealpha,0);
    SetCommand=function(self, param)
      local group = getenv("getgroupname");
      if group_name[group] ~= nil then
        self:diffuse(color(group_colors[group]))
        self:diffusealpha(1)
      else
        self:diffuse(color("1,1,1,1"))
      end;
    end;
    OffCommand=cmd(diffusealpha,1);
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
  }
};

t[#t+1] = Def.Quad{
  InitCommand=cmd(setsize,6,756;diffuse,color("0,0,0,0.5");xy,SCREEN_CENTER_X+60,SCREEN_CENTER_Y-4);
  OffCommand=cmd(sleep,1;decelerate,1;addx,-SCREEN_WIDTH);
};

t[#t+1] = LoadActor("base")..{
  InitCommand=cmd(Center;diffusealpha,0);
};

return t;
