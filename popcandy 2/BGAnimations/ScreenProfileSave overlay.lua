local x = Def.ActorFrame{
  LoadActor("stagetemp/loadingframe2")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y+60);
  };
  LoadActor("stagetemp/loadingframe1")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y-158);
  };
  LoadFont("_shared1")..{
    Text="Saving...";
    InitCommand=cmd(halign,0;valign,1;xy,SCREEN_LEFT+5,SCREEN_BOTTOM-10);
    OnCommand=cmd(diffusealpha,0;smooth,0.2;diffusealpha,0.8;sleep,0.4;;);
		OffCommand=cmd(smooth,0.3;diffusealpha,0;);
  };
};

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(1); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;
