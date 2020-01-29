return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_difficulty","cursor/shadow"))..{
		OnCommand=cmd(xy,5,5;diffuse,color("0,0,0,1");diffusealpha,0;zoom,4;linear,0.3;diffusealpha,1;zoom,1;);
		OffCommand=cmd(sleep,0.2;linear,0.3;diffusealpha,0);
		ChooseCommand=cmd(sleep,0.2;linear,0.2;diffusealpha,0);
	};
		LoadActor(THEME:GetPathG("_difficulty","cursor/cursor P2"))..{
		OnCommand=cmd(diffusealpha,0;zoom,4;linear,0.3;diffusealpha,1;zoom,1;glowshift;effectperiod,0.5);
		OffCommand=cmd(linear,0.3;zoom,0);
		ChooseCommand=cmd(stopeffect;sleep,0.3;linear,0.3;addx,10;addy,10);
	};
	LoadActor(THEME:GetPathG("_difficulty","cursor/ok"))..{
	OnCommand=cmd(draworder,20;diffusealpha,0;);
	ChooseCommand=cmd(diffusealpha,1;zoom,2;linear,0.2;diffusealpha,1;zoom,1);
	OffCommand=cmd(sleep,0.2;linear,0.3;zoom,0);
};
};
