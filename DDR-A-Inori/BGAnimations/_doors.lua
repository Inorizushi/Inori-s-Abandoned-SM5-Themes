local path = THEME:GetPathB("","_blue doors");

local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","_select.ogg")) .. {
		AnimOnCommand=cmd(queuecommand,"Play");
		AnimOffCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
		ShowCommand=cmd(diffusealpha,1);
    InitCommand=cmd(CenterY;setsize,SCREEN_WIDTH/2,SCREEN_HEIGHT;x,_screen.cx-320;diffuse,color("#0b223e");diffusealpha,0);
    AnimOnCommand=cmd(x,_screen.cx-320;diffusealpha,0;fadeleft,1;sleep,0.4;accelerate,0.4;diffusealpha,1;fadeleft,0);
		AnimOffCommand=cmd(diffusealpha,1;faderight,0;accelerate,0.4;diffusealpha,0;faderight,1);
  };
	Def.Quad{
		ShowCommand=cmd(diffusealpha,1);
    InitCommand=cmd(CenterY;setsize,SCREEN_WIDTH/2,SCREEN_HEIGHT;x,_screen.cx+320;diffuse,color("#0b223e");diffusealpha,0);
    AnimOnCommand=cmd(x,_screen.cx+320;diffusealpha,0;faderight,1;sleep,0.4;accelerate,0.4;diffusealpha,1;faderight,0);
		AnimOffCommand=cmd(diffusealpha,1;fadeleft,0;accelerate,0.4;diffusealpha,0;fadeleft,1);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor(path.."/scsh_back03_flash_blue.png")..{
    InitCommand=cmd(x,SCREEN_CENTER_X;CenterY;diffusealpha,0;blend,Blend.Add;setsize,644,SCREEN_HEIGHT;blend,Blend.Add;);
    AnimOnCommand=cmd(x,_screen.cx;sleep,0.4;accelerate,0.2;diffusealpha,0.5;linear,0.3;x,SCREEN_CENTER_X+700;diffusealpha,0;);
		AnimOffCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X;accelerate,0.2;diffusealpha,0.5;linear,0.3;x,SCREEN_CENTER_X+700;diffusealpha,0;);
  };
  LoadActor(path.."/scsh_back03_flash_blue.png")..{
    InitCommand=cmd(x,SCREEN_CENTER_X;CenterY;diffusealpha,0;zoomx,-1;blend,Blend.Add;setsize,644,SCREEN_HEIGHT;blend,Blend.Add;);
    AnimOnCommand=cmd(x,_screen.cx;sleep,0.4;accelerate,0.2;diffusealpha,0.5;linear,0.3;x,SCREEN_CENTER_X-700;diffusealpha,0;);
		AnimOffCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X;accelerate,0.2;diffusealpha,0.5;linear,0.3;x,SCREEN_CENTER_X-700;diffusealpha,0;);
  };
}

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_TOP-6);
  Def.ActorFrame{
		InitCommand=cmd(diffusealpha,0);
		ShowCommand=cmd(diffusealpha,1);
    AnimOnCommand=cmd(diffusealpha,0;addy,-200;sleep,0.25;decelerate,0.2;addy,200;diffusealpha,1;);
		AnimOffCommand=cmd(diffusealpha,1;sleep,0.25;decelerate,0.2;addy,-200;diffusealpha,0;);
    LoadActor(path.."/scsh_back02_blue.png")..{
      InitCommand=cmd(valign,0;x,-320;zoomx,-1);
    };
    LoadActor(path.."/scsh_back02_blue.png")..{
      InitCommand=cmd(valign,0;x,320);
    };
  };
  Def.ActorFrame{
		InitCommand=cmd(diffusealpha,0);
		ShowCommand=cmd(diffusealpha,1);
    AnimOnCommand=cmd(diffusealpha,0;addy,-200;sleep,0.2;decelerate,0.2;addy,200;diffusealpha,1;);
		AnimOffCommand=cmd(diffusealpha,1;sleep,0.2;decelerate,0.2;addy,-200;diffusealpha,0;);
    LoadActor(path.."/scsh_back01_blue.png")..{
      InitCommand=cmd(valign,0;xy,-238,4;zoomx,-1);
    };
    LoadActor(path.."/scsh_back01_blue.png")..{
      InitCommand=cmd(valign,0;xy,238,4);
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(y,114);
    AnimOnCommand=cmd(diffusealpha,0);
		AnimOffCommand=cmd(diffusealpha,0);
    OnCommand=cmd(diffuseshift;effectcolor1,1,1,1,0;effectcolor2,1,1,1,0.9;effectperiod,3);
    LoadActor(path.."/scsh_back02_light_blue.png")..{
      InitCommand=cmd(valign,0;x,-321;zoomx,-1);
    };
    LoadActor(path.."/scsh_back02_light_blue.png")..{
      InitCommand=cmd(valign,0;x,321);
    };
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_BOTTOM+6;zoomy,-1);
  Def.ActorFrame{
		InitCommand=cmd(diffusealpha,0);
		ShowCommand=cmd(diffusealpha,1);
    AnimOnCommand=cmd(diffusealpha,0;addy,-200;sleep,0.25;decelerate,0.2;addy,200;diffusealpha,1;);
		AnimOffCommand=cmd(diffusealpha,1;sleep,0.25;decelerate,0.2;addy,-200;diffusealpha,0;);
    LoadActor(path.."/scsh_back02_blue.png")..{
      InitCommand=cmd(valign,0;x,-320;zoomx,-1);
    };
    LoadActor(path.."/scsh_back02_blue.png")..{
      InitCommand=cmd(valign,0;x,320);
    };
  };
  Def.ActorFrame{
		InitCommand=cmd(diffusealpha,0);
		ShowCommand=cmd(diffusealpha,1);
    AnimOnCommand=cmd(diffusealpha,0;addy,-200;sleep,0.2;decelerate,0.2;addy,200;diffusealpha,1;);
		AnimOffCommand=cmd(diffusealpha,1;sleep,0.2;decelerate,0.2;addy,-200;diffusealpha,0;);
    LoadActor(path.."/scsh_back01_blue.png")..{
      InitCommand=cmd(valign,0;xy,-238,4;zoomx,-1);
    };
    LoadActor(path.."/scsh_back01_blue.png")..{
      InitCommand=cmd(valign,0;xy,238,4);
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(y,114);
		AnimOnCommand=cmd(diffusealpha,0);
		AnimOffCommand=cmd(diffusealpha,0);
    OnCommand=cmd(diffuseshift;effectcolor1,1,1,1,0;effectcolor2,1,1,1,0.9;effectperiod,3);
    LoadActor(path.."/scsh_back02_light_blue.png")..{
      InitCommand=cmd(valign,0;x,-321;zoomx,-1);
    };
    LoadActor(path.."/scsh_back02_light_blue.png")..{
      InitCommand=cmd(valign,0;x,321);
    };
  };
};

return t;
