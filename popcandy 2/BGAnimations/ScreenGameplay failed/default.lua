local t = Def.ActorFrame{
	Def.Actor{
		OnCommand=cmd(sleep,6);
	};
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1"));
		OnCommand=cmd(diffusealpha,0;linear,0.2;diffusealpha,1);
	};
	LoadActor("crash")..{
		StartTransitioningCommand=cmd(play);
	};
	LoadActor("failed1")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-108);
		OnCommand=cmd(addy,-240;linear,0.2;addy,240;vibrate;effectmagnitude,4,8,8;sleep,0.5;diffusealpha,0;);
	};
	LoadActor("failed1")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-108);
		OnCommand=cmd(diffusealpha,0;sleep,0.7;diffusealpha,1;);
	};
	LoadActor("failed2")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+108);
		OnCommand=cmd(addy,240;linear,0.2;addy,-240;vibrate;effectmagnitude,4,8,8;sleep,0.5;diffusealpha,0;);
	};
	LoadActor("failed2")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+108);
		OnCommand=cmd(diffusealpha,0;sleep,0.7;diffusealpha,1;);
	};
	LoadActor("../star")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffuse,color("0,0,0,0");sleep,4;diffuse,color("0,0,0,1");zoom,0;rotationz,0;linear,0.3;rotationz,-1000;zoom,3;)
	};
	LoadActor("failed3")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0;sleep,2;linear,2;diffusealpha,1;sleep,1;linear,0.5;diffusealpha,0;);
	};

};

return t
