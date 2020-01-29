local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("_Customize");
  GainFocusCommand=function(s) MESSAGEMAN:Broadcast("ModeOpt") end;
};

return t;
