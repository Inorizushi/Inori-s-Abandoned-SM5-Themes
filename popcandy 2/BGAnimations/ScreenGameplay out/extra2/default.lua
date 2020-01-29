-- extra stage 2
-- todo: stars, after I figure out if it's ok

return Def.ActorFrame{
	StartTransitioningCommand=cmd(visible,GAMESTATE:GetEarnedExtraStage() == 'EarnedExtraStage_Extra2');

	LoadActor("../_extra")..{
		StartTransitioningCommand=function(self)
			if GAMESTATE:GetEarnedExtraStage() == 'EarnedExtraStage_Extra1' then
				self:play()
			end
		end;
	};

	LoadActor("../../star")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(zoom,0;sleep,1;rotationz,0;linear,1;rotationz,-1280;zoom,10;);
	};
	LoadActor("extra")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0;zoom,10;linear,0.5;rotationz,1800;zoom,1;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0);
	};
	LoadActor("../../star")..{
		InitCommand=cmd(Center;diffuse,color("0,0,0,1"));
		OnCommand=cmd(zoom,0;sleep,3.7;rotationz,0;linear,0.3;rotationz,-1000;zoom,3;);
	};
};
