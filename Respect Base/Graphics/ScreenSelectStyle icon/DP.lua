local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(zoom,0.5;xy,SCREEN_CENTER_X+200,SCREEN_BOTTOM-140;cropbottom,1);
  GainFocusCommand=function(self) MESSAGEMAN:Broadcast("StyleDP") end;
  LoadActor("_DP Dark")..{
    OnCommand=cmd(cropbottom,1;decelerate,0.4;cropbottom,0);
  };
  LoadActor("_DP HL")..{
    InitCommand=cmd(cropbottom,1;);
    GainFocusCommand=cmd(stoptweening;decelerate,0.4;cropbottom,0);
    LoseFocusCommand=cmd(stoptweening;decelerate,0.4;cropbottom,1);
  }
};

return t;
