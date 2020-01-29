local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("back1.png")..{
    InitCommand=cmd(Center;FullScreen;diffuse,color("0.8,1.0,0.8,1"));
  };
  Def.ActorFrame{
    InitCommand=cmd(Center;);
    LoadActor("back3")..{
      InitCommand=cmd(y,-180;zoomtowidth,SCREEN_WIDTH;diffuse,color("0.8,1.0,0.8,1"));
      OnCommand=function(self)
        local w = SCREEN_HEIGHT*1.333333 / self:GetWidth();
        local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
        self:customtexturerect(0,0,w,1);
        self:texcoordvelocity(-0.2,0);
      end;
    };
    LoadActor("back3")..{
      InitCommand=cmd(y,180;zoomtowidth,SCREEN_WIDTH;diffuse,color("0.8,1.0,0.8,1"));
      OnCommand=function(self)
        local w = SCREEN_HEIGHT*1.333333 / self:GetWidth();
        local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
        self:customtexturerect(0,0,w,1);
        self:texcoordvelocity(0.2,0);
      end;
    };
  };
};

--rings
t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(diffuse,color("0.8,1.0,0.8,1"));
  --top left
  Def.ActorFrame{
    InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_TOP;zoom,1);
    LoadActor("back2")..{
      OnCommand=cmd(spin;effectmagnitude,0,50,0;);
    };
    LoadActor("back2")..{
      OnCommand=cmd(spin;effectmagnitude,50,0,0;);
    };
  };
  --top right
  Def.ActorFrame{
    InitCommand=cmd(xy,SCREEN_RIGHT,SCREEN_TOP;zoom,1);
    LoadActor("back2")..{
      OnCommand=cmd(spin;effectmagnitude,0,50,0;);
    };
    LoadActor("back2")..{
      OnCommand=cmd(spin;effectmagnitude,50,0,0;);
    };
  };
  --bottom left
  Def.ActorFrame{
    InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_BOTTOM;zoom,1);
    LoadActor("back2")..{
      OnCommand=cmd(spin;effectmagnitude,0,50,0;);
    };
    LoadActor("back2")..{
      OnCommand=cmd(spin;effectmagnitude,50,0,0;);
    };
  };
  --bottom right
  Def.ActorFrame{
    InitCommand=cmd(xy,SCREEN_RIGHT,SCREEN_BOTTOM;zoom,1);
    LoadActor("back2")..{
      OnCommand=cmd(spin;effectmagnitude,0,50,0;);
    };
    LoadActor("back2")..{
      OnCommand=cmd(spin;effectmagnitude,50,0,0;);
    };
  };
};

--cautions
t[#t+1] = Def.ActorFrame{
  LoadActor("caution1")..{
    InitCommand=cmd(Center;diffuse,color("0.8,1.0,0.8,1"));
    OnCommand=cmd(spin;effectmagnitude,0,0,20;);
  };
  LoadActor("caution2")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_TOP+96;diffuse,color("0.8,0.8,1.0,1"));
    OnCommand=cmd(addx,-640;linear,0.3;addx,640;);
  };
  LoadActor("caution3")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_BOTTOM-96;diffuse,color("0.8,1.0,0.8,1"));
    OnCommand=cmd(addx,640;linear,0.3;addx,-640;);
  };
};

return t;
