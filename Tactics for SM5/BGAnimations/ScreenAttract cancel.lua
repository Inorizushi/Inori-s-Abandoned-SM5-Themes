return Def.ActorFrame{
  LoadActor("_fade out normal.lua");
  LoadActor(THEME:GetPathS("","_Common coin.ogg"))..{
    StartTransitioningCommand=cmd(play);
  };
  Def.Actor{
    StartTransitioningCommand=cmd(sleep,1.5);
  };
}
