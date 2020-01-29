local t = Def.ActorFrame{};

t[#t+1] = Def.Quad{
  InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1"));
  OnCommand=cmd(sleep,0.1;linear,0.4;diffusealpha,0;sleep,1);
}

--[[t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+SCREEN_HEIGHT);
  OnCommand=cmd(linear,0.2;addy,-SCREEN_HEIGHT);
  LoadActor(THEME:GetPathG("","ScreenSelectStyle scroller/1P"));
  LoadActor("ScreenSelectMode decorations/arrows")..{
    InitCommand=cmd(blend,Blend.Add;diffusealpha,0.5);
  };
};]]--

return t;
