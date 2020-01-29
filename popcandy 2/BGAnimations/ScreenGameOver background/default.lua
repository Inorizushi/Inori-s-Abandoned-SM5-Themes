return Def.ActorFrame{
	LoadActor("back1")..{
    InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;FullScreen);
    OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w,h);
			self:texcoordvelocity(0,0.2);
		end;
  };
	LoadActor("back2")..{
		InitCommand=cmd(Center);
	};
	LoadActor("../star")..{
		InitCommand=cmd(zoom,0.25;xy,SCREEN_CENTER_X-192,SCREEN_CENTER_Y-112;spin);
	};
	LoadActor("../star")..{
		InitCommand=cmd(zoom,0.25;xy,SCREEN_CENTER_X+192,SCREEN_CENTER_Y+112;spin);
	};
};
