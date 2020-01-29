return Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,120;diffusealpha,0.25);
  };
  LoadActor("demonstration")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-40;diffuseblink;effectperiod,1);
  };
  LoadActor("gameover")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+40;diffuseblink;effectperiod,1);
  };
}
