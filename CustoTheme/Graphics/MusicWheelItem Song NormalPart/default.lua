local sBannerPath = THEME:GetPathG("Common", "fallback jacket");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true
local song;
local group;

function arrangeXPosition(myself, index)
	if index%2==0 then
		myself:x(-120);
	elseif index%2==1 then
		myself:x(0);
	end;
end

--technika2/3 style hack ;)
function arrangeYPosition(myself, index)
	if index%2==0 then
		myself:y(50);
	elseif index%2==1 then
		myself:y(-75);
	end;
end

local t = Def.ActorFrame {
	SetMessageCommand=function(self,params)
		arrangeXPosition(self,params.Index);
		arrangeYPosition(self,params.Index);
	end;
	LoadActor("Backing")..{
		InitCommand=cmd(rotationz,-90;y,-53;zoom,1.01);
	};
	LoadActor("Over")..{
		InitCommand=cmd(rotationz,-90;y,-53;zoom,1.01);
	};
	Def.BitmapText{
		Font="_itc avant garde gothic lt Bold 16px";
		InitCommand=cmd(halign,0;x,-37;rotationz,-90;maxwidth,176;wrapwidthpixels,2^24);
		SetMessageCommand=function(self, param)
			local Song = param.Song;
			local Course = param.Course;
			if Song then
				self:y(-54):zoom(0.6)
				self:settext(Song:GetDisplayMainTitle());
				--local color_grp= group_colors[Song:GetGroupName()] or "FFFFFF"
				--self:diffuse(color(color_grp));
				self:diffuse(color("1,1,1,1"))
			elseif Course then
				self:settext(Course:GetDisplayFullTitle());
			end
		end;
	};
	Def.BitmapText{
		Font="_itc avant garde gothic lt Bold 16px";
		InitCommand=cmd(halign,0;x,-19;rotationz,-90;maxwidth,176;wrapwidthpixels,2^24);
		SetMessageCommand=function(self, param)
			local Song = param.Song;
			local Course = param.Course;
			if Song then
				self:y(-54):zoom(0.6)
				self:settext(Song:GetDisplayArtist());
				--local color_grp= group_colors[Song:GetGroupName()] or "FFFFFF"
				--self:diffuse(color(color_grp));
				self:diffuse(color("0,0,0,1"))
			elseif Course then
				self:settext(Course:GetDisplayArtist());
			end
		end;
	};
	Def.Sprite {
		Name="Banner";
		InitCommand=cmd(scaletoclipped,100,100;rotationz,-90);
		BannerCommand=cmd(scaletoclipped,100,100);
		JacketCommand=cmd(scaletoclipped,100,100);
		SetMessageCommand=function(self,params)
			local Song = params.Song;
			local Course = params.Course;
			if Song then
				if ( Song:GetJacketPath() ~=  nil ) and ( bAllowJackets ) then
					self:Load( Song:GetJacketPath() );
					self:playcommand("Jacket");
				elseif ( Song:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Song:GetBackgroundPath() );
					self:playcommand("Jacket");
				elseif ( Song:GetBannerPath() ~= nil ) then
					self:Load( Song:GetBannerPath() );
					self:playcommand("Banner");
				else
				  self:Load( bAllowJackets and sBannerPath or sJacketPath );
				  self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end;
			elseif Course then
				if ( Course:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Course:GetBackgroundPath() );
					self:playcommand("Jacket");
				elseif ( Course:GetBannerPath() ~= nil ) then
					self:Load( Course:GetBannerPath() );
					self:playcommand("Banner");
				else
					self:Load( sJacketPath );
					self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end
			else
				self:Load( bAllowJackets and sJacketPath or sBannerPath );
				self:playcommand( bAllowJackets and "Jacket" or "Banner" );
			end;
		end;
	};
	LoadActor("Highlight")..{
		Name="Cursor";
		InitCommand=cmd(rotationz,-90;y,-53;zoom,1.01;visible,false);
		SetMessageCommand=function(self,params)
            (cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.5;effectclock,'beatnooffset'))(self);
            if params.HasFocus then
                self:visible(true);
            else
                self:visible(false);
            end
		end;
	};
	Def.Sprite{
		Texture="new 2x1 (doubleres).png";
		InitCommand=cmd(x,-50;y,30;rotationz,-90;finishtweening;draworder,1;visible,SCREENMAN:GetTopScreen() ~= "ScreenNetRoom");
		OnCommand=function(self)
			self:diffusealpha(0):diffusealpha(1)
		end;
		SetCommand=function(self,param)
			if param.Song then
				if PROFILEMAN:IsSongNew(param.Song) then
					self:visible(true);
				else
					self:visible(false);
				end
			else
				self:visible(false);
			end
		end;
	};
};

return t;
