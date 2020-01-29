local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("#dd3232"));
    OnCommand=cmd(finishtweening;linear,0.1;cropleft,1);
  };
  Def.ActorFrame{
    InitCommand=cmd(x,10;y,-120;zoom,1.3;rotationz,12);
    OnCommand=cmd(finishtweening;sleep,0.3;decelerate,0.2;addy,40;accelerate,0.2;addy,-SCREEN_HEIGHT);
    LoadActor("top base")..{
      InitCommand=cmd(Center);
    };
    LoadActor("topper")..{
      InitCommand=cmd(Center);
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(x,10;y,-120;zoom,1.3;rotationz,8);
    OnCommand=cmd(finishtweening;sleep,0.3;decelerate,0.2;addy,-40;accelerate,0.2;addy,240);
    LoadActor("bottom base")..{
      InitCommand=cmd(Center);
    };
    LoadActor("bottom design")..{
      InitCommand=cmd(Center);
    };
  };
};

return t;
