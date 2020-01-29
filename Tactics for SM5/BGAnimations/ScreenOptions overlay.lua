local t = Def.ActorFrame{
  Def.BitmapText{
    Name="Clock";
    Font="_FFT2 white";
    InitCommand=cmd(diffuse,color(0.9,0.9,1,1);xy,SCREEN_CENTER_X+145,SCREEN_CENTER_Y+203;shadowlength,0;horizalign,left;zoom,1.8;zoomy,1.2);
    OnCommand=cmd(diffusealpha,0;sleep,.4;diffusealpha,1);
  };
  Def.BitmapText{
    Name="Date";
    Font="_FFT reg";
    SetCommand=function(self)
      self:settext( string.format('Date: %02i/%02i/%04i', MonthOfYear()+1, DayOfMonth(), Year()) )
    end;
    InitCommand=cmd(x,SCREEN_CENTER_X+90;y,SCREEN_CENTER_Y-20;shadowlength,0;horizalign,left;zoom,1;zoomy,.8;playcommand,"Set");
    OnCommand=cmd(diffusealpha,0;sleep,.4;diffusealpha,1);
  };
  Def.BitmapText{
    Name="Header Text";
    Font="_FFT reg";
    Text="The secrets of the Service Menu are\nuncovered on this screen.";
    InitCommand=cmd(x,SCREEN_CENTER_X-183;y,SCREEN_CENTER_Y-140;shadowlength,0;horizalign,left;zoom,1.25;zoomy,1);
		OnCommand=cmd(cropright,1.2;sleep,.6;linear,1;cropright,-.2);
  }
};

local function Update(self)
	local clockDisp = self:GetChild("Clock");

	local hour = Hour();
	local minute = Minute();
	local sec = Second();
	clockDisp:settext( string.format('%02i:%02i:%02i', hour, minute, sec ));

end;

t.InitCommand=cmd(SetUpdateFunction,Update)

return t;
