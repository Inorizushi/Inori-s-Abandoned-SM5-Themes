local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center);
  OnCommand=cmd(linear,0.2;addy,-SCREEN_HEIGHT);
  LoadActor("ScreenTitleMenu decorations/logo")..{
    OnCommand=cmd(y,-150;);
  };
  LoadActor("ScreenTitleMenu decorations/start")..{
    OnCommand=cmd(y,400);
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+SCREEN_HEIGHT);
  OnCommand=cmd(linear,0.2;addy,-SCREEN_HEIGHT);
  LoadActor(THEME:GetPathG("","ScreenSelectMode scroller/Game"));
  LoadActor("ScreenSelectMode decorations/arrows")..{
    InitCommand=cmd(blend,Blend.Add;diffusealpha,0.5);
  };
};

return t;
