local t = Def.ActorFrame{
  LoadActor("back.avi")..{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
  };
}

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
    InitCommand=cmd(Center;scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
     OnCommand=function(self)
       if GAMESTATE:IsCourseMode() then
         self:Load(THEME:GetPathB("ScreenSelectMusic", "background/ScreenSelectMusic stage final"));
       else
         self:Load(THEME:GetPathB("ScreenSelectMusic", "background/ScreenSelectMusic stage " .. ToEnumShortString(sStage) ));
       end;
       self:diffusealpha(0.5)
       local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
       local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
       self:customtexturerect(0,0,w*0.7,h*0.7);
       self:texcoordvelocity(-0.05,0);
     end;
  };
};

local tRemapModel = {
	Stage_1st		= "green",
	Stage_2nd		= "blue",
	Stage_3rd		= "pink",
	Stage_4th		= "orange",
	Stage_5th		= "yellow",
	Stage_6th		= "purple",
  Stage_Event		= "green",
  Stage_Final		= "green",
  Stage_Extra1		= "red",
  Stage_Extra2		= "red",
};

t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathB("", "_popcandymodel/popcandy_" .. tRemapModel[sStage]))..{
    InitCommand=cmd(xy,SCREEN_CENTER_X+160,SCREEN_CENTER_Y+110;zoom,4.0;spin;effectmagnitude,0,75,0;);
  };
}

return t;
