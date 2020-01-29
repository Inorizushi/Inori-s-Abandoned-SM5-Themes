local t = Def.ActorFrame{
  OnCommand=function(self)
    if not FILEMAN:DoesFileExist("Save/ThemePrefs.ini") then
      Trace("ThemePrefs doesn't exist; creating file")
      ThemePrefs.ForceSave()
    end
    if SN3Debug then
      SCREENMAN:SystemMessage("Saving ThemePrefs.")
    end
    ThemePrefs.Save()
  end;
};

t[#t+1] = Def.ActorFrame{
  Def.Quad{
    InitCommand=cmd(FullScreen;diffusealpha,0);
    ModeGameMessageCommand=cmd(stoptweening;linear,0.4;diffuse,color("0.5,1,1,0.5"));
    ModeOptMessageCommand=cmd(stoptweening;linear,0.4;diffuse,color("0,0.5,1,0.5"));
    ModeExitMessageCommand=cmd(stoptweening;linear,0.4;diffuse,color("1,0,0,0.5"));
  };
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center);
  LoadActor("arrows")..{
    InitCommand=cmd(blend,Blend.Add;diffusealpha,0.25);
  };
}

return t;
