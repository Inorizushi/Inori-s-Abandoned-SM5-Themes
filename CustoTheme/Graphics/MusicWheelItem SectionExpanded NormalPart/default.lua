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

local t = Def.ActorFrame{
	SetMessageCommand=function(self,params)
		arrangeXPosition(self,params.Index);
		arrangeYPosition(self,params.Index);
	end;
	LoadActor("base")..{
		InitCommand=cmd(rotationz,-90;y,-53;zoom,1.01);
	};
	LoadActor("over")..{
		InitCommand=cmd(rotationz,-90;y,-53;zoom,1.01);
		SetMessageCommand=function(self, params)
			local song = params.Song;
			group = params.Text;
		local so = GAMESTATE:GetSortOrder();
		if group_name[group] ~= nil then
			self:diffuse(color(group_color[group]));
		else
			self:diffuse(color("#000000"));
		end;
		end;
	};
	LoadFont("_pirates of cydonia 48px")..{
	InitCommand=cmd(y,50;addx,-8;rotationz,-95;halign,0;valign,1;zoom,0.6;maxwidth,150);
	SetMessageCommand=function(self, params)
		local song = params.Song;
		local pt_text = params.Text;
		local group = params.Text;
		if group then
			if params.HasFocus then
				setenv("getgroupname",pt_text);
			end;
		end;
	local so = GAMESTATE:GetSortOrder();
	if group_name[group] ~= nil then
		self:settext(group_name[group]);
		self:diffuse(color("#000000"));
	else
		if so == "SortOrder_Group" then
		self:settext(group);
		self:strokecolor(color("#000000"))
		self:diffuse(color("#000000"));
		else
		self:settext("");
		end;
	end;
	end;
};
LoadFont("_pirates of cydonia 48px")..{
InitCommand=cmd(y,-156;addx,14;rotationz,-92;halign,1;valign,1;;maxwidth,150);
SetMessageCommand=function(self, params)
	self:settext("Back");
	self:diffuse(color("#000000"));
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
};
return t;
