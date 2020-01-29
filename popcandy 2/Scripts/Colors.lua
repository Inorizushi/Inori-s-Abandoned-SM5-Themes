function PlayerColor( pn )
	if pn == PLAYER_1 then return color("0.0,0.5,1.0,1") end
	if pn == PLAYER_2 then return color("0.0,1.0,0.3,1") end
	return color("1,1,1,1")
end

CustomDifficultyColor = {
	Beginner	= color("0,1,1,1"),	-- cyan
	Easy		= color("##F8A800"),		-- light yellow
	Medium		= color("#F800A0"),		-- light pink-red
	Hard		= color("#68F800"),		-- light green
	Challenge	= color("#70FFFF"),	-- purple blue
	Edit		= color("#7068F8"),		-- grey

	-- alternate names
	Light		= color("#F8A800"),			-- yellow
	Standard	= color("#F800A0"),			-- red
	Heavy		= color("#68F800"),			-- green
};

CustomDifficultyColorTick = {
	Beginner	= color("0,1,1,1"),	-- cyan
	Easy		= color("0.9,0.9,0,1"),		-- light yellow
	Medium		= color("1,0.1,0.1,1"),		-- light pink-red
	Hard		= color("0.2,1,0.2,1"),		-- light green
	Challenge	= color("0.2,0.6,1.0,1"),	-- purple blue
	Edit		= color("#7068F8"),		-- grey

	-- alternate names
	Light		= color("0.9,0.9,0,1"),			-- yellow
	Standard	= color("1,0.1,0.1,1"),			-- red
	Heavy		= color("0.2,1,0.2,1"),			-- green
};

function CustomDifficultyToColor( sCustomDifficulty )
	return CustomDifficultyColor[sCustomDifficulty] or color("#FFFFFF")
end

function CustomDifficultyToColorTick( sCustomDifficulty )
	return CustomDifficultyColorTick[sCustomDifficulty] or color("#FFFFFF")
end
