-- gameplay score frame

-- The math.floor(10000*aspect) trick is used to circumvent float precision problems.
local aspectRatioSuffix = {
	[math.floor(10000*4/3)] = " 4_3",
	[math.floor(10000*16/9)] = " 16_9",
	[math.floor(10000*16/10)] = " 16_9"
}
--fall back on the 4:3 frame if we don't know about this aspect ratio at all
setmetatable(aspectRatioSuffix,{__index=function() return " standard" end})
local suffix = aspectRatioSuffix[math.floor(10000*PREFSMAN:GetPreference("DisplayAspectRatio"))]

local scoreFrame = "normal"

-- todo: show oni on life meter battery as well
if GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
	scoreFrame = "oni"
end

if GAMESTATE:IsExtraStage() or GAMESTATE:IsExtraStage2() then scoreFrame = "extra" end

-- fall back on the 4:3 frame if there's no frame available for this aspect ratio
if ResolveRelativePath(scoreFrame..suffix,1,true) then
	scoreFrame = scoreFrame .. suffix
else
	Warn("ScreenGameplay scoreFrame: missing frame \""..scoreFrame..suffix.."\". Using fallback assets.")
	scoreFrame = scoreFrame.." 4_3"
end

local t = Def.ActorFrame{
	LoadActor(scoreFrame);
	LoadActor("BPMBar");
	LoadFont("Combo numbers")..{
		InitCommand=cmd(y,1);
		OnCommand=cmd(zoom,0.3;shadowlength,1;draworder,12;addy,100;decelerate,1;addy,-100;);
		ComboChangedMessageCommand=function (self)
			local combo1 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo();
			local combo2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):MaxCombo();
			if GAMESTATE:GetNumPlayersEnabled() == 2 then
				if combo1 > combo2 then
					self:settext(combo1);
				elseif combo1 < combo2 then
					self:settext(combo2);
				else
					--fallback to player 1 because if the combo isn't different then both players haven't missed yet.
					self:settext(combo1);
				end;
			else
				if GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 then
					self:settext(combo1);
				elseif GAMESTATE:GetMasterPlayerNumber() == PLAYER_2 then
					self:settext(combo2);
				end;
			end;
		end;
	};
};

return t;
