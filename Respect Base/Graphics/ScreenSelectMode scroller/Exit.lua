local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("_Exit");
  GainFocusCommand=function(s) MESSAGEMAN:Broadcast("ModeExit") end;
};

return t;
