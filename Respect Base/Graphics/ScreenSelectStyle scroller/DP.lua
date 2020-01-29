local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("_DP");
  GainFocusCommand=function(s) MESSAGEMAN:Broadcast("StyleDP") end;
};

return t;
