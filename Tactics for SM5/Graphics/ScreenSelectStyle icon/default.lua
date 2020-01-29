local gc = Var("GameCommand");
local string_name = gc:GetText()

local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame {
  LoadActor("../ScreenSelectStyle underlay.png");
  OnCommand=cmd(zoom,0;sleep,1.5;linear,.2;zoom,1;draworder,1);
  OffCommand=cmd(zoom,0);
};

return t;
