local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh in.ogg"))..{
		OnCommand=cmd(play);
	};
};

return t;
