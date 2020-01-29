local t = Def.ActorFrame{};

t[#t+1] = Def.Quad{
  InitCommand=cmd(FullScreen;diffuse,color("0.5,1,1,0.5"));
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center);
  LoadActor("arrows")..{
    InitCommand=cmd(blend,Blend.Add;diffusealpha,0.25);
  };
  LoadActor(THEME:GetPathG("","ScreenSelectMode scroller/_Game.png"));
}

return t;
