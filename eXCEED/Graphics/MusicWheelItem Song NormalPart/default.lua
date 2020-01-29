return Def.ActorFrame{
  LoadActor("wheel1");
  Def.Banner{
    SetMessageCommand=function(self,params)
      local song = params.Song
      if song then
				if song:HasJacket() then
					self:Load(song:GetJacketPath())
				elseif song:HasBackground() then
					self:Load(song:GetBackgroundPath())
				else
					self:Load(THEME:GetPathG("MusicWheelItem", "fallback"))
				end
			end
			self:setsize(82,68)
    end;
  };
}
