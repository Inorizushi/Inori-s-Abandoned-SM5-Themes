function TextBannerAfterSet(self,param)
	local Title=self:GetChild("Title")
	local Subtitle=self:GetChild("Subtitle")
	local Artist=self:GetChild("Artist")

	if Subtitle:GetText() == "" then
		Title:maxwidth(224)
		Title:x(-120)
		Title:y(-2)
		Title:zoom(0.75)

		Subtitle:visible(false)

		Artist:maxwidth(300)
		Artist:x(185)
		Artist:y(8)
		Artist:zoom(0.5)
	else
		Title:maxwidth(224)
		Title:zoom(0.65)
		Title:x(-120)
		Title:y(-8)

		-- subtitle below title
		Subtitle:visible(true)
		Subtitle:zoom(0.6)
		Subtitle:maxwidth(240)
		Subtitle:x(-120)
		Subtitle:y(5)

		Artist:maxwidth(300)
		Artist:x(185)
		Artist:y(10)
		Artist:zoom(0.5)
	end

	-- special easter eggs!
	--if GAMESTATE:Dopefish() then
		--if Title:GetText() == "hussiladi" then
			--Title:settext("yussulibi")
			--Artist:settext("soccer")
			-- Europeans: you may comment the above line and uncomment this one:
			--Artist:settext("football")
			-- however, it ruins the joke, because "socer" isn't in the word
			-- "football".
		--end

		-- this one time my hard drive was acting weird and oxyd's background
		-- file showed up with a 69TB filesize.
		--if Title:GetText() == "Oxyd" then
			--Title:settext("Oxyd (69TB Mix)")
			--Artist:settext("syntax (feat. AJ's busted hard drive)")
		--end

		-- okay this one probably doesn't make sense.
		-- just go with me on this one, I'm drunk
		--if Title:GetText() == "rasen" then
			--Title:settext("raisin")
			--Artist:settext("syntax error")
		--end
	--end
end

function TextBannerAfterSetCourse(self,param)
	local Title=self:GetChild("Title")
	local Subtitle=self:GetChild("Subtitle")
	local Artist=self:GetChild("Artist")

	if Subtitle:GetText() == "" then
		Title:maxwidth(224)
		Title:x(-90)
		Title:y(-6)
		Title:zoom(0.75)

		Subtitle:visible(false)

		Artist:maxwidth(266)
		Artist:x(-90)
		Artist:y(8)
		Artist:zoom(0.5)
	else
		Title:maxwidth(224)
		Title:zoom(0.6)
		Title:x(-90)
		Title:y(-10)

		-- subtitle below title
		Subtitle:visible(true)
		Subtitle:zoom(0.5)
		Subtitle:maxwidth(360)
		Subtitle:x(-90)
		Subtitle:y(1)

		Artist:maxwidth(266)
		Artist:x(-90)
		Artist:y(10)
		Artist:zoom(0.5)
	end

-- special easter eggs!
--if GAMESTATE:Dopefish() then
	--if Title:GetText() == "hussiladi" then
		--Title:settext("yussulibi")
		--Artist:settext("soccer")
		-- Europeans: you may comment the above line and uncomment this one:
		--Artist:settext("football")
		-- however, it ruins the joke, because "socer" isn't in the word
		-- "football".
	--end

	-- this one time my hard drive was acting weird and oxyd's background
	-- file showed up with a 69TB filesize.
	--if Title:GetText() == "Oxyd" then
		--Title:settext("Oxyd (69TB Mix)")
		--Artist:settext("syntax (feat. AJ's busted hard drive)")
	--end

	-- okay this one probably doesn't make sense.
	-- just go with me on this one, I'm drunk
	--if Title:GetText() == "rasen" then
		--Title:settext("raisin")
		--Artist:settext("syntax error")
	--end
--end
end

