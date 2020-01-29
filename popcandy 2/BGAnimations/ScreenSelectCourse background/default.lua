local t = Def.ActorFrame{
  LoadActor("back.avi")..{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
  };
}

t[#t+1] = Def.ActorFrame{
  LoadActor("ScreenSelectMusic stage final")..{
	   InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
     OnCommand=function(self)
       self:diffusealpha(0.5)
       local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
       local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
       self:customtexturerect(0,0,w*0.7,h*0.7);
       self:texcoordvelocity(-0.05,0);
     end;
  };
};
return t;
