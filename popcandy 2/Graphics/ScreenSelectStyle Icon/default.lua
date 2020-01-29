local gc = Var("GameCommand");
local string_name = gc:GetText()

local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame {
  GainFocusCommand=cmd(glowshift;effectperiod,0.5);
  LoseFocusCommand=cmd(stopeffect);
  DisabledCommand=cmd(diffuse,color("0.2,0.2,0.2,1"));
  EnabledCommand=cmd(diffuse,color("1,1,1,1"));

  LoadActor("icon " .. gc:GetName() );
};

return t;
