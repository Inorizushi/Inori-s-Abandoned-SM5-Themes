local t = Def.ActorFrame {
	SetMessageCommand=function(self,params)
		self:zoom(params.HasFocus and 3 or 2.5);
	end;

 	LoadActor( 'normal' ) .. {
		InitCommand=cmd(y,-8);
	};
	LoadActor( 'normal' ) .. {
		InitCommand=cmd(y,-8;diffusecolor,Color('Yellow');blend,Blend.Add;diffusealpha,0.5;thump;effectclock,'beat';effectmagnitude,1,1.05,1;effectoffset,0.35);
		SetMessageCommand=function(self,params)
			if params.Index ~= nil then
				self:visible(params.HasFocus);
			end
		end;
	};
	LoadActor( 'bright' ) .. {
		InitCommand=cmd(y,-8;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.5;effectclock,'beatnooffset');
		SetMessageCommand=function(self,params)
			if params.Index ~= nil then
				self:visible(params.HasFocus);
			end
		end;
	};
	LoadFont( '_dfphsgothic-w9 28px' ) .. {
		InitCommand=cmd(zoom,0.5;maxwidth,320);
		SetCommand=function(self,params)
			self:stoptweening();
			if params.Text == '' then
				self:settext("RANDOM");
			elseif GAMESTATE:GetSortOrder() == 'SortOrder_Group' then
				self:settext(string.gsub(params.Text,"^%d%d? ?%- ?", ""));
			elseif GAMESTATE:GetSortOrder() == 'SortOrder_TopGrades' then
				self:settext(string.gsub(params.Text,"AAAA","AAA+"))
			else
				self:settext(params.Text);
			end
		end;
	};
};

return t
