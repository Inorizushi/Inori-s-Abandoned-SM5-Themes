local t = Def.ActorFrame{};

t[#t+1] = Def.Actor{
  CodeMessageCommand=function(self,params)
    local codeName = params.Name
    if codeName == "GroupLeft" then
      MESSAGEMAN:Broadcast("SectionChanged");
    elseif codeName == 'GroupRight' then
      MESSAGEMAN:Broadcast("SectionChanged");
    end;
  end;
};

--Sounds
t[#t+1] = Def.ActorFrame{
	SectionChangedMessageCommand=function(self)
		SOUND:DimMusic(0,math.huge)
	end;
	LoadActor(THEME:GetPathS("","MusicWheel section.mp3"))..{
		SectionChangedMessageCommand=cmd(play);
	};
};

--Header
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(CenterX);
  Def.ActorFrame{
    Def.Sprite{
      InitCommand=cmd(xy,-258,_screen.cy-207);
      OnCommand=cmd(blend,Blend.Add;diffusealpha,0;sleep,0.35;linear,0.5;diffusealpha,1;);
      BeginCommand=function(self)
        self:Load(THEME:GetPathB("","ScreenSelectMusic decorations/original.png"))
      end;
    };
    Def.Sprite{
      InitCommand=cmd(xy,-276,_screen.cy-204);
      OnCommand=cmd(blend,Blend.Add;diffusealpha,1;diffuseshift;effectcolor1,1,1,1,0.6;effectcolor2,1,1,1,0.9;effectperiod,2;diffusealpha,0;sleep,0.35;linear,0.5;diffusealpha,1;);
      BeginCommand=function(self)
        self:Load(THEME:GetPathB("","ScreenSelectMusic decorations/original_glow.png"))
      end;
    };
  };
  LoadActor("top")..{
    InitCommand=cmd(y,SCREEN_TOP);
    OnCommand=cmd(y,SCREEN_TOP;decelerate,0.3;y,SCREEN_TOP+125);
  };
  LoadActor("time")..{
    InitCommand=cmd(xy,210,SCREEN_TOP-92);
    OnCommand=cmd(y,SCREEN_TOP-92;decelerate,0.3;y,SCREEN_TOP+33);
  };
	LoadActor("channel")..{
		InitCommand=cmd(y,SCREEN_TOP+47);
		OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1;);
	};
	Def.BitmapText{
		Font="MicrogrammaDExtended";
		InitCommand=cmd(y,SCREEN_TOP+24;zoom,1.22;maxwidth,180);
		OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1;);
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local group = song:GetGroupName()
				self:settext(group)
			end;
		end;
	};
};

--Preview/Center Stuff
t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
    InitCommand=cmd(CenterX;draworder,99);
    Def.Sprite{
      Texture="in 4x4";
      InitCommand=function(self)
        self:y(_screen.cy)
        self:SetStateProperties{
          {Frame=0, Delay=0.038},
          {Frame=1, Delay=0.038},
          {Frame=2, Delay=0.038},
          {Frame=3, Delay=0.038},
          {Frame=4, Delay=0.038},
          {Frame=5, Delay=0.038},
          {Frame=6, Delay=0.038},
          {Frame=7, Delay=0.038},
          {Frame=8, Delay=0.038},
          {Frame=9, Delay=0.038},
          {Frame=10, Delay=0.038},
          {Frame=11, Delay=0.038},
          {Frame=12, Delay=0.038},
          {Frame=13, Delay=2.038},
        };
      end;
      OnCommand=cmd(diffusealpha,1;sleep,0.49;diffusealpha,0);
    };
    LoadActor("pf.png")..{
      InitCommand=cmd(y,_screen.cy+78;);
      OnCommand=cmd(diffusealpha,0;sleep,0.49;diffusealpha,1;);
    };
  };
	LoadActor("DiscFrame")..{
    InitCommand=cmd(Center);
    OnCommand=cmd(draworder,1;diffusealpha,0;sleep,0.5;diffusealpha,1);
		SectionChangedMessageCommand=cmd(finishtweening;queuecommand,"On");
  };
	Def.Sprite{
		Texture="xgiro 4x5.png";
		InitCommand=function(self)
			self:pause()
			self:Center()
			self:SetStateProperties{
				{Frame=0, Delay=.024},
				{Frame=1, Delay=.024},
				{Frame=2, Delay=.024},
				{Frame=3, Delay=.024},
				{Frame=4, Delay=.024},
				{Frame=5, Delay=.024},
				{Frame=6, Delay=.024},
				{Frame=7, Delay=.024},
				{Frame=8, Delay=.024},
				{Frame=9, Delay=.024},
				{Frame=10, Delay=.024},
				{Frame=11, Delay=.024},
				{Frame=12, Delay=.024},
				{Frame=13, Delay=.024},
				{Frame=14, Delay=.024},
				{Frame=15, Delay=.024},
				{Frame=16, Delay=.024},
				{Frame=17, Delay=.024},
				{Frame=18, Delay=.024},
				{Frame=19, Delay=.024},
			};
		end;
		OnCommand=cmd(draworder,2;diffusealpha,0);
		AnimCommand=function(self)
			self:setstate(0):play()
			self:sleep(0.5):queuecommand("Stop")
		end;
		StopCommand=cmd(pause;diffusealpha,0);
		SectionChangedMessageCommand=cmd(finishtweening;diffusealpha,1;queuecommand,"Anim");
	};
	Def.Quad{
    InitCommand=cmd(Center;blend,Blend.NoEffect;zwrite,1;setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
    OnCommand=cmd(diffusealpha,1;sleep,0.49;diffusealpha,0);
  };
	Def.ActorFrame{
		Name="Preview";
		InitCommand=cmd(xy,_screen.cx,_screen.cy+60;fov,80;rotationx,-31);
		Def.Quad{
			InitCommand=cmd(MaskSource,true;setsize,416,236;);
		};
		Def.Banner{
			InitCommand=cmd(MaskDest;ztestmode,"ZTestMode_WriteOnFail");
	    SetCommand=function(self,params)
	      self:finishtweening()
	      local song = GAMESTATE:GetCurrentSong();
	      local so = GAMESTATE:GetSortOrder();
	      local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
				if song then
	        if song:HasJacket() then
	          self:LoadBackground(song:GetJacketPath());
	        elseif song:HasBackground() then
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
					else
						self:Load(THEME:GetPathG("","MusicWheelItem fallback"));
					end;
	      elseif mw:GetSelectedType('WheelItemDataType_Section')  then
	        local group = mw:GetSelectedSection()
					if group then
	          if so == "SortOrder_Group" then
	            if group_name[group] ~= nil then
	              self:Load(THEME:GetPathG("","_jackets/group/"..group_name[group]..".png"))
	            else
	              self:LoadFromSongGroup(group);
	            end;
	          end;
	        end;
	      else
	        self:Load( THEME:GetPathG("","MusicWheelItem fallback") );
	      end;
	      self:zoomto(424,424);
			end;
	    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
	  };
	};
};

