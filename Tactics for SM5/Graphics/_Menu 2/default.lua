local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("Edit Charts")..{
    InitCommand=cmd(halign,0);
    GainFocusCommand=cmd(diffuse,color("1,1,1,1"));
    LoseFocusCommand=cmd(diffuse,color("0.4,0.5,0.6,1"));
  };
};

return t;
