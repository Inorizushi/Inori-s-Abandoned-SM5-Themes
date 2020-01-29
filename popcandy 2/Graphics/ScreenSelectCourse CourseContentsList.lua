local maxVisibleContents = 5 -- equivalent of MAX_VISIBLE_CONTENTS
local maxTotalContents = 56 -- equivalent of MAX_TOTAL_CONTENTS
local entryHeight = 40
local itemSecondsPause = 0.75

return Def.ActorFrame{
	Def.Quad{
		Name="TopMask";
		InitCommand=cmd(valign,0;y,-(entryHeight*(maxVisibleContents));zoomto,280,entryHeight*2.5;MaskSource);
	};

	-- course contents list = rage
	Def.CourseContentsList{
		NumItemsToDraw=maxVisibleContents;
		MaxSongs=maxTotalContents;
		SecondsPerItem=itemSecondsPause;

		TransformFunction=function(self,offset,itemIndex,numItems)
			self:y(offset*entryHeight)
		end;

		BeginCommand=cmd(playcommand,"Set");
		CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
		CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			self:SetFromGameState()
			self:SetCurrentAndDestinationItem(0)
			self:PositionItems()
			if GAMESTATE:GetCurrentCourse():GetEstimatedNumStages() > 5 then
				self:SetLoop(true)
				self:SetPauseCountdownSeconds(1)
				self:SetSecondsPauseBetweenItems(itemSecondsPause)
				self:ScrollWithPadding(-2,1)
			else
				self:SetLoop(false)
				self:SetPauseCountdownSeconds(1)
				self:SetSecondsPauseBetweenItems(itemSecondsPause)
				self:ScrollWithPadding(-2,-1)
			end

		end;

		Display=Def.ActorFrame{
			InitCommand=cmd(setsize,270,40);
			LoadActor(THEME:GetPathG("CourseEntryDisplay","bar"));

			-- entry number
			LoadFont("_shared2")..{
				InitCommand=cmd(x,-118);
				SetSongCommand=function(self,param)
					self:settext(param.Number)
				end;
			};

			-- textbanner
			Def.TextBanner{
				InitCommand=cmd(Load,"TextBannerCourse";SetFromString,"","","","","","");
				SetSongCommand=function(self,param)
					if not param.Song or param.Secret then
						-- set fake ("??????????" with no artist)
						self:SetFromString("??????????","??????????", "","", "","")
						self:diffuse(color("#FFFFFF"))
					else
						-- set real
						self:SetFromSong(param.Song)
						self:diffuse(SONGMAN:GetSongColor(param.Song))
					end
				end;
			};

			-- if you can't do it the right way, do it the hacky way.
			LoadActor(THEME:GetPathF("StepsDisplay","ticks 2x1.png"))..{
				Name="FootClanMembershipToken"; -- teenage mutant ninja stepmania
				InitCommand=cmd(x,98;y,-8;pause;);
				SetSongCommand=function(self,param)
					local difficulty = param.Difficulty
					local customDiff = GetCustomDifficulty(param.Steps:GetStepsType(),difficulty,nil)
					self:diffuse(CustomDifficultyToColor(customDiff))
				end;
			};
			LoadFont("ScreenMusicScroll titles")..{
				Name="DifficultyMeter";
				InitCommand=cmd(x,120;y,-8;zoom,0.7;shadowlength,0);
				SetSongCommand=function(self,param)
					self:settext(param.Meter)
					local difficulty = param.Difficulty
					local customDiff = GetCustomDifficulty(param.Steps:GetStepsType(),difficulty,nil)
					self:diffuse(CustomDifficultyToColor(customDiff))
				end;
			};

			-- modifiers
			LoadFont("Common normal")..{
				InitCommand=cmd(x,128;y,10;halign,1;zoom,0.5);
				SetSongCommand=function(self,param)
					self:settext(param.Modifiers)
				end;
			};
		};
	};
};
