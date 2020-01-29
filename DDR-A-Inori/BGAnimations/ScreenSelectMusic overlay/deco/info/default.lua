local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,_screen.cx,_screen.cy-274);
  Def.ActorFrame{
    Name="BPMBar";
    InitCommand=cmd(xy,-14,40);
    LoadActor("music_select_bpm_base.png")..{
      InitCommand=cmd(diffusealpha,0.75);
    };
    LoadActor("music_select_bpm_base_line.png")..{
      InitCommand=cmd(diffusealpha,0.75);
    };
    LoadActor("music_select_bpm_word_bpm.png")..{
      InitCommand=cmd(xy,64,14;zoom,0.9);
    };
    Def.Sprite{
  		Texture="_meter 2x2.png";
  		InitCommand=cmd(zoom,0.6;xy,40,20;effectclock,'beatnooffset';SetAllStateDelays,1);
  	};
    LoadFont("Bpm")..{
    	InitCommand=cmd(zoom,1.4;xy,122,6);
    	SetCommand=function(self)
    		local song = GAMESTATE:GetCurrentSong();
    		if song then
    			local bpmtext;
    			bpmtext = song:GetDisplayBpms();
    			if bpmtext[1] == bpmtext[2] then
    				bpmtext = round(bpmtext[1],0);
    			else
    				bpmtext = string.format("%d\nx%3d",round(bpmtext[1],0),round(bpmtext[2],0));
    			end
    			self:horizalign(right);
    			self:vertalign(top);
    			self:settext(bpmtext);
    			self:visible(true);
    		else
    			self:visible(false);
    		end
    	end;
      CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
    };
  };
  Def.ActorFrame{
    Name="SongArtist Bar";
    LoadActor("ms_info_base_shadow.png")..{
      InitCommand=cmd(diffusealpha,0.75);
      OnCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.5");effectperiod,1.5);
    };
    LoadActor("ms_info_base.png")..{
      InitCommand=cmd(diffusealpha,0.75);
    };
    LoadActor("ms_info_base_line.png")..{
      InitCommand=cmd(diffusealpha,0.75);
    };
    Def.ActorFrame{
      InitCommand=cmd(xy,-97,-3);
      LoadActor("ms_info_song_name_base.png");
      LoadFont("_helveticaneuelt w1g 95 blk 24px")..{
        Name="Title";
        InitCommand=cmd(x,-234;halign,0;maxwidth,540;diffuse,color("0,0,0,1"));
        SetCommand=function(self)
          local song = GAMESTATE:GetCurrentSong();
          if song then
            local title = "";
            if song:GetDisplaySubTitle() == "" then
              title = song:GetDisplayMainTitle();
            else
              title = song:GetDisplayFullTitle();
            end;
            self:settext(title)
          end;
        end;
        CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
      };
      LoadFont("_helveticaneuelt w1g 95 blk 24px")..{
        Name="Artist";
        InitCommand=cmd(xy,-234,22;halign,0;maxwidth,500;zoomx,0.78;zoomy,0.65);
        SetCommand=function(self)
          local song = GAMESTATE:GetCurrentSong();
          if song then
            local artist = song:GetDisplayArtist();
            self:settext(artist)
          end;
        end;
        CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
      };
    };
    LoadActor("ms_info_base_shadow_mask.png")..{
      InitCommand=cmd(MaskSource,true);
    };
    LoadActor("ms_info_base_rader.png")..{
      InitCommand=cmd(diffusealpha,0.5;blend,Blend.Add;MaskDest;ztestmode,"ZTestMode_WriteOnFail");
      OnCommand=cmd(queuecommand,"Anim");
      AnimCommand=cmd(x,-400;sleep,4;linear,1.5;x,300;queuecommand,"Anim");
    };
    Def.ActorFrame{
      Name="InfoTab";
      InitCommand=cmd(xy,-307,-30);
      LoadActor("ms_info_tab_base.png")..{
        InitCommand=cmd(diffusealpha,0.75);
      };
      LoadActor("ms_info_tab_base_line.png")..{
        InitCommand=cmd(diffusealpha,0.75);
      };
      LoadActor("ms_info.png")..{
        InitCommand=cmd(x,-10);
      };
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(xy,242,18);
    LoadActor("00di_jk_frame_old.png");
    Def.Banner{
      SetCommand=function(self,params)
        local song = GAMESTATE:GetCurrentSong();
        local mw = SCREENMAN:GetTopScreen():GetChild("MusicWheel")
        if song then
          if song:HasJacket() then
            self:LoadBackground(song:GetJacketPath());
          elseif song:HasBackground() then
            self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
          else
            self:Load(THEME:GetPath("","Common fallback jacket (doubleres).png"))
          end;
        end;
        self:zoomtowidth(150);
        self:zoomtoheight(150);
      end;
      CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
    };
  };
};

return t;
