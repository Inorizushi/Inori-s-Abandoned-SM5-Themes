local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("_Options");
  GainFocusCommand=function(s) MESSAGEMAN:Broadcast("ModeOpt") end;
};

return t;
