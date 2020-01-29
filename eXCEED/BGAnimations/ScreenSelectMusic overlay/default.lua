return LoadActor("bb_1")..{
  InitCommand=cmd(xy,_screen.cx,_screen.cy+178);
  OnCommand=cmd(draworder,200;diffusealpha,0;sleep,0.49;linear,0.2;diffusealpha,1;);
}
