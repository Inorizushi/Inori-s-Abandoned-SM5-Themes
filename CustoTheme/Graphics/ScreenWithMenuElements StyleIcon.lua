return LoadFont("_pirates of cydonia 48px") .. {
  InitCommand=cmd(playcommand,"Set");
  SetCommand=function(self)
    local style = GAMESTATE:GetCurrentStyle();
    local st = style:GetName();
    self:halign(1)
    self:uppercase(true)
    self:settext(st);
    self:diffuse(color("0,0,0,1"))
  end;
};
