local t = Def.ActorFrame{
  LoadActor("background")..{
    InitCommand=cmd(Center);
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,SCREEN_CENTER_X-30;y,SCREEN_CENTER_Y+7);
  LoadActor("City.png")..{
    OnCommand=cmd(diffuseshift;effectperiod,2;effectcolor1,color("0.5,0.5,0.5,1");effectcolor2,color("1,1,1,1"));
  };
  LoadActor("shadow")..{
    InitCommand=cmd(xy,-2,5);
  };
  LoadActor("shadow")..{
    InitCommand=cmd(xy,-2,5);
    OnCommand=cmd(zoom,2;diffuseshift;effectperiod,2;effectcolor1,color("1,1,1,.5");effectcolor2,color("1,1,1,0.2"))
  };
}

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,SCREEN_CENTER_X-204;y,SCREEN_CENTER_Y-61);
  LoadActor("City.png")..{
    OnCommand=cmd(diffuseshift;effectperiod,2;effectcolor1,color("0.5,0.5,0.5,1");effectcolor2,color("1,1,1,1"));
  };
  LoadActor("shadow")..{
    InitCommand=cmd(xy,-2,5);
  };
  LoadActor("shadow")..{
    InitCommand=cmd(xy,-2,5);
    OnCommand=cmd(zoom,2;diffuseshift;effectperiod,2;effectcolor1,color("1,1,1,.5");effectcolor2,color("1,1,1,0.2"))
  };
}

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,SCREEN_CENTER_X+38;y,SCREEN_CENTER_Y+177);
  LoadActor("City.png")..{
    OnCommand=cmd(diffuseshift;effectperiod,2;effectcolor1,color("0.5,0.5,0.5,1");effectcolor2,color("1,1,1,1"));
  };
  LoadActor("shadow")..{
    InitCommand=cmd(xy,-2,5);
  };
  LoadActor("shadow")..{
    InitCommand=cmd(xy,-2,5);
    OnCommand=cmd(zoom,2;diffuseshift;effectperiod,2;effectcolor1,color("1,1,1,.5");effectcolor2,color("1,1,1,0.2"))
  };
}

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y-5);
  LoadActor("City.png")..{
    OnCommand=cmd(diffuseshift;effectperiod,2;effectcolor1,color("0.5,0.5,0.5,1");effectcolor2,color("1,1,1,1"));
  };
  LoadActor("shadow")..{
    InitCommand=cmd(xy,-2,5);
  };
  LoadActor("shadow")..{
    InitCommand=cmd(xy,-2,5);
    OnCommand=cmd(zoom,2;diffuseshift;effectperiod,2;effectcolor1,color("1,1,1,.5");effectcolor2,color("1,1,1,0.2"))
  };
}

return t;
