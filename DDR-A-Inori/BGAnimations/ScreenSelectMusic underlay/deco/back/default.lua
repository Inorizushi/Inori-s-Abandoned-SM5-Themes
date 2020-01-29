local t = Def.ActorFrame{};

local diffbacker = LoadActor("00di_x_dufficulty_wnidow_base");
local radarbacker = LoadActor("00di_grooverader");
local squarebacker = LoadActor("00di_grop_rival_window_square");
local rivalbacker = LoadActor("00di_x_rival_window");
local uppermodule = LoadActor("up_module_midd_deco1");
local up_module_up_line = LoadActor("up_module_up_line.png");
local up_module_up_line_bold = LoadActor("up_module_up_line_bold.png");
local up_module_up_line_deco1 = LoadActor("up_module_up_line_deco1.png");
local up_module_under_line2 = LoadActor("up_module_under_line2.png");

t[#t+1] = Def.ActorFrame{
  Def.ActorFrame{
    InitCommand=cmd(diffusealpha,0.5);
    Name="Fancy Background Things";
    up_module_up_line..{
      InitCommand=cmd(xy,_screen.cx-170,SCREEN_TOP+50);
    };
    up_module_up_line..{
      InitCommand=cmd(xy,_screen.cx+170,SCREEN_TOP+50;zoomx,-1);
    };
    up_module_up_line_deco1..{
      InitCommand=cmd(xy,_screen.cx-286,SCREEN_TOP+36);
    };
    up_module_up_line_deco1..{
      InitCommand=cmd(xy,_screen.cx+286,SCREEN_TOP+36;zoomx,-1);
    };
    up_module_up_line_bold..{
      InitCommand=cmd(xy,SCREEN_LEFT+154,SCREEN_TOP+130);
    };
    up_module_up_line_bold..{
      InitCommand=cmd(xy,SCREEN_RIGHT-154,SCREEN_TOP+130;zoomx,-1);
    };
    up_module_under_line2..{
      InitCommand=cmd(xy,SCREEN_LEFT+181,_screen.cy+83);
    };
    up_module_under_line2..{
      InitCommand=cmd(xy,SCREEN_RIGHT-181,_screen.cy+83;zoomx,-1);
    };
    uppermodule..{
      InitCommand=cmd(xy,_screen.cx-300,_screen.cy-70);
    };
    uppermodule..{
      InitCommand=cmd(xy,_screen.cx+300,_screen.cy-70;zoomx,-1);
    };
  };
  Def.ActorFrame{
    Name="PanelBackers";
    InitCommand=cmd(diffusealpha,0.75);
    diffbacker..{
      InitCommand=cmd(halign,0;xy,SCREEN_LEFT-9,_screen.cy-142);
    };
    diffbacker..{
      InitCommand=cmd(halign,0;xy,SCREEN_RIGHT+9,_screen.cy-142;zoomx,-1);
    };
    radarbacker..{
      InitCommand=cmd(xy,SCREEN_LEFT+95,_screen.cy+62);
    };
    radarbacker..{
      InitCommand=cmd(xy,SCREEN_RIGHT-95,_screen.cy+62;zoomx,-1);
    };
    squarebacker..{
      InitCommand=cmd(xy,SCREEN_LEFT+67,_screen.cy+350);
    };
    squarebacker..{
      InitCommand=cmd(xy,SCREEN_RIGHT-67,_screen.cy+350;zoomx,-1);
    };
    rivalbacker..{
      InitCommand=cmd(halign,0;xy,SCREEN_LEFT-60,_screen.cy+306);
    };
    rivalbacker..{
      InitCommand=cmd(halign,0;xy,SCREEN_RIGHT+60,_screen.cy+306;zoomx,-1);
    };
  };
};

return t;
