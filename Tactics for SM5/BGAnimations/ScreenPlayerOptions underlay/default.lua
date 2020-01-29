local t = Def.ActorFrame{};

local screen = SCREENMAN:GetTopScreen();

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(y,SCREEN_CENTER_Y+35;sleep,.2;linear,.5;addy,-275);
  OffCommand=function(self)
    self:finishtweening()
    if SCREENMAN:GetTopScreen():GetNextScreenName() == 'ScreenGameplay' then
      self:zoom(0)
    end;
  end;
  LoadActor("ScreenOptions underlay")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+109);
  }
};

t[#t+1] = LoadActor("start")..{
  InitCommand=cmd(x,SCREEN_CENTER_X+5;y,SCREEN_CENTER_Y+217;zoom,0);
  OnCommand=cmd(diffuse,color("0,0,0,1");sleep,.7;zoom,1;linear,.6;diffuse,color("1,1,1,1");sleep,.2;diffuse,color("0,0,0,1"));
  OffCommand=cmd(finishtweening;zoom,0);
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-357;sleep,.2;linear,.5;y,SCREEN_CENTER_Y-102);
  OffCommand=function(self)
    self:finishtweening()
    if SCREENMAN:GetTopScreen():GetNextScreenName() == 'ScreenGameplay' then
      self:zoom(0)
    end;
  end;
  LoadActor("frame.png")..{
    InitCommand=cmd(x,140);
  };
  LoadActor("class banner frame.png")..{
    InitCommand=cmd(x,-218;y,54;align,1,1);
  };
}

--[[t[#t+1] = Def.BitmapText{
  Font="_FFT2 white";
  Text="BPM And Rate";
  InitCommand=cmd(x,SCREEN_CENTER_X-301;y,SCREEN_CENTER_Y+112-130;shadowlength,0;horizalign,left;zoomx,0;sleep,.8;zoomx,1.25;queuecommand,"Update");
  OnCommand=cmd(queuecommand,"Update");
  OffCommand=cmd(visible,false);
  RateModChangedMessageCommand=cmd(queuecommand,"Update");
  UpdateCommand=function(self)
  end;
}]]--

return t;
