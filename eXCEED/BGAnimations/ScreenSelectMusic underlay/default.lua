return Def.ActorFrame{
  InitCommand=cmd(Center);
  Def.Sprite{
    Texture="roL 4x5";
    InitCommand=function(self)
      self:xy(-256,112);
      --yes this is necessary, either I do this, or fix the texture. -Inori
      self:SetStateProperties{
        {Frame=0, Delay=0.03};
        {Frame=1, Delay=0.03};
        {Frame=2, Delay=0.03};
        {Frame=3, Delay=0.03};
        {Frame=4, Delay=0.03};
        {Frame=5, Delay=0.03};
        {Frame=6, Delay=0.03};
        {Frame=7, Delay=0.03};
        {Frame=8, Delay=0.03};
        {Frame=9, Delay=0.03};
        {Frame=10, Delay=0.03};
        {Frame=11, Delay=0.03};
        {Frame=12, Delay=0.03};
        {Frame=13, Delay=0.03};
        {Frame=14, Delay=0.03};
        {Frame=15, Delay=0.03};
        {Frame=16, Delay=0.03};
        {Frame=17, Delay=0.03};
        {Frame=18, Delay=0.03};
      };
    end;
  };
  Def.Sprite{
    Texture="roR 4x5";
    InitCommand=function(self)
      self:xy(256,112);
      --yes this is necessary, either I do this, or fix the texture. -Inori
      self:SetStateProperties{
        {Frame=0, Delay=0.03};
        {Frame=1, Delay=0.03};
        {Frame=2, Delay=0.03};
        {Frame=3, Delay=0.03};
        {Frame=4, Delay=0.03};
        {Frame=5, Delay=0.03};
        {Frame=6, Delay=0.03};
        {Frame=7, Delay=0.03};
        {Frame=8, Delay=0.03};
        {Frame=9, Delay=0.03};
        {Frame=10, Delay=0.03};
        {Frame=11, Delay=0.03};
        {Frame=12, Delay=0.03};
        {Frame=13, Delay=0.03};
        {Frame=14, Delay=0.03};
        {Frame=15, Delay=0.03};
        {Frame=16, Delay=0.03};
        {Frame=17, Delay=0.03};
        {Frame=18, Delay=0.03};
      };
    end;
  };
  Def.Sprite{
    Texture="roD 1x19";
    InitCommand=function(self)
      self:xy(-64,208);
      --yes this is necessary, either I do this, or fix the texture. -Inori
      self:SetStateProperties{
        {Frame=0, Delay=0.03};
        {Frame=1, Delay=0.03};
        {Frame=2, Delay=0.03};
        {Frame=3, Delay=0.03};
        {Frame=4, Delay=0.03};
        {Frame=5, Delay=0.03};
        {Frame=6, Delay=0.03};
        {Frame=7, Delay=0.03};
        {Frame=8, Delay=0.03};
        {Frame=9, Delay=0.03};
        {Frame=10, Delay=0.03};
        {Frame=11, Delay=0.03};
        {Frame=12, Delay=0.03};
        {Frame=13, Delay=0.03};
        {Frame=14, Delay=0.03};
        {Frame=15, Delay=0.03};
        {Frame=16, Delay=0.03};
        {Frame=17, Delay=0.03};
        {Frame=18, Delay=0.03};
      };
    end;
  };
};