--glowy shit
t[#t+1] = Def.ActorFrame{
	SectionChangedMessageCommand=cmd(finishtweening;queuecommand,"On");
	Def.Sprite{
		Texture="Mglw 4x4.png";
		OnCommand=cmd(draworder,2;diffusealpha,0;sleep,0.5;diffusealpha,1);
		InitCommand=function(self)
			self:xy(_screen.cx,_screen.cy-142)
			self:SetStateProperties{
				{Frame=0, Delay=1.95},
				{Frame=1, Delay=.05},
				{Frame=2, Delay=.05},
				{Frame=3, Delay=.05},
				{Frame=4, Delay=.05},
				{Frame=5, Delay=.05},
				{Frame=6, Delay=.05},
				{Frame=7, Delay=.05},
				{Frame=8, Delay=.05},
				{Frame=9, Delay=.05},
				{Frame=10, Delay=.05},
				{Frame=11, Delay=.05},
				{Frame=12, Delay=.05},
				{Frame=13, Delay=.05},
				{Frame=14, Delay=.05},
				{Frame=15, Delay=.05},
			};
		end;
	};
	Def.Sprite{
		Texture="glw 3x5.png";
		OnCommand=cmd(draworder,2;zoomx,-1;diffusealpha,0;sleep,0.5;diffusealpha,1);
		InitCommand=function(self)
			self:xy(_screen.cx-214,_screen.cy-80)
			self:SetStateProperties{
				{Frame=0, Delay=2},
				{Frame=1, Delay=.05},
				{Frame=2, Delay=.05},
				{Frame=3, Delay=.05},
				{Frame=4, Delay=.05},
				{Frame=5, Delay=.05},
				{Frame=6, Delay=.05},
				{Frame=7, Delay=.05},
				{Frame=8, Delay=.05},
				{Frame=9, Delay=.05},
				{Frame=10, Delay=.05},
				{Frame=11, Delay=.05},
				{Frame=12, Delay=.05},
				{Frame=13, Delay=.05},
				{Frame=14, Delay=.05},
			};
		end;
	};
	Def.Sprite{
		Texture="glw 3x5.png";
		OnCommand=cmd(draworder,2;diffusealpha,0;sleep,0.5;diffusealpha,1);
		InitCommand=function(self)
			self:xy(_screen.cx+214,_screen.cy-80)
			self:SetStateProperties{
				{Frame=0, Delay=2},
				{Frame=1, Delay=.05},
				{Frame=2, Delay=.05},
				{Frame=3, Delay=.05},
				{Frame=4, Delay=.05},
				{Frame=5, Delay=.05},
				{Frame=6, Delay=.05},
				{Frame=7, Delay=.05},
				{Frame=8, Delay=.05},
				{Frame=9, Delay=.05},
				{Frame=10, Delay=.05},
				{Frame=11, Delay=.05},
				{Frame=12, Delay=.05},
				{Frame=13, Delay=.05},
				{Frame=14, Delay=.05},
			};
		end;
	};
};

return t;
