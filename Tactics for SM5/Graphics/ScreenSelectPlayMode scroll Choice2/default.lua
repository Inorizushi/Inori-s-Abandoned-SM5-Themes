local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame{
  LoadActor("../ScreenSelect curspr.png")..{
    InitCommand=cmd(x,-5;y,-20;horizalign,right;shadowlength,3;);
    GainFocusCommand=cmd(visible,true;finishtweening);
    LoseFocusCommand=cmd(visible,false);
  };
  Def.BitmapText{
    Text="Dance";
    Font="_FFT2 white";
    InitCommand=cmd(halign,0.5;zoomx,1.25);
    GainFocusCommand=cmd(visible,true;finishtweening);
    LoseFocusCommand=cmd(visible,false);
  };
};

return t;
