local t = Def.ActorFrame{};

local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;

local cross = LoadActor("mode_nm_bs_cross.png");

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_LEFT+127,SCREEN_TOP+56);
  LoadActor("mode_nm_bs_mult.png")..{
    InitCommand=cmd(blend,Blend.Multiply;diffuse,color("0.5,0.5,0.5,1"));
  };
  LoadActor("mode_nm_bs_line.png");
  cross..{
    InitCommand=cmd(xy,-98,30);
  };
  cross..{
    InitCommand=cmd(xy,-98,-30);
  };
  cross..{
    InitCommand=cmd(xy,98,30);
  };
  cross..{
    InitCommand=cmd(xy,98,-30);
  };
  LoadActor("mode_nm_bs_deco_line.png")..{
    InitCommand=cmd(xy,-35,-14);
  };
  LoadActor("mode_nm_bs_demo_shp.png")..{
    InitCommand=cmd(xy,34,-23);
  };
  LoadActor("mode_name_musicselect.png")..{
    InitCommand=cmd(xy,-40,-18);
  };
  LoadActor( "stageeffect01" )..{
		InitCommand=cmd(xy,0,25;zoom,20;);
		OnCommand=cmd(zoomy,0;linear,0.1;zoomy,1;customtexturerect,0,0,20,1;texcoordvelocity,5,0);
		OffCommand=cmd(linear,0.1;zoomy,0);
	};
  LoadActor( "stageeffect02" )..{
		InitCommand=cmd(xy,0,26;zoom,7;);
		OnCommand=cmd(zoomy,0;linear,0.1;zoomy,1;customtexturerect,0,0,10,1;texcoordvelocity,-1,0;playcommand,"Animate");
		OffCommand=cmd(stopeffect;stoptweening;linear,0.1;zoomy,0);
		AnimateCommand=cmd(linear,0.3;addx,20;linear,1.5;addx,-20;linear,0.6;addx,5;linear,1.3;addx,-5;linear,0.6;addx,15;linear,0.5;addx,-15;queuecommand,"Animate");
	};
  Def.Sprite{
		InitCommand=cmd(xy,0,6);
		OnCommand=function(self)
			if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' then
				self:Load(THEME:GetPathB("", "ScreenSelectMusic overlay/deco/mode/Stage/Stage " .. ToEnumShortString(sStage) ));
				self:diffusealpha(0):sleep(0.2):linear(0.2):diffusealpha(1);
			end;
		end;
	};
};

return t;
