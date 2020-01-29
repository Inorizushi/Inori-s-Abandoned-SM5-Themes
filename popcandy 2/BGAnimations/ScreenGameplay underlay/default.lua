local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
		Name="DangerP1";
		Def.ActorFrame{
			Name="Single";
			BeginCommand=function(self)
			local style = GAMESTATE:GetCurrentStyle()
			local styleType = style:GetStyleType()
			local bDoubles = (styleType == 'StyleType_OnePlayerTwoSides' or styleType == 'StyleType_TwoPlayersSharedSides')
				self:visible(not bDoubles)
			end;
		HealthStateChangedMessageCommand=function(self, param)
			if param.PlayerNumber == PLAYER_1 then
				if param.HealthState == "HealthState_Danger" then
					self:RunCommandsOnChildren(cmd(playcommand,"Show"))
				else
					self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
				end
			end
		end;
		Def.ActorFrame{
			ShowCommand=cmd(visible,true;diffuseblink;effectcolor1,color("1,1,1,1");effectcolor2,color("0,0,0,0"));
			HideCommand=cmd(visible,false);
			LoadActor("danger1")..{
				InitCommand=cmd(visible,false;Center;zoomto,640,480);
				ShowCommand=cmd(visible,true;vibrate;effectmagnitude,4,8,8;);
				HideCommand=cmd(visible,false);
			};
		};
		};
	};
	Def.ActorFrame{
		Name="DangerP2";
		Def.ActorFrame{
			Name="Single";
			BeginCommand=function(self)
			local style = GAMESTATE:GetCurrentStyle()
			local styleType = style:GetStyleType()
			local bDoubles = (styleType == 'StyleType_OnePlayerTwoSides' or styleType == 'StyleType_TwoPlayersSharedSides')
				self:visible(not bDoubles)
			end;
		HealthStateChangedMessageCommand=function(self, param)
			if param.PlayerNumber == PLAYER_2 then
				if param.HealthState == "HealthState_Danger" then
					self:RunCommandsOnChildren(cmd(playcommand,"Show"))
				else
					self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
				end
			end
		end;
		Def.ActorFrame{
			ShowCommand=cmd(visible,true;diffuseblink;effectcolor1,color("1,1,1,1");effectcolor2,color("0,0,0,0"));
			HideCommand=cmd(visible,false);
			LoadActor("danger1")..{
				InitCommand=cmd(visible,false;Center;zoomto,640,480);
				ShowCommand=cmd(visible,true;vibrate;effectmagnitude,4,8,8;);
				HideCommand=cmd(visible,false);
			};
		};
		};
	};
};

return t;
