local args = {...}

local function m(metric)
	metric = metric:gsub("PN", ToEnumShortString(args[1]))
	return THEME:GetMetric(Var "LoadingScreen",metric)
end

local t = Def.ActorFrame {};

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do

local stream = Def.ActorFrame{
  LoadActor("g_radar_dataitem_base.png");
  LoadActor("g_radar_dataitem_wd_stream.png");
  Def.BitmapText{
    Name="Streamnum";
    Font="_russell square 16px";
    InitCommand=cmd(zoom,0.9;halign,1;xy,24,22;strokecolor,color("#000000"));
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      if song then
        local cSteps = GAMESTATE:GetCurrentSteps(pn);
        local SValue = cSteps:GetRadarValues(pn):GetValue('RadarCategory_Stream');
        local StreamDDRNum = math.round(SValue*100);
          self:settext(StreamDDRNum);
      end;
    end;
  };
};

local chaos = Def.ActorFrame{
  LoadActor("g_radar_dataitem_base.png");
  LoadActor("g_radar_dataitem_wd_chaos.png");
  Def.BitmapText{
    Name="chaosnum";
    Font="_russell square 16px";
    InitCommand=cmd(zoom,0.9;halign,1;xy,24,22;strokecolor,color("#000000"));
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      if song then
        local cSteps = GAMESTATE:GetCurrentSteps(pn);
        local SValue = cSteps:GetRadarValues(pn):GetValue('RadarCategory_Chaos');
        local ChaosDDRNum = math.round(SValue*100);
          self:settext(ChaosDDRNum);
      end;
    end;
  };
};

local freeze = Def.ActorFrame{
  LoadActor("g_radar_dataitem_base.png");
  LoadActor("g_radar_dataitem_wd_freeze.png");
  Def.BitmapText{
    Name="freezeenum";
    Font="_russell square 16px";
    InitCommand=cmd(zoom,0.9;halign,1;xy,24,22;strokecolor,color("#000000"));
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      if song then
        local cSteps = GAMESTATE:GetCurrentSteps(pn);
        local SValue = cSteps:GetRadarValues(pn):GetValue('RadarCategory_Freeze');
        local FreezeDDRNum = math.round(SValue*100);
          self:settext(FreezeDDRNum);
      end;
    end;
  };
};

local voltage = Def.ActorFrame{
  LoadActor("g_radar_dataitem_base.png");
  LoadActor("g_radar_dataitem_wd_voltage.png");
  Def.BitmapText{
    Name="voltageenum";
    Font="_russell square 16px";
    InitCommand=cmd(zoom,0.9;halign,1;xy,18,22;strokecolor,color("#000000"));
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      if song then
        local cSteps = GAMESTATE:GetCurrentSteps(pn);
        local SValue = cSteps:GetRadarValues(pn):GetValue('RadarCategory_Voltage');
        local VoltageDDRNum = math.round(SValue*100);
          self:settext(VoltageDDRNum);
      end;
    end;
  };
};

local air = Def.ActorFrame{
  LoadActor("g_radar_dataitem_base.png");
  LoadActor("g_radar_dataitem_wd_air.png");
  Def.BitmapText{
    Name="airnum";
    Font="_russell square 16px";
    InitCommand=cmd(zoom,0.9;halign,1;xy,18,22;strokecolor,color("#000000"));
    SetCommand=function(self)
      local song = GAMESTATE:GetCurrentSong()
      if song then
        local cSteps = GAMESTATE:GetCurrentSteps(pn);
        local SValue = cSteps:GetRadarValues(pn):GetValue('RadarCategory_Air');
        local AirDDRNum = math.round(SValue*100);
          self:settext(AirDDRNum);
      end;
    end;
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=function(s)
    s:player(pn):x(m "GrooveRadarPN_DefaultX"):y(m "GrooveRadarPN_DefaultY")
  end;
  CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
  CurrentStepsP1ChangedMessageCommand=cmd(queuecommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(queuecommand,"Set");
  LoadActor("g_radar_circle_shape.png");
  stream..{
    InitCommand=cmd(xy,0,-80);
  };
  voltage..{
    InitCommand=cmd(xy,-80,-34);
  };
  chaos..{
    InitCommand=cmd(xy,80,-34);
  };
  freeze..{
    InitCommand=cmd(xy,68,34);
  };
  air..{
    InitCommand=cmd(xy,-68,34);
  };
};
end;
return t;
