local t = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(CenterX;y,SCREEN_TOP;valign,0;setsize,SCREEN_WIDTH,88;diffuse,color("0,0,0,1"));
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor("Platform")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+173);
  };
};

return t;
