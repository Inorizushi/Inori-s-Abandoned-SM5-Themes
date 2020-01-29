local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFile("LifeFrame","LifeFrame")
t[#t+1] = StandardDecorationFromFile("ScoreFrame","ScoreFrame")

-- stage display (normal)
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")

t[#t+1] = Def.ActorFrame{
  LoadFont("Common normal")..{
    InitCommand=cmd(Center);
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      local text
      if song then
        text = song:GetDisplayFullTitle()
      else
        text = ""
      end
      self:settext(text)
    end;
    OnCommand=cmd(sleep,5;diffusealpha,1;linear,1;diffusealpha,0;playcommand,"Set");
  };
};

return t
