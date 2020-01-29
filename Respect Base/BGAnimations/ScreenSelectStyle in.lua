local t = Def.ActorFrame{};

t[#t+1] = Def.Actor{
  OnCommand=cmd(sleep,1);
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
