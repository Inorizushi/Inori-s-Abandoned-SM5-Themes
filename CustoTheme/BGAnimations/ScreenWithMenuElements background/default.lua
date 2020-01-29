local t = Def.ActorFrame{
};
local p = {
	red = color("1,0,0,0.812"),
	green = color("0,1,0,0.812"),
	blue = color("0,0,1,0.812"),
	yellow = color("1,1,0,0.812"),
	pink = color("1,0,1,0.812"),
	cyan = color("0,1,1,0.812")
}
local colorPatterns =
{
	--first pattern block: YRPBCG with different start indices
	{[0]=p.yellow, p.red, p.pink, p.blue, p.cyan, p.green},
	--second pattern block: GCBPRY with different start indices
	{[0]=p.pink, p.red, p.yellow, p.green, p.cyan, p.blue}
}
local curPattern = 1
local curPatternIdx = 0
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:fov(120);
	end;
	Def.ActorFrame{
		OnCommand=function(self)
		local seed = math.random(1,13);
			--seed breakdown:
			--8-13: pattern 1, increasing start color
			--2-7: pattern 2, increasing start color
			--1: rainbow
			if seed > 1 then
				if seed > 7 then
					curPattern = 1
					curPatternIdx = seed - 8
				else
					curPattern = 2
					curPatternIdx = seed - 2
				end
				self:diffuse(colorPatterns[curPattern][curPatternIdx])
				self:queuecommand("Animate")
			else
				self:rainbow();
				self:effectperiod(120);
			end;
		end;
		AnimateCommand = function(s)
			--bump the current color to the next color in the pattern
			curPatternIdx = (curPatternIdx + 1) % #(colorPatterns[curPattern])
			s:linear(20)
			:diffuse(colorPatterns[curPattern][curPatternIdx])
			:queuecommand("Animate")
		end;
		Def.Quad{
			InitCommand=cmd(FullScreen);
		};
	};
};

t[#t+1] = LoadActor("pixel")..{
	InitCommand=cmd(FullScreen;blend,Blend.Add;diffusealpha,0.2);
};

t[#t+1] = LoadActor("werds (doubleres)")..{
	InitCommand=cmd(Center;blend,Blend.Add;diffusealpha,0.1);
	OnCommand=cmd(queuecommand,"Animate");
	OnCommand=function(self)
		local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
		local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
		self:customtexturerect(0,0,w*1,h*1);
		self:texcoordvelocity(0,0.08);
	end;
};

t[#t+1] = LoadActor("backer (doubleres)")..{
	InitCommand=cmd(FullScreen);
};

return t;
