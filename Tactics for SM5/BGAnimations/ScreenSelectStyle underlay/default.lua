local t = Def.ActorFrame{};

if GAMESTATE:GetPlayMode() == 'PlayMode_Oni' then
  t[#t+1] = Def.ActorFrame{
    InitCommand=cmd(x,SCREEN_CENTER_X-30;y,SCREEN_CENTER_Y-4);
    OnCommand=cmd(linear,.2;x,SCREEN_CENTER_X-60;y,SCREEN_CENTER_Y-4;linear,.3;x,SCREEN_CENTER_X-100;y,SCREEN_CENTER_Y-16;linear,.30;x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y-16;linear,.2;x,SCREEN_CENTER_X-196;y,SCREEN_CENTER_Y-36;linear,.25;x,SCREEN_CENTER_X-204;y,SCREEN_CENTER_Y-72);
    Def.Sprite{
      Texture="down 1x4.png";
      OnCommand=cmd(zoom,0;sleep,1.35;zoom,1);
    };
    Def.Sprite{
      Texture="left 1x4.png";
      OnCommand=cmd(zoom,1;sleep,.2;zoom,0;sleep,.3;zoom,1;sleep,.3;zoom,0);
    };
    Def.Sprite{
      Texture="up left 1x4.png";
      OnCommand=cmd(zoom,0;sleep,.2;zoom,1;sleep,.3;zoom,0;sleep,.3;zoom,1;sleep,.2;zoom,0);
    };
    Def.Sprite{
      Texture="up 1x4.png";
      OnCommand=cmd(zoom,0;sleep,1;zoom,1;sleep,.35;zoom,0);
    };
  };
  t[#t+1] = Def.ActorFrame{
    InitCommand=cmd(Center);
    LoadActor("Survival Mode.png")..{
      InitCommand=cmd(y,-70);
      OnCommand=cmd(zoom,0;sleep,1.3;linear,.2;zoom,1);
    };
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Survival Mode";
      InitCommand=cmd(zoomx,1.25;shadowlength,0;y,10);
      OnCommand=cmd(diffuse,0,0,0,0;sleep,1.3;diffuse,0,0,0,1;linear,.5;diffuse,1,1,1,1);
    };
  };
elseif GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then
  t[#t+1] = Def.ActorFrame{
    InitCommand=cmd(x,SCREEN_CENTER_X-30;y,SCREEN_CENTER_Y-4);
    OnCommand=cmd(linear,.15;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-4;linear,.4;x,SCREEN_CENTER_X+80;y,SCREEN_CENTER_Y-40;linear,.25;x,SCREEN_CENTER_X+130;y,SCREEN_CENTER_Y-40;linear,.3;x,SCREEN_CENTER_X+190;y,SCREEN_CENTER_Y-16;linear,.15;x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y-16);
    Def.Sprite{
      Texture="down 1x4.png";
      OnCommand=cmd(zoom,0;sleep,1.35;zoom,1);
    };
    Def.Sprite{
      Texture="right 1x4.png";
      OnCommand=cmd(zoom,1;sleep,.15;zoom,0;sleep,.4;zoom,1;sleep,.25;zoom,0;sleep,.3;zoom,1;sleep,.25;zoom,0);
    };
    Def.Sprite{
      Texture="up right 1x4.png";
      OnCommand=cmd(zoom,0;sleep,.15;zoom,1;sleep,.4;zoom,0);
    };
    Def.Sprite{
      Texture="down right 1x4.png";
      OnCommand=cmd(zoom,0;sleep,.8;zoom,1;sleep,.3;zoom,0);
    };
  };
  t[#t+1] = Def.ActorFrame{
    InitCommand=cmd(Center);
    LoadActor("Marathon Mode.png")..{
      InitCommand=cmd(y,-70);
      OnCommand=cmd(zoom,0;sleep,1.3;linear,.2;zoom,1);
    };
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Dance Mode";
      InitCommand=cmd(zoomx,1.25;shadowlength,0;y,10);
      OnCommand=cmd(diffuse,0,0,0,0;sleep,1.3;diffuse,0,0,0,1;linear,.5;diffuse,1,1,1,1);
    };
  };
elseif GAMESTATE:GetPlayMode() == 'PlayMode_Regular' then
  t[#t+1] = Def.ActorFrame{
    InitCommand=cmd(x,SCREEN_CENTER_X-30;y,SCREEN_CENTER_Y-4);
    OnCommand=cmd(linear,.2;x,SCREEN_CENTER_X-23;y,SCREEN_CENTER_Y+28;linear,.2;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+51;linear,.2;x,SCREEN_CENTER_X-3;y,SCREEN_CENTER_Y+78;linear,.2;x,SCREEN_CENTER_X+25;y,SCREEN_CENTER_Y+93;linear,.45;x,SCREEN_CENTER_X+38;y,SCREEN_CENTER_Y+166);
    Def.Sprite{
      Texture="down 1x4.png";
      OnCommand=cmd(zoom,1;sleep,.2;zoom,0;sleep,.2;zoom,1;sleep,.2;zoom,0;sleep,.2;zoom,1);
    };
    Def.Sprite{
      Texture="down right 1x4.png";
      OnCommand=cmd(zoom,0;sleep,.2;zoom,1;sleep,.2;zoom,0;sleep,.2;zoom,1;sleep,.2;zoom,0);
    };
  };
  t[#t+1] = Def.ActorFrame{
    InitCommand=cmd(Center);
    LoadActor("Dance Mode.png")..{
      InitCommand=cmd(y,-70);
      OnCommand=cmd(zoom,0;sleep,1.3;linear,.2;zoom,1);
    };
    Def.BitmapText{
      Font="_FFT2 white";
      Text="Dance Mode";
      InitCommand=cmd(zoomx,1.25;shadowlength,0;y,10);
      OnCommand=cmd(diffuse,0,0,0,0;sleep,1.3;diffuse,0,0,0,1;linear,.5;diffuse,1,1,1,1);
    };
  };
end;

return t;
