local t = Def.ActorFrame{};

t[#t+1] = Def.Actor{
  OnCommand=function(self)
    self:sleep(4)
  end;
  StartTransitioningCommand=function(self) SOUND:DimMusic(0,math.huge) end,
};

return t;
