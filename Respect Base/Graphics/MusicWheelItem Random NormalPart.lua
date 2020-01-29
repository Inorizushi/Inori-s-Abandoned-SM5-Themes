local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(x,-5;setsize,926,60;diffuse,color("0.5,0.5,0.5,1"));
  };
  --Title
  Def.BitmapText{
    Font="_gotham book 30px";
    InitCommand=cmd(halign,0;x,-400;maxwidth,600;wrapwidthpixels,2^24);
    SetMessageCommand=function(self, param)
      self:settext("Random");
        if param.HasFocus then
          setenv("getrandom",1);
        end;
	   end;
  };
};

return t;
