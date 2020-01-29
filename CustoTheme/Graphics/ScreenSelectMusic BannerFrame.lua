local t = Def.ActorFrame{}

t[#t+1] = Def.ActorFrame {
 	InitCommand=cmd(x,SCREEN_RIGHT-168;y,SCREEN_CENTER_Y-105;diffusealpha,1;draworder,1);
	OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
	Def.Banner {
		SetCommand=function(self,params)
		if not GAMESTATE:IsCourseMode() then
		local song = GAMESTATE:GetCurrentSong();
		local group = getenv("getgroupname");
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:zoomtowidth(184);
						self:zoomtoheight(184);
					elseif song:HasBackground() then
						self:diffusealpha(1);
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:zoomtowidth(184);
						self:zoomtoheight(184);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(184);
						self:zoomtoheight(184);
					end;
				elseif group then
					if group_name[group] ~= nil then
						self:Load(THEME:GetPathG("","_jackets/group/big jacket/"..group_name[group]..".png"))
	          self:diffusealpha(1)
						self:zoomtowidth(184);
						self:zoomtoheight(184);
	        else
	          self:LoadFromSongGroup(group);
	          self:diffusealpha(1)
						self:zoomtowidth(184);
						self:zoomtoheight(184);
	        end;
				else
						self:diffusealpha(0);
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(184);
						self:zoomtoheight(184);
				end;
		else
			self:diffusealpha(0);
		end;
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	};
	Def.Banner {
		SetCommand=function(self)
	  local course = GAMESTATE:GetCurrentCourse();
		if course then
			self:LoadFromCourse(GAMESTATE:GetCurrentCourse());
			self:zoomtowidth(200);
			self:zoomtoheight(200);
		end;
	end;
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};

	--[[Def.Sprite {
    SetCommand=function(self,params)
    	local song = GAMESTATE:GetCurrentSong();
      if SCREENMAN:GetTopScreen():GetChild('MusicWheel'):GetSelectedType() == 'WheelItemDataType_Random' then
        self:Load(THEME:GetPathG("","_jackets/random.png"))
        self:diffusealpha(1)
				self:zoomtowidth(304);
				self:zoomtoheight(304);
			else
				self:diffusealpha(0)
      end;
    end;
    CurrentSongChangedMessageCommand=function(self, params)
      self:playcommand("Set", params);
    end;
  };]]--
};

return t;
