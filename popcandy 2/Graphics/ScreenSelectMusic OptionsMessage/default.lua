return Def.ActorFrame{
	LoadActor("_message")..{
		InitCommand=cmd(pause);
		OnCommand=cmd(zoomy,0);
		ShowPressStartForOptionsCommand=cmd(rotationz,-180;zoom,0;linear,0.25;zoom,1;rotationz,0;sleep,1;linear,0.25;zoom,0;rotationz,180);
		ShowEnteringOptionsCommand=cmd(setstate,1;);
		OffCommand=cmd(linear,0.25;zoomy,0);
	};
};
