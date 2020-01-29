return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","Common back"))..{
		StartTransitioningCommand=cmd(play);
	};
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1"));
		OnCommand=cmd(cropleft,1;fadeleft,0.5;linear,0.5;cropleft,-0.5;sleep,0.25);
	};
};
