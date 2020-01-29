local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("#dd3232");cropright,1);
    OnCommand=cmd(finishtweening;sleep,2.4;linear,0.2;cropright,0;sleep,3);
  };
  Def.ActorFrame{
    InitCommand=cmd(x,10;y,-120;zoom,1.3;rotationz,12);
    LoadActor(THEME:GetPathB("","_doors/top base"))..{
      InitCommand=cmd(Center;addy,-200);
      OnCommand=cmd(finishtweening;sleep,2.4;linear,0.1;addy,200);
    };
    LoadActor(THEME:GetPathB("","_doors/topper"))..{
      InitCommand=cmd(Center);
      OnCommand=cmd(finishtweening;cropright,1;sleep,2.4;sleep,0.2;linear,0.5;cropright,0);
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(x,10;y,-120;zoom,1.3;rotationz,8);
    LoadActor(THEME:GetPathB("","_doors/bottom base"))..{
      InitCommand=cmd(Center;addy,200);
      OnCommand=cmd(finishtweening;sleep,2.4;linear,0.1;addy,-200);
    };
    LoadActor(THEME:GetPathB("","_doors/bottom design"))..{
      InitCommand=cmd(Center);
      OnCommand=cmd(finishtweening;cropright,1;sleep,2.4;sleep,0.2;linear,0.5;cropright,0);
    };
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,10;y,-160;rotationz,8;zoom,1.3);
  Def.ActorFrame{
    InitCommand=cmd(CenterY;x,SCREEN_CENTER_X-SCREEN_WIDTH);
    OnCommand=cmd(finishtweening;sleep,2.4;linear,0.4;x,SCREEN_CENTER_X-100;linear,4;x,SCREEN_CENTER_X);
    LoadActor(THEME:GetPathB("","_doors/RESULT"))..{
      OnCommand=cmd(finishtweening;sleep,4;
      addx,-5;addy,-4;sleep,0.1;addx,5;addy,4;sleep,0.5;
      addx,4;addy,6;sleep,0.1;addx,-4;addy,-6;sleep,0.3;
      addx,-2;addy,4;sleep,0.1;addx,2;addy,-4;sleep,0.8;
      addx,-8;addy,-6;sleep,0.1;addx,8;addy,6;sleep,0.1;
      addx,-8;addy,6;sleep,0.1;addx,8;addy,-6;sleep,0.2;);
    };
    LoadActor(THEME:GetPathB("","_doors/RESULT"));
  }
};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(FullScreen;diffusealpha,0);
    OnCommand=cmd(sleep,2.4;linear,0.1;diffusealpha,1;linear,0.2;diffusealpha,0);
  };
};

t[#t+1] = LoadActor(("../../cleared"))..{
	StartTransitioningCommand=cmd(play);
};


t[#t+1] = Def.ActorFrame{
	Def.Sprite{
		InitCommand=cmd(Center);
		SetCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				song = GAMESTATE:GetCurrentCourse();
			else
				song = GAMESTATE:GetCurrentSong();
			end;
		self:Load(THEME:GetPathB ("","ScreenGameplay out/normal/cleared"));
		end;
		OnCommand=function(self)
			self:queuecommand("Set")
			self:diffusealpha(0):sleep(0.5):
			zoom(10):linear(0.198):
			diffusealpha(1):
			linear(4):zoom(1):linear(0.5):diffusealpha(0)
		end;
		};
	};

return t
