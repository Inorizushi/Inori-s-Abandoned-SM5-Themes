local t = Def.ActorFrame{};

local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;

t[#t+1] = Def.ActorFrame{
  Def.Sprite{
	   InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
     OnCommand=function(self)
       self:Load(THEME:GetPathB("ScreenSelectMusic", "underlay/ScreenSelectMusic stage " .. ToEnumShortString(sStage) ));
       self:diffusealpha(0):linear(0.3):diffusealpha(1)
     end;
  };
};

return t;
