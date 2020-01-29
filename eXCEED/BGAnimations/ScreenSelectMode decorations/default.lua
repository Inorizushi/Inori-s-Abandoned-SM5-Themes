return Def.ActorFrame{
  LoadActor(THEME:GetPathB("","_common/top.png"))..{
    InitCommand=cmd(CenterX;y,SCREEN_TOP+64);
    OnCommand=cmd(addy,-64;linear,0.3;addy,64);
    OffCommand=cmd(linear,0.3;addy,-64;diffusealpha,0);
  };
};
