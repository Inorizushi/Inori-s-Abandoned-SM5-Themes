local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	LoadActor("_swoosh")..{
		StartTransitioningCommand=cmd(play);
	};
};

return t;
