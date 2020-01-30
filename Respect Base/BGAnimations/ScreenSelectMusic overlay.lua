local function input(event)

	if event.type == "InputEventType_FirstPress" then

		if event.DeviceInput.button == "DeviceButton_left mouse button" then
			MESSAGEMAN:Broadcast("MouseLeftClick")
		end

	end

return false

end

local t = Def.ActorFrame{
  OnCommand = function(self)
    --SCREENMAN:GetTopScreen():AddInputCallback(input)
    self:diffusealpha(0)
    self:smooth(0.5)
    self:diffusealpha(1)
  end;
  --[[OffCommand = function(self)
    self:smooth(0.5)
    self:diffusealpha(0)
  end;]]
  MouseLeftClickMessageCommand = function(self)
    self:queuecommand("PlayTopPressedActor")
  end;
  PlayTopPressedActorCommand = function(self)
    playTopPressedActor()
    resetPressedActors()
  end;
  Def.Actor{
    OffCommand=cmd(sleep,4);
  };
};
t[#t+1] = LoadActor("_cursor");
t[#t+1] = Def.ActorFrame{
  LoadActor("StageInfo bg")..{
    InitCommand=cmd(FullScreen;cropright,1);
    OffCommand=cmd(sleep,2.2;decelerate,0.5;cropright,0);
  };
  Def.Sprite{
    InitCommand=cmd(halign,0;xy,SCREEN_LEFT,SCREEN_CENTER_Y;faderight,0.75;cropright,1;playcommand,"Set");
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      if song then
        if song:HasBackground() then
          self:LoadFromCurrentSongBackground()
        end
      end;
      self:zoomtowidth(1920)
      self:zoomtoheight(1080)
    end;
    OffCommand=cmd(sleep,2.3;decelerate,0.4;cropright,0);
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center);
  Def.Quad{
    InitCommand=cmd(setsize,SCREEN_WIDTH,184;diffuse,color("0,0,0,1");diffusealpha,0.75;cropright,1);
    OffCommand=cmd(sleep,2;decelerate,0.5;cropright,0);
  };
  --Progress Bar
  Def.Quad{
    InitCommand=cmd(y,36;setsize,SCREEN_WIDTH,2;diffuse,color("#747e82");cropright,1);
    OffCommand=cmd(sleep,2;decelerate,0.5;cropright,0);
  };
  Def.ActorFrame{
    Def.BitmapText{
      Font="_gotham light 48px";
      InitCommand=cmd(halign,0;xy,-920,-26;maxwidth,600;wrapwidthpixels,2^24;cropright,1;zoom,1.4;playcommand,"Set");
      SetCommand=function(self, param)
        local Song = GAMESTATE:GetCurrentSong();
  			if Song then
          self:settext(Song:GetDisplayFullTitle());
  			end;
  	   end;
     OffCommand=cmd(playcommand,"Set";sleep,2;decelerate,0.5;cropright,0);
     CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
   };
   Def.BitmapText{
     Font="_itc avant garde gothic lt Bold 16px";
     InitCommand=cmd(halign,0;x,-920;y,66;zoomx,1.1;zoomy,1.2;maxwidth,600;diffusealpha,0.5;wrapwidthpixels,2^24;cropright,1;settext,"Composed by");
     OffCommand=cmd(sleep,2;decelerate,0.3;cropright,0);
   };
    Def.BitmapText{
      Font="_itc avant garde gothic lt Bold 16px";
      InitCommand=cmd(halign,0;x,-770;y,66;zoom,1.2;maxwidth,600;wrapwidthpixels,2^24;cropright,1;playcommand,"Set");
      SetCommand=function(self, param)
        local Song = GAMESTATE:GetCurrentSong();
  			if Song then
          self:settext(Song:GetDisplayArtist());
        else
          self:settext("")
        end;
      end;
      OffCommand=cmd(playcommand,"Set";sleep,2.2;decelerate,0.2;cropright,0);
      CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
    };
  }
};

return t;
