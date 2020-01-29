local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("_2P");
  GainFocusCommand=function(s) MESSAGEMAN:Broadcast("Style2P") end;
};

return t;
