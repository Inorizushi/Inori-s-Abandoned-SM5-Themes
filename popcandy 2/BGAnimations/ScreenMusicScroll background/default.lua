local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("back1")..{
    InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;FullScreen);
    OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w,h);
			self:texcoordvelocity(0,0.1);
		end;
  };
  LoadActor("../star.png")..{
    InitCommand=cmd(Center;spin;effectmagnitude,0,0,-5;diffuse,color("1,0.9,0.9,1"))
  };
  LoadActor("back2.png")..{
    InitCommand=cmd(x,SCREEN_CENTER_X+180;y,SCREEN_CENTER_Y+180;bob;effectmagnitude,0,20,0);
  };
  LoadActor(THEME:GetPathG("","ScreenLogo Logo"))..{
    InitCommand=cmd(Center);
    OnCommand=cmd(spin;effectmagnitude,0,125,0;);
  };
};

return t;
