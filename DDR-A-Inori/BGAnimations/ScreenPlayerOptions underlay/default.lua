local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(s) s:diffuse(color("0,0,0,0")):FullScreen() end,
		OnCommand=function(s) s:diffusealpha(0):sleep(0.2):linear(0.2):diffusealpha(0.5) end,
		OffCommand=function(s) s:linear(0.2):diffusealpha(0) end,
	};
};

if GAMESTATE:IsHumanPlayer(PLAYER_1) then
	t[#t+1] = LoadActor("options.lua",PLAYER_1);
end;

if GAMESTATE:IsHumanPlayer(PLAYER_2) then
	t[#t+1] = LoadActor("options.lua",PLAYER_2);
end;

--[[
if GAMESTATE:IsHumanPlayer(PLAYER_1) then
	t[#t+1] = LoadActor("options p1.lua");
end;

if GAMESTATE:IsHumanPlayer(PLAYER_2) then
	t[#t+1] = LoadActor("options p2.lua");
end;]]

return t;
