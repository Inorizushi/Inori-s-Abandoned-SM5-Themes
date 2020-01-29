local t = Def.ActorFrame {};

local instructionPage = "normal"

if GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then instructionPage = "nonstop"
elseif GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then instructionPage = "oni"
end

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_instructions/"..instructionPage))..{
		InitCommand=cmd(x,SCREEN_LEFT-SCREEN_CENTER_X;CenterY;);
		OnCommand=cmd(decelerate,0.3;CenterX);
		OffCommand=cmd(accelerate,0.3;x,SCREEN_RIGHT+SCREEN_CENTER_X);
	};
};

return t;
