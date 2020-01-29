--[[
This script was taken from KENp's DDR X2 theme
and was recoded by FlameyBoy and Inorizushi
]]--

local ProfileInfoCache = {}
setmetatable(ProfileInfoCache, {__index =
function(table, ind)
    local out = {}
    local prof = PROFILEMAN:GetLocalProfileFromIndex(ind-1)
    out.DisplayName = prof:GetDisplayName()
    out.UserTable = prof:GetUserTable()
    rawset(table, ind, out)
    return out
end
})

--�d�����e����---------------------------
function LoadCard(cColor,cColor2,Player,IsJoinFrame)
	local t = Def.ActorFrame {
		LoadActor( THEME:GetPathG("","ScreenSelectProfile/BG01") ) .. {
			InitCommand=function(self)
				(cmd(shadowlength,0;zoomy,0))(self);
			end;
			OnCommand=cmd(sleep,0.3;linear,0.3;zoomy,1;);
			OffCommand=function(self)
				if IsJoinFrame then
					(cmd(linear,0.1;zoomy,0))(self);
				else
					(cmd(sleep,0.3;linear,0.1;zoomy,0))(self);
				end
			end;
		};
    LoadActor( THEME:GetPathG("","ScreenSelectProfile/BG02") ) .. {
			InitCommand=function(self)
				(cmd(y,-40;zoomy,0))(self);
			end;
			OnCommand=cmd(sleep,0.3;linear,0.3;zoomy,1;);
			OffCommand=function(self)
				if IsJoinFrame then
					(cmd(linear,0.1;zoomy,0))(self);
				else
					(cmd(sleep,0.3;linear,0.1;zoomy,0))(self);
				end
			end;
		};
    LoadActor( THEME:GetPathG("","ScreenSelectProfile/card") )..{
      InitCommand=cmd(diffusealpha,0;zoom,0.75;y,-54);
      OnCommand=function(self)
        if IsJoinFrame then
          (cmd(linear,0.3;diffusealpha,0))(self);
        else
          self:sleep(0.7):linear(0.1):diffusealpha(1):zoom(1.1):linear(0.1):zoom(1)
        end
      end;
      OffCommand=function(self)
        self:diffusealpha(0)
      end;
    };
    Def.ActorFrame{
      Name="Topper";
      InitCommand=function(self)
        (cmd(shadowlength,0))(self);
      end;
      OnCommand=cmd(y,0;sleep,0.3;linear,0.3;y,-238;);
      OffCommand=function(self)
				if IsJoinFrame then
					(cmd(linear,0.1;y,0;sleep,0;diffusealpha,0))(self);
				else
					(cmd(sleep,0.3;linear,0.1;y,0;sleep,0;diffusealpha,0))(self);
				end
			end;
      LoadActor( THEME:GetPathG("","ScreenSelectProfile/BGTOP") )..{
        InitCommand=cmd(valign,1);
      };
      Def.Sprite{
        InitCommand=function(self)
          self:y(-26)
          if Player == PLAYER_1 then
            self:Load(THEME:GetPathG("","ScreenSelectProfile/PLAYER_1"))
          else
            self:Load(THEME:GetPathG("","ScreenSelectProfile/PLAYER_2"))
          end;
        end;
      };
    };
    Def.ActorFrame{
      Name="Bottom";
      InitCommand=function(self)
        (cmd(shadowlength,0))(self);
      end;
      OnCommand=cmd(y,0;sleep,0.3;linear,0.3;y,224;);
      OffCommand=function(self)
				if IsJoinFrame then
					(cmd(linear,0.1;y,0;sleep,0;diffusealpha,0))(self);
				else
					(cmd(sleep,0.3;linear,0.1;y,0;sleep,0;diffusealpha,0))(self);
				end
			end;
      LoadActor( THEME:GetPathG("","ScreenSelectProfile/BGBOTTOM") )..{
        InitCommand=cmd(valign,0);
      };
      LoadActor( THEME:GetPathG("","ScreenSelectProfile/start game") )..{
        InitCommand=cmd(valign,0;y,18;diffusealpha,0);
        OnCommand=cmd(sleep,0.8;diffusealpha,1);
      };
    };
	};

	return t
end

