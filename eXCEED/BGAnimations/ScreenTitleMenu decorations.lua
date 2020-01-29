return Def.ActorFrame{
  LoadActor(THEME:GetPathB("","_common/start.png"))..{
    InitCommand=cmd(xy,_screen.cx,_screen.cy+172;diffuseshift;effectcolor1,1,1,1,0;effectcolor2,1,1,1,0.9;effectperiod,1.5);
  };
  LoadActor(THEME:GetPathB("","_common/copy.png"))..{
    InitCommand=cmd(xy,_screen.cx+10,_screen.cy+200);
    OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1;);
  };
  Def.Quad{
    InitCommand=function(self)
      self:FullScreen():diffuse(Color.Black):diffusealpha(1):blend(Blend.NoEffect):zwrite(1)
    end;
    Condition=getenv("OPT") == "IN"
  };
  Def.Quad{
    InitCommand=function(self)
      self:FullScreen():diffuse(Color.Black)
    end;
    OnCommand=function(self) self:diffusealpha(1):linear(0.25):diffusealpha(0):ztest(1) end;
  };
  LoadActor(THEME:GetPathG("","_common/bezel.png"))..{
    InitCommand=cmd(Center;zoomto,1066,480;diffuse,color("0.5,0.5,0.5,1"));
  };
};
