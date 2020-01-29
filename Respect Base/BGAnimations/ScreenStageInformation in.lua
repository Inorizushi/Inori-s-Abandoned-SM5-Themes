local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(fov,120);
  LoadActor("StageInfo bg")..{
    InitCommand=cmd(FullScreen);
  };
  Def.Sprite{
    InitCommand=cmd(halign,0;xy,SCREEN_LEFT,SCREEN_CENTER_Y;faderight,0.75;playcommand,"Set");
    SetCommand=function(self)
      self:LoadFromCurrentSongBackground()
      self:setsize(1920,1080);
    end;
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center);
  Def.Quad{
    InitCommand=cmd(setsize,SCREEN_WIDTH,184;diffuse,color("0,0,0,1");diffusealpha,0.75;);
  };
  --Progress Bar
  Def.Quad{
    InitCommand=cmd(y,36;setsize,SCREEN_WIDTH,2;diffuse,color("#747e82"););
  };
  --Bar Tick
  Def.Quad{
    InitCommand=cmd(halign,1;xy,-960,36;setsize,SCREEN_WIDTH,4;);
    OnCommand=cmd(decelerate,4;x,960;sleep,2);
  };
  Def.RollingNumbers{
    Font="_itc avant garde gothic lt Bold 16px";
    InitCommand=cmd(halign,1;xy,920,20);
    OnCommand= function(self)
  		self:Load("RollingNumbersStagePercent"):targetnumber(100)
  	end;
  };
  Def.BitmapText{
    Font="_itc avant garde gothic lt Bold 16px";
    InitCommand=cmd(halign,1;xy,940,20;settext,"%");
  };
  Def.ActorFrame{
    Def.BitmapText{
      Font="_gotham light 48px";
      InitCommand=cmd(halign,0;xy,-920,-26;maxwidth,600;wrapwidthpixels,2^24;zoom,1.4;playcommand,"Set");
      SetCommand=function(self, param)
        local Song = GAMESTATE:GetCurrentSong();
  			if Song then
          self:settext(Song:GetDisplayFullTitle());
  			end;
  	   end;
   };
   Def.BitmapText{
     Font="_itc avant garde gothic lt Bold 16px";
     InitCommand=cmd(halign,0;x,-920;y,66;zoomx,1.1;zoomy,1.2;maxwidth,600;diffusealpha,0.5;wrapwidthpixels,2^24;;settext,"Composed by");
     OnCommand=cmd(sleep,2;decelerate,0.3;cropright,0);
   };
    Def.BitmapText{
      Font="_itc avant garde gothic lt Bold 16px";
      InitCommand=cmd(halign,0;x,-770;y,66;zoom,1.2;maxwidth,600;wrapwidthpixels,2^24;playcommand,"Set");
      SetCommand=function(self, param)
        local Song = GAMESTATE:GetCurrentSong();
  			if Song then
          self:settext(Song:GetDisplayArtist());
        else
          self:settext("")
        end;
      end;
    };
  }
};

return t;
