local t = Def.ActorFrame{
  LoadActor("_doors/_open.lua");
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,10;y,-160;rotationz,8;zoom,1.3);
  Def.ActorFrame{
    InitCommand=cmd(CenterY;x,SCREEN_CENTER_X);
    OnCommand=cmd(finishtweening;linear,0.4;x,SCREEN_CENTER_X+SCREEN_WIDTH);
    LoadActor("_doors/ENTRY");
  };
};

return t;
