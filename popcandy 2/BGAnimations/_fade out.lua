local t = Def.ActorFrame{
  LoadActor("_fadetest")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(rotationz,0;zoom,0;linear,0.3;rotationz,90;zoom,150;);
  };
  LoadActor("star.png")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(diffuse,color("0.5,0.5,0.5,1");zoom,0;rotationz,0;linear,0.3;zoom,3;rotationz,360;diffuse,color("0,0,0,1"));
  };
};

return t;
