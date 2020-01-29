local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("back1")..{
    InitCommand=cmd(FullScreen);
  };
  Def.ActorFrame{
    InitCommand=cmd(Center;);
    LoadActor("back3")..{
      InitCommand=cmd(y,-180;zoomtowidth,SCREEN_WIDTH);
      OnCommand=function(self)
        local w = SCREEN_HEIGHT*1.333333 / self:GetWidth();
        local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
        self:customtexturerect(0,0,w,1);
        self:texcoordvelocity(-0.2,0);
      end;
    };
    LoadActor("back3")..{
      InitCommand=cmd(y,180;zoomtowidth,SCREEN_WIDTH);
      OnCommand=function(self)
        local w = SCREEN_HEIGHT*1.333333 / self:GetWidth();
        local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
        self:customtexturerect(0,0,w,1);
        self:texcoordvelocity(0.2,0);
      end;
    };
  };
}

t[#t+1] = Def.ActorFrame{
  LoadActor("back8")..{
    InitCommand=cmd(zoom,1.5;Center;spin;effectmagnitude,0,0,50);
  };
  LoadActor("back7")..{
    InitCommand=cmd(Center;spin;effectmagnitude,0,0,-5);
  };
  LoadActor("back6")..{
    InitCommand=cmd(diffuse,color("0.6,0.6,0.6,1");Center;spin;effectmagnitude,0,0,10);
  };
  LoadActor("back6")..{
    InitCommand=cmd(zoom,1.49;diffuse,color("0.8,0.8,0.8,1");Center;spin;effectmagnitude,0,0,-20);
  };
  LoadActor("back6")..{
    InitCommand=cmd(zoom,2.2;diffuse,color("1.2,1.2,1.2,1");Center;spin;effectmagnitude,0,0,40);
  };
  LoadActor("../_popcandymodel/popcandy_green.txt")..{
    InitCommand=cmd(z,-500;Center;zoom,8.0;spin;effectmagnitude,0,75,0;);
  };
};

return t;
