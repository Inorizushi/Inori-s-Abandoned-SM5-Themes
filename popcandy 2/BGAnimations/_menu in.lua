local t = Def.ActorFrame{
};

t[#t+1] = Def.ActorFrame{
  LoadActor("_swoosh.ogg")..{
    StartTransitioningCommand=cmd(play);
  };
  Def.Quad{
    InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1");linear,0.3;diffusealpha,0);
  };
  LoadActor("stagetemp/loadf_0u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-128);
    OnCommand=cmd(linear,0.2;addy,-224);
  };
  LoadActor("stagetemp/loadf_0d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+128);
    OnCommand=cmd(linear,0.2;addy,224;);
  };
  LoadActor("stagetemp/loadf_1u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-148);
    OnCommand=cmd(bounceend,0.3;addy,-184;);
  };
  LoadActor("stagetemp/loadf_1d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+148);
    OnCommand=cmd(bounceend,0.3;addy,184;);
  };
  LoadActor("stagetemp/loadf_3u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-208);
    OnCommand=cmd(bounceend,0.3;addy,-64;);
  };
  LoadActor("stagetemp/loadf_3d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+208);
    OnCommand=cmd(bounceend,0.3;addy,64;);
  };
  LoadActor("stagetemp/loadf_2u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-112);
    OnCommand=cmd(bounceend,0.3;addy,-640;);
  };
  LoadActor("stagetemp/loadf_2d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+112);
    OnCommand=cmd(bounceend,0.3;addy,640;);
  };
  LoadActor("stagetemp/box.txt")..{
    InitCommand=cmd(effectmagnitude,0,100,0;CenterY;x,SCREEN_CENTER_X-136;z,16);
    OnCommand=cmd(linear,0.3;zoom,0;rotationy,-360;);
  };
  LoadActor("stagetemp/box.txt")..{
    InitCommand=cmd(effectmagnitude,0,100,0;CenterY;x,SCREEN_CENTER_X+136;z,16);
    OnCommand=cmd(linear,0.3;zoom,0;rotationy,-360;);
  };
  LoadActor("stagetemp/loadf_4c")..{
    InitCommand=cmd(Center;rainbow,true);
    OnCommand=cmd(diffusealpha,1;linear,0.3;diffusealpha,0;);
  };
};

return t;
