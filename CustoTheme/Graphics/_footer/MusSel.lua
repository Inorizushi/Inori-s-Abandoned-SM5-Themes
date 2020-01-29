--[[
con sel
diff
3
4
sort
]]

local path = THEME:GetAbsolutePath("Graphics/_footer/");

local t = Def.ActorFrame{
  Def.Sprite{
    InitCommand=cmd(playcommand,"One");
    OneCommand=function(self)
      self:Load(path.."con-sel.png"):sleep(3):queuecommand("Two")
    end;
    TwoCommand=function(self)
      self:Load(path.."difficulty.png"):sleep(3):queuecommand("Three")
    end;
    ThreeCommand=function(self)
      self:Load(path.."3.png"):sleep(3):queuecommand("Four")
    end;
    FourCommand=function(self)
      self:Load(path.."4.png"):sleep(3):queuecommand("Five")
    end;
    FiveCommand=function(self)
      self:Load(path.."5.png"):sleep(3):queuecommand("One")
    end;
    OffCommand=cmd(pause;stoptweening);
  };
};

return t;
