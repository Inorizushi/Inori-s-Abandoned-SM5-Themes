local gc = Var("GameCommand");

return Def.ActorFrame {
	LoadFont("_handelgothic bt 20px") .. {
		Text=gc:GetText(),
		InitCommand=function(self)
			self:uppercase(true):diffuse(color("#30e823")):strokecolor(color("#000000")):valign(1)
		end;
		GainFocusCommand=function(self) self:finishtweening():diffuse(color("1,1,1,1")):diffusetopedge(color("#a6f5a1")):diffusebottomedge(color("#30e823"))
    	MESSAGEMAN:Broadcast("TitleSelection", {Choice=gc:GetName()})
		end,
		LoseFocusCommand=function(self) self:stopeffect():diffuse(color("0.5,0.5,0.5,1")) end
	};
};
