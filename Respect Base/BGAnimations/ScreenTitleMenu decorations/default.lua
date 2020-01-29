local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center);
  OffCommand=cmd(diffusealpha,0);
  LoadActor("glow")..{
    InitCommand=cmd(diffusealpha,0;queuecommand,"Animate");
    AnimateCommand=function(self)
      local R = math.random(0.0,1.0)
      local G = math.random(0.0,1.0)
      local B = math.random(0.0,1.0)
      self:stoptweening():diffuse(color(R..","..G..","..B..",0")):sleep(4):accelerate(0.1):diffusealpha(0.5):decelerate(5):zoom(2):diffusealpha(0):queuecommand("Animate");
    end;
  };
  LoadActor("logo")..{
    OnCommand=cmd(y,-150;bob;effectmagnitude,0,10,0;effectperiod,5);
  };
  LoadActor("../stripes")..{
    OnCommand=cmd(diffusealpha,0.1);
  };
  LoadActor("text")..{
    OnCommand=cmd(y,150;);
  };
  LoadActor("start")..{
    OnCommand=cmd(y,400);
  };
  Def.Quad{
    InitCommand=cmd(diffuse,color("#000000");setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
    OnCommand=cmd(sleep,0.1;decelerate,0.5;diffusealpha,0);
  };
};

return t;
