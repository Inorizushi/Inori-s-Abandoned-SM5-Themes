return Def.ActorFrame{
	LoadActor("_swoosh")..{
		StartTransitioningCommand=cmd(play);
	};
};
