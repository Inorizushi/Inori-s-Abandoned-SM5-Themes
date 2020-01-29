local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("_1P");
  GainFocusCommand=function(s) MESSAGEMAN:Broadcast("Style1P") end;
};

return t;
