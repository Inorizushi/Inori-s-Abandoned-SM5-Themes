local x = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1");linear,0.3;diffusealpha,0);
  };
  LoadActor("stagetemp/loadf_0u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-128);
  };
  LoadActor("stagetemp/loadf_0d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+128);
  };
  LoadActor("stagetemp/loadf_1u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-148);
  };
  LoadActor("stagetemp/loadf_1d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+148);
  };
  LoadActor("stagetemp/loadf_3u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-208);
  };
  LoadActor("stagetemp/loadf_3d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+208);
  };
  LoadActor("stagetemp/loadf_2u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-112);
  };
  LoadActor("stagetemp/loadf_2d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+112);
  };
  LoadActor("stagetemp/box.txt")..{
    InitCommand=cmd(effectmagnitude,0,100,0;CenterY;x,SCREEN_CENTER_X-136;z,16);
  };
  LoadActor("stagetemp/box.txt")..{
    InitCommand=cmd(effectmagnitude,0,100,0;CenterY;x,SCREEN_CENTER_X+136;z,16);
  };
  LoadActor("stagetemp/loadf_4c")..{
    InitCommand=cmd(Center;rainbow,true);
  };
};

x[#x+1] = Def.Actor {
  BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToLoad() then self:sleep(0); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;
