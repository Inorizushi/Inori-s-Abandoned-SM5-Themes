local t = Def.ActorFrame{
  LoadActor(THEME:GetPathB("","ScreenLogo overlay/logo"))..{
    InitCommand=cmd(CenterX;y,_screen.cy-74;zoom,0.86);
  };
  LoadActor(THEME:GetPathB("","ScreenLogo overlay/copyright"))..{
    InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-48;zoom,0.8);
  };
  Def.BitmapText{
    Font="_futura pt medium 30px";
    InitCommand=cmd(settext,"MDX:J:A:A:2018102200";halign,0;xy,SCREEN_LEFT+8,SCREEN_TOP+15;zoomx,0.62;zoomy,0.6;strokecolor,color("0,0,0,0.5"));
  };
};

return t;