function LoadPlayerStuff(Player)

	local t = {};
	local pn = (Player == PLAYER_1) and 1 or 2;


	t[#t+1] = Def.ActorFrame {
		Name = 'JoinFrame';
		LoadCard(Color('Outline'),color('0,0,0,0'),Player,true);

		LoadActor( THEME:GetPathG("ScreenSelectProfile/ScreenSelectProfile","Start") ) .. {
			InitCommand=cmd(zoomy,0;diffuseshift;effectcolor1,Color('White');effectcolor2,color("#A5A6A5"));
			OnCommand=cmd(zoomy,0;zoomx,0;sleep,0.5;linear,0.1;zoomx,1;zoomy,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};

	};

	t[#t+1] = Def.ActorFrame {
		Name = 'BigFrame';
		LoadCard(PlayerColor(),color('1,1,1,1'),Player,false);
	};
	t[#t+1] = Def.ActorFrame {
		Name = 'SmallFrame';
		InitCommand=cmd(y,5);
	};
	t[#t+1] = Def.ActorScroller{
		Name = 'Scroller';
		NumItemsToDraw=1;

		OnCommand=cmd(draworder,1000;y,5;SetFastCatchup,true;SetMask,0,29;SetSecondsPerItem,0.15);
		TransformFunction=function(self, offset, itemIndex, numItems)
			local focus = scale(math.abs(offset),0,2,1,0);
			self:visible(false);
			self:y(math.floor( offset*20 ));

		end;
	};


	t[#t+1] = Def.ActorFrame {
		Name = "EffectFrame";
	};

	--�U���d��-----------------
	t[#t+1] = LoadFont("ProfileText 24px") .. {
		Name = 'SelectedProfileText';
    InitCommand=function(self)
      (cmd(uppercase,true;xy,-170,-66;halign,0;zoomy,0.7;diffusealpha,0;maxwidth,400))(self);
    end;
		OnCommand=cmd(sleep,0.7;linear,0.2;diffusealpha,1);
    OffCommand=function(self)
      self:diffusealpha(0)
    end;
	};

	t[#t+1] = LoadFont("ProfileText 24px") .. {
		Name = 'selectPlayerUID';
		InitCommand=cmd(zoomy,0.7;diffusealpha,0;xy,54,-28);
    OnCommand=function(self)
      if IsJoinFrame then
        (cmd(linear,0.3;diffusealpha,0))(self);
      else
        self:sleep(0.7):linear(0.1):diffusealpha(1):zoomx(1.5):zoomy(1.2):linear(0.1):zoomx(1.25):zoomy(0.8)
      end
    end;
    OffCommand=function(self)
      self:diffusealpha(0)
    end;
	};

	return t;
end;

function UpdateInternal3(self, Player)

	local pn = (Player == PLAYER_1) and 1 or 2;
	local frame = self:GetChild(string.format('P%uFrame', pn));
	local scroller = frame:GetChild('Scroller');
	local seltext = frame:GetChild('SelectedProfileText');
	local joinframe = frame:GetChild('JoinFrame');
	local smallframe = frame:GetChild('SmallFrame');
	local bigframe = frame:GetChild('BigFrame');
	local selectPlayerUID = frame:GetChild('selectPlayerUID');
	--MyGrooveRadar
	local selPlayerUID;

	local PcntLarger;
	--local selMostCoursePlayed = frame:GetChild('selectedMostCoursePlayed');
	if GAMESTATE:IsHumanPlayer(Player) then
		frame:visible(true);
		if MEMCARDMAN:GetCardState(Player) == 'MemoryCardState_none' then
			--using profile if any
			joinframe:visible(false);
			smallframe:visible(true);
			bigframe:visible(false);
			seltext:visible(true);
			scroller:visible(true);
      selectPlayerUID:visible(true);

			local ind = SCREENMAN:GetTopScreen():GetProfileIndex(Player);


			if ind > 0 then
				local profile = PROFILEMAN:GetLocalProfileFromIndex(ind-1);

				bigframe:visible(true);
				scroller:SetDestinationItem(ind-1);
				seltext:settext(ProfileInfoCache[ind].DisplayName);

				selPlayerUID = PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetGUID();
				selectPlayerUID:settext(string.upper(string.sub(selPlayerUID,1,4).."-"..string.sub(selPlayerUID,5,8)));

				local profileID = PROFILEMAN:GetLocalProfileIDFromIndex(ind-1)
				local prefs = ProfilePrefs.Read(profileID)
				if SN3Debug then
					ProfilePrefs.Save(profileID)
				end

			else
				if SCREENMAN:GetTopScreen():SetProfileIndex(Player, 1) then
					bigframe:visible(false);
					scroller:SetDestinationItem(0);
					self:queuecommand('UpdateInternal2');
				else
					joinframe:visible(false);
					smallframe:visible(false);
					bigframe:visible(false);
					scroller:visible(false);
					seltext:settext('No profile');
					selectPlayerUID:settext('------------');
				end;
			end;
		else
			--using card
			smallframe:visible(false);
			scroller:visible(false);
			seltext:settext('CARD');
			SCREENMAN:GetTopScreen():SetProfileIndex(Player, 0);
		end;
	else
		joinframe:visible(true);
		scroller:visible(false);
		seltext:visible(false);
		selectPlayerUID:visible(false);
		smallframe:visible(false);
		bigframe:visible(false);
	end;
end;

local screen = Var("LoadingScreen")

--�D�{��
local t = Def.ActorFrame {

	StorageDevicesChangedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			MESSAGEMAN:Broadcast("StartButton");
			if not GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -1);
			else
				SCREENMAN:GetTopScreen():Finish();
			end;
		end;
		if params.Name == 'Up' or params.Name == 'Up2' or params.Name == 'DownLeft' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 1 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind - 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Down' or params.Name == 'Down2' or params.Name == 'DownRight' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 0 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind + 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Back' then
			if GAMESTATE:GetNumPlayersEnabled()==0 then
				SCREENMAN:GetTopScreen():Cancel();
			else
				MESSAGEMAN:Broadcast("BackButton");
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -2);
			end;
		end;
	end;

	PlayerJoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	PlayerUnjoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	OnCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	UpdateInternal2Command=function(self)
		UpdateInternal3(self, PLAYER_1);
		UpdateInternal3(self, PLAYER_2);
	end;

	children = {
		Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+14);
      OnCommand=cmd(zoomx,0;linear,0.2;zoomx,1);
			OffCommand=cmd();
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd(zoomx,1;zoomy,0.15;linear,0.175;zoomy,1;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_1);
		};
		Def.ActorFrame {
			Name = 'P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+320;y,SCREEN_CENTER_Y+14);
      OnCommand=cmd(zoomx,0;linear,0.2;zoomx,1);
			OffCommand=cmd();
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd(zoomx,1;zoomy,0.15;linear,0.175;zoomy,1;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_2);
		};
		-- sounds
		LoadActor( THEME:GetPathS("Common","start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("","Profile_start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Common","cancel") )..{
			BackButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("","Profile_Move") )..{
			DirectionButtonMessageCommand=cmd(play);
		};
	};
};


return t;
