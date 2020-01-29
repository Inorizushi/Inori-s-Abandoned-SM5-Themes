local t = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(y,13;);
		Def.SongMeterDisplay{
			InitCommand=cmd(SetStreamWidth,168);
			Stream=LoadActor("meter stream");
			Tip=LoadActor("tip");
		};
	};
};

return t;
