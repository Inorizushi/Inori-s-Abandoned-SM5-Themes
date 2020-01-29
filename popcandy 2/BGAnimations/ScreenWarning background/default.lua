return Def.ActorFrame{
  LoadActor("../ScreenLogo background");
  Def.Quad{
    InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0.5"));
  };
  LoadActor("warning")..{
    InitCommand=cmd(Center);
  }
}
