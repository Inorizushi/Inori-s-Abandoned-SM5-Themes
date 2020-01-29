Branch.AfterInit = function()
	if GAMESTATE:GetCoinMode() == 'CoinMode_Home' then
		return Branch.TitleMenu()
	else
		return "ScreenLogo"
	end
end

Branch.TitleMenu = function()
	-- home mode is the most assumed use of sm-ssc.
	if GAMESTATE:GetCoinMode() == "CoinMode_Home" then
		return "ScreenTitleMenu"
	end
end