local difficultyToIconIndex = {
	Difficulty_Beginner		= 0,
	Difficulty_Easy			= 1,
	Difficulty_Medium		= 2,
	Difficulty_Hard			= 3,
	Difficulty_Challenge 	= 4,
	Difficulty_Edit			= 5
}
function GetDifficultyIconFrame(diff) return difficultyToIconIndex[diff] or difficultyToIconIndex['Difficulty_Edit'] end

function LoadStepsDisplayGameplayFrame(self,player)
	local difficultyStates = {
		Difficulty_Beginner	 = 0,
		Difficulty_Easy		 = 2,
		Difficulty_Medium	 = 4,
		Difficulty_Hard		 = 6,
		Difficulty_Challenge = 8,
		Difficulty_Edit		 = 10,
	};
	local selection;
	if GAMESTATE:IsCourseMode() then
		-- get steps of current course entry
		selection = GAMESTATE:GetCurrentTrail(player);
		local entry = selection:GetTrailEntry(GAMESTATE:GetLoadingCourseSongIndex()+1)
		selection = entry:GetSteps()
	else
		selection = GAMESTATE:GetCurrentSteps(player);
	end;
	local diff = selection:GetDifficulty()
	local state = difficultyStates[diff] or 10;
	if player == PLAYER_2 then state = state + 1; end;
	return state;
end;

-- if you don't want to use the side graphics, set this to false:
local useScreenSides = true
-- but be warned: widescreen mode isn't complete yet.
function GetOverlayScreens()
	local ret = ""
	if useScreenSides then ret = "Sides," end
	return ret.."ScreenSystemLayer,ScreenSyncOverlay,ScreenStatsOverlay,ScreenDebugOverlay,ScreenInstallOverlay"
end

function Actor:scale_or_crop_background()
	if PREFSMAN:GetPreference("StretchBackgrounds") then
		self:cropto(SCREEN_WIDTH, SCREEN_HEIGHT)
	else
		local graphicAspect = self:GetWidth()/self:GetHeight()
		self:zoomto(SCREEN_HEIGHT*graphicAspect,SCREEN_HEIGHT)
	end
end

-- summary evaluation banner handling (for 1-5 stages)
-- ganked from my ddr 5th mix port
local summaryBannerX = {
	MaxStages1 = { SCREEN_CENTER_X },
	MaxStages2 = {
		SCREEN_CENTER_X+45,
		SCREEN_CENTER_X-45
	},
	MaxStages3 = {
		SCREEN_CENTER_X+60,
		SCREEN_CENTER_X,
		SCREEN_CENTER_X-60
	},
	MaxStages4 = {
		SCREEN_CENTER_X+45,
		SCREEN_CENTER_X+15,
		SCREEN_CENTER_X-15,
		SCREEN_CENTER_X-45
	},
	MaxStages5 = {
		SCREEN_CENTER_X+60,
		SCREEN_CENTER_X+30,
		SCREEN_CENTER_X,
		SCREEN_CENTER_X-30,
		SCREEN_CENTER_X-60
	}
}

local summaryBannerY = {
	MaxStages1 = { SCREEN_CENTER_Y-140 },
	MaxStages2 = {
		SCREEN_CENTER_Y-130,
		SCREEN_CENTER_Y-150
	},
	MaxStages3 = {
		SCREEN_CENTER_Y-120,
		SCREEN_CENTER_Y-140,
		SCREEN_CENTER_Y-160
	},
	MaxStages4 = {
		SCREEN_CENTER_Y-125,
		SCREEN_CENTER_Y-135,
		SCREEN_CENTER_Y-145,
		SCREEN_CENTER_Y-155
	},
	MaxStages5 = {
		SCREEN_CENTER_Y-120,
		SCREEN_CENTER_Y-130,
		SCREEN_CENTER_Y-140,
		SCREEN_CENTER_Y-150,
		SCREEN_CENTER_Y-160
	}
}

