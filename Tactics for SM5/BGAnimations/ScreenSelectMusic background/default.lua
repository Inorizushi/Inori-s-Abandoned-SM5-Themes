local t = Def.ActorFrame{
  Def.Sprite{
    InitCommand=cmd(Center);
    OnCommand=function(self)
      if GAMESTATE:IsCourseMode() then
        self:Load(THEME:GetPathB("","ScreenSelectMusic background/BG2"));
      else
        self:Load(THEME:GetPathB("","ScreenSelectMusic background/BG1"));
      end;
    end;
  }
}

return t;
