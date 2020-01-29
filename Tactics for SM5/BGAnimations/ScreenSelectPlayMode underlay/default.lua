local t = Def.ActorFrame{
  Def.Sprite{
    Texture = "down 1x4.png";
    InitCommand=cmd(x,SCREEN_CENTER_X-30;y,SCREEN_CENTER_Y-4;SetAllStateDelays,0.15);
  };
}

return t;
