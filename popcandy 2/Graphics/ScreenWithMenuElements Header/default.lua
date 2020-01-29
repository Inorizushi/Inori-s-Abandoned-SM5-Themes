local screenName = Var "LoadingScreen"
local headerTextImage

if screenName == "ScreenSelectMusic" then
  headerTextImage = "Music.png"
elseif screenName == "ScreenSelectCourse" then
  headerTextImage = "Course.png"

elseif screenName == "ScreenSelectDifficulty" then
  headerTextImage = "difficulty.png"

elseif screenName == "ScreenEvaluationNormal"
  or screenName == "ScreenEvaluationOni"
  or screenName == "ScreenEvaluationNonstop"
  or screenName == "ScreenNetEvaluation" then
	headerTextImage = "eval.png"

elseif screenName == "ScreenEvaluationSummary" then
  headerTextImage = "evalsummary.png"

else
  headerTextImage = "pop.png"
end;

--Base
local t = Def.ActorFrame{
  LoadActor("right")..{
    InitCommand=cmd(x,SCREEN_CENTER_X+244);
  };
  LoadActor("timer")..{
    InitCommand=cmd(x,SCREEN_LEFT;halign,0);
  };
}

if headerTextImage then
  table.insert(t,LoadActor(headerTextImage)..{
    InitCommand=function(self)
			self:x(SCREEN_CENTER_X+195)
    end;
  })
end;
return t;
