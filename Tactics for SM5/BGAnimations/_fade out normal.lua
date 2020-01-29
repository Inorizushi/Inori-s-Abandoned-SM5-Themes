return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1"));
		OnCommand=cmd(diffuseleftedge,color("0,0,0,0");diffuserightedge,color("0,0,0,0");
    diffusetopedge,color("0,0,0,0");diffusebottomedge,color("0,0,0,0");linear,.5;
    diffuseleftedge,color("0,0,0,1");diffuserightedge,color("0,0,0,1");
    diffusetopedge,color("0,0,0,1");diffusebottomedge,color("0,0,0,1"));
	};
}
