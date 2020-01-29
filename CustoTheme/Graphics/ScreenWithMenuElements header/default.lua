local screenName = Var "LoadingScreen"
local headerTextImage

--this should probably be a metric
if screenName == "ScreenSelectMusic" then
    headerTextImage = "Music (doubleres).png"

elseif string.find(screenName, "Options") then
    headerTextImage = "Options (doubleres).png"

elseif screenName == "ScreenMapControllers" then
	headerTextImage = "Options (doubleres).png"

elseif screenName == "ScreenSelectStyle" then
    headerTextImage = "Style (doubleres).png"

elseif screenName == "ScreenSelectPlayMode" then
    headerTextImage = "Mode (doubleres).png"

elseif screenName == "ScreenSelectProfile" then
	headerTextImage = "profile (doubleres).png"

elseif screenName == "ScreenDataSaveSummary" then
	headerTextImage = "save (doubleres).png"

elseif string.find(screenName, "ScreenEvaluation")
  or screenName == "ScreenNetEvaluation" then
	headerTextImage = "eval (doubleres).png"
end

--Base Anchoring
local out = Def.ActorFrame{
	InitCommand=function(self) self:SetUpdateFunction(UpdateAni) end;
	LoadActor("new (doubleres)")..{
		InitCommand=function(self)
			self:x(SCREEN_LEFT-1.2):halign(0);
		end;
	};
}

--Text Anchoring
if headerTextImage then
	table.insert(out,LoadActor(headerTextImage)..{
		InitCommand=function(self)
			self:y(8):valign(1):x(SCREEN_LEFT+123)
		end;
	})
end

return out
