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
    InitCommand=cmd(Center;spin;diffuse,0.9,0.9,1.0,1;effectmagnitude,0,0,-5;)
  };
  LoadActor("back3.png")..{
    InitCommand=cmd(Center;spin;effectmagnitude,0,125,0;);
  };
  LoadActor("back2.png")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X+130,SCREEN_CENTER_Y;);
    OnCommand=cmd(addy,512;linear,47;addy,-512;);
  };
  LoadActor("back4.png")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(diffusealpha,0;sleep,45;linear,0.5;diffusealpha,1;);
  };
};

return t;
