Branch.GetArcadeStartScreen=function()
	-- If we havn't loaded the input driver, do that first; until this finishes, we have
	-- no input or lights.
	if GetInputType() == "" then return "ScreenArcadeStart" end

	if not PROFILEMAN:GetMachineProfile():GetSaved().TimeIsSet then
		return "ScreenSetTime"
	end

	return "ScreenIntro"
end

Branch.ScreenTitleBranch=function()
	if GAMESTATE:GetCoinMode() == COIN_MODE_HOME then return "ScreenTitleMenu" end
	return "ScreenTitleJoin"
end

Branch.GetGameplayNextScreen=function()
	if GAMESTATE:IsSyncDataChanged() then
		return "ScreenSaveSync"
	end
	return SelectEvaluationScreen()
end

Branch.SelectEvaluationScreen=function()
	Mode = PlayModeName()
	if( Mode == "Regular" ) then return "ScreenEvaluationStage" end
	if( Mode == "Nonstop" ) then return "ScreenEvaluationNonstop" end
	if( Mode == "Oni" ) then return "ScreenEvaluationOni" end
end

Branch.SelectEndingScreen=function()
	if GAMESTATE:GetEnv("ForceGoodEnding") == "1" or GetBestFinalGrade() <= GRADE_TIER05 then return "ScreenEndingGood" end
	return "ScreenEndingNormal"
end

Branch.SongSelectionScreen=function()
	local s = "ScreenSelectMusic";
	if GAMESTATE:IsCourseMode() then s = s.."Course" end
	return s
end

Branch.GetSetTimeNextScreen=function()
	PROFILEMAN:GetMachineProfile():GetSaved().TimeIsSet = true
	PROFILEMAN:SaveMachineProfile()
	return "ScreenOptionsMenu"
end
