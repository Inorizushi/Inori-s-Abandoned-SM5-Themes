local t = Def.ActorFrame{
  LoadActor("../Professor.png")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-6,SCREEN_CENTER_Y-151);
    OnCommand=cmd(zoom,0;sleep,.3;linear,.2;zoom,1);
  };
  Def.BitmapText{
    Font="_FFT reg";
    Text="I can teach you about many different classes.\nWhich would you like to view?";
    InitCommand=cmd(x,SCREEN_CENTER_X-183;y,SCREEN_CENTER_Y-140;shadowlength,0;horizalign,left;zoomx,1.1;zoomy,1);
		OnCommand=cmd(cropright,1.2;sleep,0.6;linear,1;cropright,-.2);
		OffCommand=cmd(stoptweening;zoom,0);
  };
  Def.ActorFrame{
    OnCommand=cmd(x,SCREEN_CENTER_X-180;y,SCREEN_CENTER_Y+68;zoom,0;sleep,.2;linear,.2;zoom,1);
    OffCommand=cmd(linear,.2;zoom,0);
    LoadActor("menu");
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Menu";
      InitCommand=cmd(x,-80;y,-142;shadowlength,0;zoomx,1.25);
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(x,SCREEN_CENTER_X+123;y,SCREEN_CENTER_Y+120);
    OnCommand=cmd(zoom,0;sleep,.8;zoom,1);
    OffCommand=cmd(zoom,0);
    --[[LoadActor(GetClassShadow());
    LoadActor(GetClassAnimation());]]--
  };
};

return t;
