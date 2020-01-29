return Def.ActorFrame{
  LoadActor("_shared background.png")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(sleep,0.5;zoom,0);
  };
  LoadActor("Alazlam.png")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-6,SCREEN_CENTER_Y-151);
    OnCommand=cmd(linear,0.2;zoom,0);
  };
  Def.Quad{
    InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1"));
    OnCommand=cmd(diffuseleftedge,color("0,0,0,0");diffuserightedge,color("0,0,0,0");diffusetopedge,color("0,0,0,0");diffusebottomedge,color("0,0,0,0");linear,.5;diffuseleftedge,color("0,0,0,1");diffuserightedge,color("0,0,0,1");diffusetopedge,color("0,0,0,1");diffusebottomedge,color("0,0,0,1"))
  };
}
