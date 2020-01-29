local t = Def.ActorFrame{
  OffCommand=function(self) SOUND:DimMusic(0,math.huge) end,
};

t[#t+1] = LoadActor(THEME:GetPathS("","_StyleOut"))..{
  OffCommand=cmd(sleep,0.2;queuecommand,"Play");
  PlayCommand=cmd(play)
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-SCREEN_HEIGHT);
  OffCommand=cmd(linear,0.2;addy,SCREEN_HEIGHT;sleep,1);
  LoadActor("stripes 1");
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+SCREEN_HEIGHT);
  OffCommand=cmd(linear,0.2;addy,-SCREEN_HEIGHT);
  LoadActor("stripes 2");
};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(FullScreen;diffusealpha,0);
    Style1PMessageCommand=function(self)
      self:diffuse(color("0.5,1,1,0"))
    end;
    Style2PMessageCommand=function(self)
      self:diffuse(color("0,0.5,1,0"))
    end;
    StyleDPMessageCommand=function(self)
      self:diffuse(color("1,0,0,0"))
    end;
    OffCommand=cmd(sleep,0.5;linear,0.4;diffusealpha,0.5);
  };
};

t[#t+1] = Def.Sprite{
  InitCommand=cmd(Center;diffusealpha,0);
  Style1PMessageCommand=function(self)
    self:Load(THEME:GetPathG("","ScreenSelectStyle scroller/_1P"))
  end;
  Style2PMessageCommand=function(self)
    self:Load(THEME:GetPathG("","ScreenSelectStyle scroller/_2P"))
  end;
  StyleDPMessageCommand=function(self)
    self:Load(THEME:GetPathG("","ScreenSelectStyle scroller/_DP"))
  end;
  OffCommand=cmd(zoom,3.2;diffusealpha,0;sleep,0.198;linear,0.132;diffusealpha,1;zoom,0.6;linear,0.033;zoom,1);
};

t[#t+1] = Def.Quad{
  InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1");diffusealpha,0);
  OffCommand=cmd(sleep,1.75;linear,0.5;diffusealpha,1;)
}

t[#t+1] = Def.ActorFrame{

}

return t;
