local t = Def.ActorFrame {
	Def.Sprite{
		BeginCommand=cmd(halign,0;playcommand,"SetGraphic");
		SetGraphicCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so ~= nil then
				local sort = ToEnumShortString(so)
				self:Load(THEME:GetPathG("","_sort/_"..sort));
			end;
		end;
		SortOrderChangedMessageCommand=cmd(sleep,0.256;queuecommand,"SetGraphic");
	};
};

return t;
