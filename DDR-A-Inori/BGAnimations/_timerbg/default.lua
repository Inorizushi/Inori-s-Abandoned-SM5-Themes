return Def.ActorFrame {
	InitCommand=function(self)
		self:x(-10);
		self:y(-20);
		--self:visible(PREFSMAN:GetPreference("MenuTimer"));
	end;
	LoadActor( "timerbg" )..{
		OnCommand=cmd(zoom,1.2;);
		OffCommand=cmd(linear,0.167;zoom,0);
	};
	LoadActor("timer_ov")..{
		OnCommand=cmd(playcommand,"Tick");
		TickCommand=cmd(diffusealpha,1;zoom,1.2;linear,0.4;diffusealpha,0;sleep,0.6;queuecommand,"Tick");
		OffCommand=cmd(stoptweening;linear,0.167;diffusealpha,0);
	};
	LoadActor("timer_ov")..{
		OnCommand=cmd(playcommand,"Tick");
		TickCommand=cmd(diffusealpha,1;zoom,1.2;linear,0.4;zoom,1.2;diffusealpha,0;sleep,0.6;queuecommand,"Tick");
		OffCommand=cmd(stoptweening;linear,0.167;diffusealpha,0);
	};
}