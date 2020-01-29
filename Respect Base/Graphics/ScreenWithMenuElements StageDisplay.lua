local curScreen = Var "LoadingScreen";
local curStage = GAMESTATE:GetCurrentStage();
local curStageIndex = GAMESTATE:GetCurrentStageIndex();
local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadFont("_itc avant garde gothic lt Bold 16px") .. {
		InitCommand=cmd(y,-1;shadowlength,1;);
		BeginCommand=function(self)
			local top = SCREENMAN:GetTopScreen()
			if top then
				if not string.find(top:GetName(),"ScreenEvaluation") then
					curStageIndex = curStageIndex + 1
				end
			end
			self:playcommand("Set")
		end;
		SetCommand=function(self)
			if GAMESTATE:GetCurrentCourse() then
				self:settext( curStageIndex+1 .. " / " .. GAMESTATE:GetCurrentCourse():GetEstimatedNumStages() );
			else
				 self:settext("STAGE "..curStageIndex);
			end;
			-- StepMania is being stupid so we have to do this here;
			self:diffuse(StageToColor(curStage));
		end;
	};
};
return t
