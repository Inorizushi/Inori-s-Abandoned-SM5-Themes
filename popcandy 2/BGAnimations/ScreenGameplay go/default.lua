return Def.ActorFrame{
	LoadActor("go")..{
		Name="Main";
		InitCommand=cmd(Center;diffusealpha,0);
		OnCommand=cmd(rotationx,90;diffusealpha,0;linear,0.3;diffusealpha,.5;rotationx,0;sleep,0.9;linear,0.3;diffusealpha,0;rotationx,90;);
	};
	LoadActor("go")..{
		Name="Ghost1";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-100);
		OnCommand=cmd(rotationx,90;rotationz,90;diffusealpha,0;linear,0.3;diffusealpha,.5;rotationz,0;rotationx,0;y,SCREEN_CENTER_Y;sleep,0.9;linear,0.3;diffusealpha,0;y,SCREEN_CENTER_Y-100;rotationx,90;rotationz,-90;);
	};
	LoadActor("go")..{
		Name="Ghost2";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+100);
		OnCommand=cmd(rotationx,-90;rotationz,90;diffusealpha,0;linear,0.3;diffusealpha,.5;rotationz,0;rotationx,0;y,SCREEN_CENTER_Y;sleep,0.9;linear,0.3;diffusealpha,0;y,SCREEN_CENTER_Y+100;rotationx,90;rotationz,-90;);
	};
};
