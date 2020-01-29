local t = LoadFallbackB();

local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

local StageStar = {
	Stage_Event		= "yellow",
	Stage_1st		= "yellow",
	Stage_2nd		= "yellow",
	Stage_3rd		= "yellow",
	Stage_4th		= "yellow",
	Stage_5th		= "yellow",
	Stage_6th		= "yellow",
	Stage_Final		= "yellow",
	Stage_Extra1		= "red",
	Stage_Extra2		= "rainbow",
	Stage_Extra2		= "rainbow",
	Stage_Endless		= "red",
	Stage_Nonstop		= "red",
	Stage_Oni		= "red",
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;

t[#t+1] = Def.ActorFrame{
  InitCommand=function(self)
  end;
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1"));
		OnCommand=cmd(sleep,3.2);
	};
	--Special backgrounds
	Def.Sprite{
		InitCommand=cmd(Center;scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,2.9;diffuse,color("0,0,0,1"));
    BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local path = "ScreenStageInformation decorations/back/"
			if sStage == "Stage_Endless" then
				self:Load(THEME:GetPathB("",path.."endless"));
			elseif sStage == "Stage_Nonstop" then
				self:Load(THEME:GetPathB("",path.."nonstop"));
			elseif sStage == "Stage_Oni" then
				self:Load(THEME:GetPathB("",path.."oni"));
			else
				return
			end;
		end;
	};
};

if sStage == "Stage_Endless" or sStage == "Stage_Nonstop" or sStage == "Stage_Oni" then
t[#t+1] = Def.ActorFrame{
	LoadActor("../stagetemp/courseback")..{
		InitCommand=cmd(diffusealpha,0.5;Center);
		OnCommand=cmd(decelerate,2.4;rotationz,1440;linear,0.3;diffusealpha,1;zoom,10;diffuse,color("0,0,0,1"))
	};
};
end;

t[#t+1] = Def.ActorFrame{
  InitCommand=function(self)
  end;
  Def.Sprite{
    InitCommand=cmd(Center;setsize,640,480);
    BeginCommand=cmd(playcommand,"Set");
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong();
			if song then
      	if song:HasBackground() == true then
        	self:LoadFromSongBackground(song)
      	else
        	self:Load(THEME:GetPathG("","Common fallback background"));
      	end;
			end;
    end;
  };
	LoadActor(THEME:GetPathB("","_starmodel/star_"..StageStar[sStage]))..{
		InitCommand=cmd(Center);
		OnCommand=cmd(zoom,8.0;decelerate,2.4;rotationy,720;linear,0.3;zoom,0;);
	};
  Def.Quad{
    InitCommand=cmd(Center;setsize,SCREEN_WIDTH,20;diffuse,color("0,0,0,1"));
    OnCommand=cmd(diffusealpha,1;linear,0.3;zoomy,5.0;diffusealpha,0.25;sleep,2.4;linear,0.3;zoomy,0;)
  };
};

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
    OnCommand=cmd(diffusealpha,0;linear,0.3;addy,-32;diffusealpha,1;sleep,2.4;diffusealpha,1;linear,0.3;diffusealpha,0;;playcommand,"Set");
  };
  LoadFont("Common normal")..{
    InitCommand=cmd(Center);
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      local text
      if song then
        text = song:GetDisplayArtist()
      else
        text = ""
      end
      self:settext(text)
    end;
    OnCommand=cmd(diffusealpha,0;linear,0.3;addy,32;diffusealpha,1;sleep,2.4;diffusealpha,1;linear,0.3;diffusealpha,0;playcommand,"Set");
  };
};

t[#t+1] = LoadActor(THEME:GetPathB("ScreenStageInformation","decorations/stage " .. ToEnumShortString(sStage) ));

return t;
