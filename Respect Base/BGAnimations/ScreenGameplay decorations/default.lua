local t = Def.ActorFrame{};

t[#t+1] = Def.Sprite{
  InitCommand=cmd(draworder,-1;xy,ScreenGameplayX()-5,SCREEN_CENTER_Y;playcommand,"Set");
  SetCommand=function(self)
    self:Load(THEME:GetPathG("","_Gear/default/life.png"))
  end;
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(draworder,1);
  Def.Sprite{
    InitCommand=cmd(xy,ScreenGameplayX()-5,SCREEN_CENTER_Y;playcommand,"Set");
    SetCommand=function(self)
      self:Load(THEME:GetPathG("","_Gear/default/sides.png"))
    end;
  };
  Def.Sprite{
    InitCommand=function(self)
      self:x(ScreenGameplayX())
      if GAMESTATE:PlayerIsUsingModifier(PLAYER_1, 'reverse') then
        self:y(SCREEN_BOTTOM-70)
      else
        self:y(SCREEN_TOP+70)
      end;
      self:playcommand("Set")
    end;
    SetCommand=function(self)
      self:Load(THEME:GetPathG("","_Gear/default/score.png"))
    end;
  };
};


return t
