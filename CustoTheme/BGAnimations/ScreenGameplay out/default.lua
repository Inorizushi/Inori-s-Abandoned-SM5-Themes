-- normal and rave are handled in normal/default.lua
-- extra stages are in extra1 and extra2.

local t = Def.ActorFrame{
	Def.Actor{ OnCommand=cmd(sleep,5); };
}

	-- normal and extra stages
t[#t+1] = LoadActor("normal")

return t;
