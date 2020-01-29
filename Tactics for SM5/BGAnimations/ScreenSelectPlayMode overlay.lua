local t = Def.ActorFrame{
  Def.BitmapText{
    Font="_FFT2 white";
    Text="Time:";
    InitCommand=cmd(x,SCREEN_CENTER_X-210;y,SCREEN_CENTER_Y-202;horizalign,right;shadowlength,0);
    OnCommand=cmd(zoom,0;sleep,1;zoom,1.5;zoomx,1.8);
  }
}

return t;
