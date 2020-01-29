local style = Var("GameCommand"):GetName()

return Def.ActorFrame{
  InitCommand=cmd(zbuffer,true);
  LoadActor(style);
};
