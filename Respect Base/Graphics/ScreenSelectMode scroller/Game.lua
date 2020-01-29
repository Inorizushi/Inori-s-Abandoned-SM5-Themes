local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("_Game");
  GainFocusCommand=function(s) MESSAGEMAN:Broadcast("ModeGame") end;
};

return t;
