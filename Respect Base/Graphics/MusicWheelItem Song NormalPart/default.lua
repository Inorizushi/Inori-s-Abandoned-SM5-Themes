local top
local t =  Def.ActorFrame{
	OnCommand = function(self)
		top = SCREENMAN:GetTopScreen()
	end;
	SetCommand = function(self,params)
		self:name(tostring(params.Index))
	end;
}

t[#t+1] = quadButton(1) .. {
	InitCommand= function(self)
		self:x(-200)
		self:zoomto(924,60)
		self:visible(false)
	end;
	TopPressedCommand = function(self)

		local newIndex = tonumber(self:GetParent():GetName())
		local wheel = top:GetMusicWheel()
		local size = wheel:GetNumItems()
		local move = newIndex-wheel:GetCurrentIndex()

		if math.abs(move)>math.floor(size/2) then
			if newIndex > wheel:GetCurrentIndex() then
				move = (move)%size-size
			else
				move = (move)%size
			end
		end

		wheel:Move(move)
		wheel:Move(0)

		-- TODO: play sounds.
		if move == 0 and wheel:GetSelectedType() == 'WheelItemDataType_Section' then
			if wheel:GetSelectedSection() == curFolder then
				wheel:SetOpenSection("")
				curFolder = ""
			else
				wheel:SetOpenSection(wheel:GetSelectedSection())
				curFolder = wheel:GetSelectedSection()
			end
		end

	end;
}

t[#t+1] = Def.ActorFrame{
  --Title
  Def.BitmapText{
    Font="_gotham book 30px";
    InitCommand=cmd(halign,0;x,-400;maxwidth,600;wrapwidthpixels,2^24);
    SetMessageCommand=function(self, param)
			local Song = param.Song;
			local Course = param.Course;
			if Song then
        local group = Song:GetGroupName()
        self:settext(Song:GetDisplayFullTitle());
			elseif Course then
				self:settext(Course:GetDisplayFullTitle());
			end
      if param.HasFocus then
        self:y(0):zoom(1)
      else
        self:y(-7):zoom(0.75)
      end;
	   end;
  };
  --Artist
  Def.BitmapText{
    Font="_itc avant garde gothic lt Bold 16px";
    InitCommand=cmd(halign,0;x,-395;y,14;maxwidth,600;wrapwidthpixels,2^24;diffusealpha,0.5);
    SetMessageCommand=function(self, param)
			local Song = param.Song;
			local Course = param.Course;
			if Song then
        self:settext(Song:GetDisplayArtist());
			elseif Course then
				self:settext("");
			end
      if param.HasFocus then
        self:visible(false)
      else
        self:visible(true)
      end;
	   end;
  };
  Def.Quad{
    InitCommand=cmd(x,-437;setsize,60,60;diffuse,color("0.3,0.3,0.3,1"));
    SetMessageCommand=function(self,param)
      local Song = param.Song;
      if Song then
        if Song:HasJacket() then
          self:LoadBackground(Song:GetJacketPath())
          self:diffuse(color("1,1,1,1"))
          self:setsize(60,60)
        else
          local group = Song:GetGroupName();
          if group_name[group] ~= nil then
            self:Load(THEME:GetPathG("","_jackets/group/"..group_name[group]..".png"))
            self:diffuse(color("1,1,1,1"))
            self:setsize(60,60)
          else
            self:Load(THEME:GetPathG("","Common fallback jacket"))
            self:diffuse(color("1,1,1,1"))
            self:setsize(60,60)
          end;
        end;
      end;
    end;
  };
  Def.Quad{
    InitCommand=cmd(x,-405;setsize,4,60;);
    SetMessageCommand=function(self, param)
      local group = param.Text;
      if group_name[group] ~= nil then
        self:diffuse(color(group_colors[group]))
        self:diffusealpha(1)
      else
        self:diffuse(color("1,1,1,1"))
      end;
    end;
  }
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,322;diffusealpha,0.5);
  --Easy
  LoadActor("diff")..{
    InitCommand=cmd(x,-90);
    SetCommand=function(self,param)
      local song = param.Song;
      local st = GAMESTATE:GetCurrentStyle():GetStepsType()
      if song then
        if song:HasStepsTypeAndDifficulty(st, 'Difficulty_Easy') then
          self:visible(true)
        else
          self:visible(false)
        end;
      end;
    end;
  };
  --Medium
  LoadActor("diff")..{
    InitCommand=cmd(x,-30);
    SetCommand=function(self,param)
      local song = param.Song;
      local st = GAMESTATE:GetCurrentStyle():GetStepsType()
      if song then
        if song:HasStepsTypeAndDifficulty(st, 'Difficulty_Medium') then
          self:visible(true)
        else
          self:visible(false)
        end;
      end;
    end;
  };
  LoadActor("diff")..{
    InitCommand=cmd(x,30);
    SetCommand=function(self,param)
      local song = param.Song;
      local st = GAMESTATE:GetCurrentStyle():GetStepsType()
      if song then
        if song:HasStepsTypeAndDifficulty(st, 'Difficulty_Hard') then
          self:visible(true)
        else
          self:visible(false)
        end;
      end;
    end;
  };
  LoadActor("diff")..{
    InitCommand=cmd(x,90);
    SetCommand=function(self,param)
      local song = param.Song;
      local st = GAMESTATE:GetCurrentStyle():GetStepsType()
      if song then
        if song:HasStepsTypeAndDifficulty(st, 'Difficulty_Challenge') then
          self:visible(true)
        else
          self:visible(false)
        end;
      end;
    end;
  };
};

return t;
