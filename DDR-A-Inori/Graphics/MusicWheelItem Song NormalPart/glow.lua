local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("card cursor.png")..{
  AnimCommand=cmd(finishtweening;zoom,1.2;diffusealpha,0;sleep,0;diffusealpha,1;linear,0.3;diffusealpha,0;zoom,1;sleep,2;queuecommand,"Anim");
  };
};

return t;
