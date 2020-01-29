local t = LoadFallbackB()

t[#t+1] = LoadActor("explanation")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+72;draworder,2);
	OnCommand=cmd(addy,-120;linear,0.2;addy,120);
	OffCommand=cmd(linear,0.2;addy,-120);
};

return t
