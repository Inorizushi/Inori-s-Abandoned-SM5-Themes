local t = Def.ActorFrame{
  LoadActor("_fadetest")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(rotationz,90;zoom,150;linear,0.3;rotationz,0;zoom,0;);
  };
  LoadActor("star.png")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(diffuse,color("0.5,0.5,0.5,1");zoom,1;rotationz,360;linear,0.3;zoom,0;rotationz,0;diffuse,color("0,0,0,1"));
  };
};

return t;
