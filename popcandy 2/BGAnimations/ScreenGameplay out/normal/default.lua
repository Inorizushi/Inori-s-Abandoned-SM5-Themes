-- normal and rave are handled in normal/default.lua
-- extra stages are in extra1 and extra2.

local t = Def.ActorFrame{
};

t[#t+1] = Def.ActorFrame{
	LoadActor("../../star")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(zoom,0;sleep,1;rotationz,0;linear,1;rotationz,-1280;zoom,10;);
	};
	LoadActor("cleared")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0;sleep,1;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0);
	};
	LoadActor("../../star")..{
		InitCommand=cmd(Center;diffuse,color("0,0,0,1"));
		OnCommand=cmd(zoom,0;sleep,3.7;rotationz,0;linear,0.3;rotationz,-1000;zoom,3;);
	};
};

return t
