local screenName = Var "LoadingScreen"


local t = Def.ActorFrame{
};

if screenName == "ScreenSelectStyle" or screenName == "ScreenSelectPlayMode" or screenName == "ScreenSelectGameMode" then
t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathG("","_footer/con-sel.png"));
};
end

if screenName == "ScreenSelectMusic" or screenName == "ScreenSelectMusicExtra" or screenName == "ScreenSelectMusicStarter" then
t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathG("","_footer/MusSel.lua"));
};
end

if screenName == "ScreenEvaluationNormal" or screenName == "ScreenEvaluationSummary" or screenName == "ScreenEvaluationOni" or screenName == "ScreenEvaluationNonstop" or screenName == "ScreenNetEvaluation"  then
t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathG("","_footer/skip.lua"));
};
end

return t;
