return Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(setsize,WideScale(266,356),16;diffuse,color("1,0,0,1"));
    OnCommand=cmd(diffuseshift;effectcolor1,color("1,0,0,1");effectcolor2,color("0,0,0,1");effectperiod,2;effectclock,"beat");
  };
}
