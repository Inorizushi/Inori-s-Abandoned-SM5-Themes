local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("song.png")..{
    InitCommand=cmd(FullScreen;diffusealpha,0);
  };
};

t[#t+1] = LoadActor("deco/back/default.lua");

return t;
