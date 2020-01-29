local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("Background")..{
    InitCommand=cmd(Center)
  }
}

return t;
