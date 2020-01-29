local gc = Var("GameCommand");
local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_Menu",gc:GetName() ))..{
		DisabledCommand=cmd(diffuse,color("0,0,0,0"));
		EnabledCommand=cmd(diffuse,color("1,1,1,1"));
	};
};

return t;
