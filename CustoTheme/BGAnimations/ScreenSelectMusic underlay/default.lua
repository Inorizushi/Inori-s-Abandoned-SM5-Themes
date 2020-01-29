local t = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(FullScreen);
    SetCommand=function(self, params)
			local group = getenv("getgroupname");
		    if group_name[group] ~= nil then
          self:diffuse(color(group_color[group]));
        else
          self:diffuse(color("#000000"));
        end;
		end;
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
  };
  LoadActor("lol text (doubleres)")..{
    InitCommand=cmd(FullScreen;blend,Blend.Add;diffusealpha,0.2);
    OnCommand=cmd(queuecommand,"Animate");
    AnimateCommand=function(self)
      local timing = math.random(1,3);
      local timing2 = math.random(0.5,3);
      self:finishtweening():diffusealpha(0):sleep(timing):linear(0.1):diffusealpha(0.2):linear(0.05):diffusealpha(0):linear(0.1):diffusealpha(0.2):linear(timing2):diffusealpha(0):queuecommand("Animate")
    end;
  };
  LoadActor("musicwheel backer (doubleres)")..{
    InitCommand=cmd(FullScreen);
  };
  LoadActor("musicwheel backer (doubleres)")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(queuecommand,"Animate");
    AnimateCommand=function(self)
      local timing = math.random(1,3);
      self:finishtweening():x(SCREEN_CENTER_X):sleep(timing):linear(0.02):x(SCREEN_CENTER_X+2):diffuse(color("0,0,0,1")):linear(0.02):x(SCREEN_CENTER_X):diffuse(color("1,1,1,1")):linear(0.02):x(SCREEN_CENTER_X-2):diffuse(color("0,0,0,1")):linear(0.02):x(SCREEN_CENTER_X):diffuse(color("1,1,1,1")):queuecommand("Animate")
    end;
  };
  LoadActor("underlay (doubleres)")..{
    InitCommand=cmd(FullScreen);
  };
  Def.Sprite{
    InitCommand=cmd(FullScreen);
    SetCommand=function(self, params)
			local group = getenv("getgroupname");
		  local song = GAMESTATE:GetCurrentSong();
      if song then
        self:Load(THEME:GetPathB("","ScreenSelectMusic underlay/underlay music (doubleres)"))
      elseif group then
        self:Load(THEME:GetPathB("","ScreenSelectMusic underlay/underlay group (doubleres)"))
      else
        return
      end;
		end;
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
  }
};

return t;
