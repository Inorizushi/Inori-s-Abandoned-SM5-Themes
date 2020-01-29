local t = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-30;);
		OnCommand=cmd(queuecommand,"TweenOn");
		OffCommand=cmd(queuecommand,"TweenOff");
		TweenOnCommand=cmd(addy,100;decelerate,1;addy,-100);
		-- xxx: if any player full comboed, sleep 3
		TweenOffCommand=cmd(decelerate,0.3;addy,-20;accelerate,0.7;addy,120);
		Def.SongMeterDisplay{
			InitCommand=cmd(SetStreamWidth,168);
			Stream=LoadActor("meter stream");
			Tip=LoadActor("tip");
		};
	};
};

return t;
