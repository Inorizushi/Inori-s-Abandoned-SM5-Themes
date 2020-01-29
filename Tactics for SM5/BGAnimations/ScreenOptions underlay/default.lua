local t = Def.ActorFrame{
  LoadActor("../Alazlam.png")..{
    InitCommand=cmd(x,SCREEN_CENTER_X-6;y,SCREEN_CENTER_Y-151);
    OnCommand=cmd(zoom,0;sleep,.4;linear,.2;zoom,1);
    OffCommand=cmd(linear,.2;zoom,0);
  };
  Def.ActorFrame{
    InitCommand=cmd(x,SCREEN_CENTER_X-145;y,SCREEN_CENTER_Y+63);
    OnCommand=cmd(zoom,0;sleep,.2;linear,.2;zoom,1);
    OffCommand=cmd(zoom,1;linear,.2;zoom,0);
    LoadActor("menu.png");
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Menu";
      InitCommand=cmd(x,-115;y,-137;zoomx,1.25);
    };
  };
  Def.BitmapText{
    Font="_FFT2 white";
    Text="Time";
    InitCommand=cmd(x,SCREEN_CENTER_X+145;y,SCREEN_CENTER_Y+180;shadowlength,0;zoom,0;);
    OnCommand=cmd(sleep,.2;zoom,1;zoomx,1.25);
  };
  LoadActor("status.png")..{
    InitCommand=cmd(x,SCREEN_CENTER_X+180;y,SCREEN_CENTER_Y-33);
    OnCommand=cmd(zoom,0;sleep,.2;linear,.2;zoom,1);
    OffCommand=cmd(linear,.2;zoom,0);
  };
};

return t;
