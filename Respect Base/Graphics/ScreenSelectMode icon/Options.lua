local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(zoom,0.25;xy,SCREEN_CENTER_X-30,SCREEN_BOTTOM-80);
  OnCommand=cmd(diffusealpha,0;addy,80;sleep,0.1;decelerate,0.5;addy,-80;diffusealpha,1);
  OffCommand=cmd(sleep,0.1;decelerate,0.5;addy,80;diffusealpha,0);
  LoadActor("_Options")..{
    GainFocusCommand=cmd(stoptweening;decelerate,0.5;y,-40;diffuse,color("1,1,1,1"));
    LoseFocusCommand=cmd(stoptweening;decelerate,0.5;y,0;diffuse,color("#5a5a5a"));
  };
  LoadActor("dot")..{
    InitCommand=cmd(diffusealpha,0.5;y,140);
    GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,0.5);
    LoseFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,0);
  };
};

return t;
