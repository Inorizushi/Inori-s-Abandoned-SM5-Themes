local t = Def.ActorFrame{
  InitCommand=cmd(Center);
  Def.Quad{
    InitCommand=cmd(setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
  };
  LoadActor("logo1")..{
    OnCommand=cmd(diffusealpha,0;sleep,1;linear,0.5;diffusealpha,1;sleep,4;linear,0.5;diffusealpha,0;)
  };
  LoadActor("logo2")..{
    OnCommand=cmd(diffusealpha,0;sleep,6;linear,0.5;diffusealpha,1;sleep,4;linear,0.5;diffusealpha,0;)
  };
  LoadActor("logo3")..{
    OnCommand=cmd(diffusealpha,0;sleep,11;linear,0.5;diffusealpha,1;sleep,4;linear,0.5;diffusealpha,0;)
  };
};

return t;
