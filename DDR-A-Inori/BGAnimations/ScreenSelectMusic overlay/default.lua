local t = Def.ActorFrame{};

for pn in ivalues( GAMESTATE:GetHumanPlayers() ) do
  t[#t+1] = Def.ActorFrame{
    LoadActor("deco/diff/default.lua", pn);
    LoadActor("deco/radar/default.lua", pn);
  };
end;

t[#t+1] = StandardDecorationFromFileOptional( "GrooveRadarP1_Default", "GrooveRadarP1_Default" );
t[#t+1] = StandardDecorationFromFileOptional( "GrooveRadarP2_Default", "GrooveRadarP2_Default" );

t[#t+1] = Def.ActorFrame{
  LoadActor("deco/info/default.lua");
  LoadActor("deco/mode/default.lua");
};

if(GAMESTATE:GetCurrentStage()=='Stage_1st') or GAMESTATE:GetCurrentStageIndex()==0 or (GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2()) then
t[#t+1] = LoadActor("../_doors.lua")..{
  BeginCommand=cmd(playcommand,"Show");
  OnCommand=cmd(queuecommand,"AnimOff");
};
end;

return t;
