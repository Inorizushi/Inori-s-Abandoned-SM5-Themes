return Def.ActorFrame{
  LoadActor("_shared background.png")..{
    InitCommand=cmd(Center;zoom,2);
    OnCommand=cmd(linear,0.3;zoom,1);
  };
}
