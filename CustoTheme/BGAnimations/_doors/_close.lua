local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("#dd3232");cropright,1);
    OnCommand=cmd(finishtweening;linear,0.2;cropright,0;sleep,3);
  };
  Def.ActorFrame{
    InitCommand=cmd(x,10;y,-120;zoom,1.3;rotationz,12);
    LoadActor("top base")..{
      InitCommand=cmd(Center;addy,-200);
      OnCommand=cmd(finishtweening;linear,0.1;addy,200);
    };
    LoadActor("topper")..{
      InitCommand=cmd(Center);
      OnCommand=cmd(finishtweening;cropright,1;sleep,0.2;linear,0.5;cropright,0);
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(x,10;y,-120;zoom,1.3;rotationz,8);
    LoadActor("bottom base")..{
      InitCommand=cmd(Center;addy,200);
      OnCommand=cmd(finishtweening;linear,0.1;addy,-200);
    };
    LoadActor("bottom design")..{
      InitCommand=cmd(Center);
      OnCommand=cmd(finishtweening;cropright,1;sleep,0.2;linear,0.5;cropright,0);
    };
  };

};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(FullScreen;diffusealpha,0);
    OnCommand=cmd(linear,0.1;diffusealpha,1;linear,0.2;diffusealpha,0);
  };
};


return t;
