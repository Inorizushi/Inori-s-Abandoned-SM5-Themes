local t = Def.ActorFrame{
  LoadActor("_doors/_close.lua");
  LoadActor(THEME:GetPathS("","_Decide"))..{
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play)
	};
  StartTransitioningCommand=function(self) SOUND:DimMusic(0,math.huge) end,
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,10;y,-160;rotationz,8;zoom,1.3);
  Def.ActorFrame{
    InitCommand=cmd(CenterY;x,SCREEN_CENTER_X-SCREEN_WIDTH);
    OnCommand=cmd(finishtweening;sleep,0.5;linear,0.4;x,SCREEN_CENTER_X-100;linear,4;x,SCREEN_CENTER_X);
    LoadActor("_doors/PLAY")..{
      OnCommand=cmd(finishtweening;sleep,2;
      addx,-5;addy,-4;sleep,0.1;addx,5;addy,4;sleep,0.5;
      addx,4;addy,6;sleep,0.1;addx,-4;addy,-6;sleep,0.3;
      addx,-2;addy,4;sleep,0.1;addx,2;addy,-4;sleep,0.8;
      addx,-8;addy,-6;sleep,0.1;addx,8;addy,6;sleep,0.1;
      addx,-8;addy,6;sleep,0.1;addx,8;addy,-6;sleep,0.2;);
    };
    LoadActor("_doors/PLAY");
  }
};

return t;
