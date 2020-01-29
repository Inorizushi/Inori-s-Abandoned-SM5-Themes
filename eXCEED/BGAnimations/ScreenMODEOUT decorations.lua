return Def.ActorFrame{
  LoadActor("../_common/top.png")..{
    Condition=getenv("JOINED") == "BOTH" or getenv("MODE") == "EDIT" or getenv("MODE") == "EXIT";
    InitCommand=cmd(CenterX;y,SCREEN_TOP+64);
    OnCommand=cmd(linear,0.3;y,SCREEN_TOP;diffusealpha,0);
  };
  Def.Quad{
    InitCommand=cmd(FullScreen;diffuse,Color.Black);
    OnCommand=cmd(diffusealpha,0;linear,0.3;diffusealpha,1);
  };
  LoadActor(THEME:GetPathG("","_common/P1ONLY.png"))..{
    Condition=GAMESTATE:IsHumanPlayer('PlayerNumber_P1') and GAMESTATE:GetNumPlayersEnabled()  == 1
    InitCommand=cmd(CenterX;y,_screen.cy+28);
    OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0;);
  }
  LoadActor(THEME:GetPathG("","_common/P2ONLY.png"))..{
    Condition=GAMESTATE:IsHumanPlayer('PlayerNumber_P2') and GAMESTATE:GetNumPlayersEnabled()  == 1
    InitCommand=cmd(CenterX;y,_screen.cy+28);
    OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0;);
  }
  LoadActor(THEME:GetPathG("","_common/TWOP.png"))..{
    Condition=GAMESTATE:IsHumanPlayer('PlayerNumber_P1') and GAMESTATE:IsHumanPlayer('PlayerNumber_P2') and GAMESTATE:GetNumPlayersEnabled()  == 1
    InitCommand=cmd(CenterX;y,_screen.cy+28);
    OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.5;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0;);
  }
}
