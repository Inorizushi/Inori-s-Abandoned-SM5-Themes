local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	LoadActor("caution")..{
		InitCommand=cmd(Center;zoomx,0;zoomy,0.05);
		OnCommand=cmd(sleep,0.5;linear,0.1;zoomx,1;linear,0.1;zoomy,1);
		OffCommand=cmd(sleep,1);
	};
	LoadActor(THEME:GetPathS("","_Caution.ogg"))..{
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play)
	};
};

return t;
