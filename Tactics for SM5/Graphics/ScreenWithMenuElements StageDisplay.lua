local curScreen = Var "LoadingScreen";
local curStage = GAMESTATE:GetCurrentStage();
local curStageIndex = GAMESTATE:GetCurrentStageIndex();
local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadFont("_FFT2 reg.ini") .. {
		BeginCommand=function(self)
			local top = SCREENMAN:GetTopScreen()
			if top then
				if not string.find(top:GetName(),"ScreenEvaluation") then
					curStageIndex = curStageIndex + 1
				end
			end
			self:halign(1):zoomx(1.25)
			self:playcommand("Set")
		end;
		SetCommand=function(self)
			if GAMESTATE:GetCurrentCourse() then
				self:settext( curStageIndex+1 .. " / " .. GAMESTATE:GetCurrentCourse():GetEstimatedNumStages() );
			elseif GAMESTATE:IsEventMode() then
				self:settext("Event");
			else
				 self:settextf("Round %s", curStageIndex);
			end;
		end;
	};
};
return t
