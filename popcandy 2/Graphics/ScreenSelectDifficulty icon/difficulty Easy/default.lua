return Def.ActorFrame{
  LoadActor("icon")..{
    OnCommand=cmd(rotationz,180;zoom,0;sleep,0.2;bounceend,0.2;rotationz,0;zoom,1;);
    OffCommand=cmd(sleep,0.1;bouncebegin,0.2;rotationz,180;zoom,0;)
  }
}
