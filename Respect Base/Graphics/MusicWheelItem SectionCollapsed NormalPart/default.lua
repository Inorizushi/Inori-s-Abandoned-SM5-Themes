local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(x,-5;setsize,924,60;diffusealpha,0.25);
    SetMessageCommand=function(self, param)
      local group = param.Text;
      if group_name[group] ~= nil then
        self:diffuse(color(group_colors[group]))
        self:diffusealpha(0.25)
      else
        self:diffuse(color("1,1,1,0.25"))
      end;
    end;
  };
  --Title
  Def.BitmapText{
    Font="_gotham book 30px";
    InitCommand=cmd(halign,0;x,-400;maxwidth,600;wrapwidthpixels,2^24);
    SetMessageCommand=function(self, param)
      local pt_text = param.Text;
			local group = param.Text;
      if group_name[group] ~= nil then
        self:settext(group_rename[group])
      else
        self:settext(group);
      end;
        if param.HasFocus then
          setenv("getgroupname",pt_text);
        end;
	   end;
  };
  Def.Quad{
    InitCommand=cmd(x,-437;setsize,60,60;diffuse,color("0.3,0.3,0.3,1"));
    SetMessageCommand=function(self,param)
      local group = param.Text
      if group then
        if group_name[group] ~= nil then
          local filePath = THEME:GetPathG("","_jackets/group/"..group_name[group]..".png");
          self:Load(filePath)
          self:diffuse(color("1,1,1,1"))
          self:setsize(60,60)
        else
          self:diffuse(color("0.3,0.3,0.3,1"))
          self:setsize(60,60)
        end;
      else
        self:diffuse(color("0.3,0.3,0.3,1"))
        self:setsize(60,60)
      end;
    end;
  };
  Def.Quad{
    InitCommand=cmd(x,-405;setsize,4,60;);
    SetMessageCommand=function(self, param)
      local group = param.Text;
      if group_name[group] ~= nil then
        self:diffuse(color(group_colors[group]))
        self:diffusealpha(1)
      else
        self:diffuse(color("1,1,1,1"))
      end;
    end;
  }
};

return t;
