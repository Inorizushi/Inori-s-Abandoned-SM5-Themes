local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(zoom,0.25;xy,SCREEN_CENTER_X-90,SCREEN_BOTTOM-80);
  OnCommand=cmd(diffusealpha,0;addy,80;decelerate,0.5;addy,-80;diffusealpha,1);
  OffCommand=cmd(decelerate,0.5;addy,80;diffusealpha,0);
  Def.Sprite{
    GainFocusCommand=function(self)
      self:Load(THEME:GetPathG("","/ScreenSelectMode icon/_Game.png"))
      self:stoptweening():decelerate(0.5):y(-40)
    end;
    LoseFocusCommand=function(self)
      self:Load(THEME:GetPathG("","/ScreenSelectMode icon/_Game dark.png"))
      self:stoptweening():decelerate(0.5):y(0)
    end;
  };
  LoadActor("dot")..{
    InitCommand=cmd(diffusealpha,0.5;y,140);
    GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,0.5);
    LoseFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,0);
  };
};

return t;