function GetSummaryBannerX(num)
	local maxStages = PREFSMAN:GetPreference('SongsPerPlay')

	-- check how many stages were played...
	local playedStages = STATSMAN:GetStagesPlayed()
	if playedStages < maxStages then
		-- long versions and/or marathons were involved.
		if playedStages == 1 then return summaryBannerX.MaxStages1[1]
		elseif playedStages == 2 then return summaryBannerX.MaxStages2[num]
		elseif playedStages == 3 then return summaryBannerX.MaxStages3[num]
		elseif playedStages == 4 then return summaryBannerX.MaxStages4[num]
		end
	elseif playedStages > maxStages then
		-- extra stages
		if playedStages == 1 then return summaryBannerX.MaxStages1[1]
		elseif playedStages == 2 then return summaryBannerX.MaxStages2[num]
		elseif playedStages == 3 then return summaryBannerX.MaxStages3[num]
		elseif playedStages == 4 then return summaryBannerX.MaxStages4[num]
		elseif playedStages == 5 then return summaryBannerX.MaxStages5[num]
		end
	else
		-- normal behavior
		if maxStages == 1 then return summaryBannerX.MaxStages1[1]
		elseif maxStages == 2 then return summaryBannerX.MaxStages2[num]
		elseif maxStages == 3 then return summaryBannerX.MaxStages3[num]
		elseif maxStages == 4 then return summaryBannerX.MaxStages4[num]
		elseif maxStages == 5 then return summaryBannerX.MaxStages5[num]
		end
	end
end

function GetSummaryBannerY(num)
	local maxStages = PREFSMAN:GetPreference('SongsPerPlay')

	-- check how many stages were played...
	local playedStages = STATSMAN:GetStagesPlayed()
	if playedStages < maxStages then
		-- long versions and/or marathons were involved.
		if playedStages == 1 then return summaryBannerY.MaxStages1[1]
		elseif playedStages == 2 then return summaryBannerY.MaxStages2[num]
		elseif playedStages == 3 then return summaryBannerY.MaxStages3[num]
		elseif playedStages == 4 then return summaryBannerY.MaxStages4[num]
		end
	elseif playedStages > maxStages then
		-- extra stages
		if playedStages == 1 then return summaryBannerY.MaxStages1[1]
		elseif playedStages == 2 then return summaryBannerY.MaxStages2[num]
		elseif playedStages == 3 then return summaryBannerY.MaxStages3[num]
		elseif playedStages == 4 then return summaryBannerY.MaxStages4[num]
		elseif playedStages == 5 then return summaryBannerY.MaxStages5[num]
		end
	else
		-- normal behavior
		if maxStages == 1 then return summaryBannerY.MaxStages1[1]
		elseif maxStages == 2 then return summaryBannerY.MaxStages2[num]
		elseif maxStages == 3 then return summaryBannerY.MaxStages3[num]
		elseif maxStages == 4 then return summaryBannerY.MaxStages4[num]
		elseif maxStages == 5 then return summaryBannerY.MaxStages5[num]
		end
	end
end

-- ScreenDifficulty item OffCommands
local delays = {
	0.3, 0.7, 0.9,	-- page 1 (Light, Standard, Heavy)
	0.5, -- page 2 (Oni)
}

-- "choice" is indexed by 0; the "item" param begins at 1
function Actor:DifficultyItemOff(item)
	local top = SCREENMAN:GetTopScreen()
	if top then
		local choice = top:GetSelectionIndex(GAMESTATE:GetMasterPlayerNumber())
		if choice > 3 and item > 4 then
			-- page 2
			self:sleep(delays[item])
			self:accelerate(0.4)
			self:addx(-SCREEN_WIDTH*1.25)
		else
			if item < 5 then
				-- page 1
				self:sleep(delays[item])
				self:accelerate(0.4)
				self:addx(-SCREEN_WIDTH*1.25)
			end
		end
	end
end
