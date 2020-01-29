local gc = Var("GameCommand");
local string_name = gc:GetText()

local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame {
  LoadActor("difficulty " .. gc:GetName() );
};

return t;
