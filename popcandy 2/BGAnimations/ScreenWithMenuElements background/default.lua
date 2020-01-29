local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("back1.png")..{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
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
};

--rings
t[#t+1] = Def.ActorFrame{
  LoadActor("back2")..{
    InitCommand=cmd(xy,SCREEN_LEFT,SCREEN_TOP;spin;effectmagnitude,0,0,-40;);
  };
  LoadActor("back2")..{
    InitCommand=cmd(xy,SCREEN_RIGHT,SCREEN_BOTTOM;spin;effectmagnitude,0,0,-40;);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor("back5")..{
    InitCommand=cmd(zoom,1.25;Center;spin;effectmagnitude,0,0,-5;);
  };
};

t[#t+1] = Def.ActorFrame{
  LoadActor("../_popcandymodel/popcandy_green.txt")..{
    InitCommand=cmd(z,-500;Center;zoom,8.0;spin;effectmagnitude,0,75,0;);
  };
  LoadActor("../_object1model/object1_green.txt")..{
    InitCommand=cmd(xy,SCREEN_LEFT+64,SCREEN_TOP+64;zoom,4.0;spin;effectmagnitude,-75,0,-75;);
  };
  LoadActor("../_object1model/object1_green.txt")..{
    InitCommand=cmd(xy,SCREEN_RIGHT-64,SCREEN_BOTTOM-64;zoom,4.0;spin;effectmagnitude,75,0,75;);
  };
  LoadActor("../_object1model/object1_green.txt")..{
    InitCommand=cmd(xy,SCREEN_LEFT+64,SCREEN_BOTTOM-64;zoom,4.0;spin;effectmagnitude,-75,0,75;);
  };
  LoadActor("../_object1model/object1_green.txt")..{
    InitCommand=cmd(xy,SCREEN_RIGHT-64,SCREEN_TOP+64;zoom,4.0;spin;effectmagnitude,75,0,-75;);
  };
};

return t;
