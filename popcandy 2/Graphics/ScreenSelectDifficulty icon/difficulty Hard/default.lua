return Def.ActorFrame{
  LoadActor("icon")..{
    OnCommand=cmd(rotationz,180;zoom,0;sleep,0.4;bounceend,0.2;rotationz,0;zoom,1;);
    OffCommand=cmd(sleep,0.3;bouncebegin,0.2;rotationz,180;zoom,0;)
  }
}
