return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(sleep,0.8);
	};
};
