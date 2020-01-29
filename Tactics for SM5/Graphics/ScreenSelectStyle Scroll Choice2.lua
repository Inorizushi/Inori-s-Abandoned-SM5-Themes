return Def.ActorFrame{
  LoadActor("ScreenSelect curspr.png")..{
    InitCommand=cmd(x,-10;horizalign,right;shadowlength,3;);
    OnCommand=cmd(bounce;effectmagnitude,-8,0,0;effectperiod,0.8);
		GainFocusCommand=cmd(visible,true;finishtweening);
		LoseFocusCommand=cmd(visible,false);
  };
  Def.BitmapText{
    Text="Two Players";
    Font="_FFT reg.ini";
    InitCommand=cmd(halign,0;zoomx,1.25);
    EnabledCommand=cmd(diffuse,color("1,1,1,1"));
    DisabledCommand=cmd(diffuse,color("0.5,0.5,0.5,1"));
  };
}
