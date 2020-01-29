-- BeforeLoadingNextCourseSongMessageCommand
-- StartCommand
-- ChangeCourseSongInMessageCommand
-- ChangeCourseSongOutMessageCommand
-- FinishCommand

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

return Def.ActorFrame {
	Def.Sprite{
		InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT);
		BeforeLoadingNextCourseSongMessageCommand=function(self)
			self:LoadFromSongBanner( SCREENMAN:GetTopScreen():GetNextCourseSong() )
		end;
		StartCommand=cmd(diffusealpha,0;sleep,0.3;linear,0.3;diffusealpha,1;);
		FinishCommand=cmd(diffusealpha,1;linear,0.3;diffusealpha,0;);
	};
  LoadActor("stagetemp/loadf_c0u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-128;diffuse,color("2.0,1.0,1.0,1"));
    StartCommand=cmd(addy,-224;sleep,0.5;linear,0.2;addy,224;);
		FinishCommand=cmd(sleep,2.7;linear,0.2;addy,-224;);
  };
  LoadActor("stagetemp/loadf_c0d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+128;diffuse,color("2.0,1.0,1.0,1"));
		StartCommand=cmd(addy,224;sleep,0.5;linear,0.2;addy,-224;);
		FinishCommand=cmd(sleep,2.7;linear,0.2;addy,224;);
  };
  LoadActor("stagetemp/loadf_c1u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-148;diffuse,color("2.0,1.0,1.0,1"));
		StartCommand=cmd(addy,-184;sleep,0.5;bounceend,0.3;addy,184;);
		FinishCommand=cmd(sleep,2.7;bounceend,0.3;addy,-184;);
  };
  LoadActor("stagetemp/loadf_c1d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+148;diffuse,color("2.0,1.0,1.0,1"));
		StartCommand=cmd(addy,184;sleep,0.5;bounceend,0.3;addy,-184;);
		FinishCommand=cmd(sleep,2.7;bounceend,0.3;addy,184;);
  };
  LoadActor("stagetemp/loadf_c3u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-208;diffuse,color("2.0,1.0,1.0,1"));
		StartCommand=cmd(addy,-64;sleep,0.5;bounceend,0.3;addy,64;);
		FinishCommand=cmd(sleep,2.7;bounceend,0.3;addy,-64;);
  };
  LoadActor("stagetemp/loadf_c3d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+208;diffuse,color("2.0,1.0,1.0,1"));
		StartCommand=cmd(addy,64;sleep,0.5;bounceend,0.3;addy,-64;);
		FinishCommand=cmd(sleep,2.7;bounceend,0.3;addy,64;);
  };
  LoadActor("stagetemp/loadf_c2u")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-112;diffuse,color("2.0,1.0,1.0,1"));
		StartCommand=cmd(addx,-640;zoomy,0;sleep,0.5;linear,0.2;zoomy,1;addx,640;);
		FinishCommand=cmd(sleep,2.7;linear,0.3;zoomy,0;addx,-640;);
  };
  LoadActor("stagetemp/loadf_c2d")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+112;diffuse,color("2.0,1.0,1.0,1"));
		StartCommand=cmd(addx,640;zoomy,0;sleep,0.5;linear,0.2;zoomy,1;addx,-640;);
		FinishCommand=cmd(sleep,2.7;linear,0.3;zoomy,0;addx,640;);
  };
  LoadActor("stagetemp/box.txt")..{
    InitCommand=cmd(effectmagnitude,0,100,0;CenterY;x,SCREEN_CENTER_X-136;z,16);
		StartCommand=cmd(zoom,0;sleep,0.5;linear,0.2;zoom,1;rotationy,0;linear,2.3;rotationy,-720;);
		FinishCommand=cmd(linear,2.7;rotationy,-720;linear,0.3;zoom,0;);
  };
  LoadActor("stagetemp/box.txt")..{
    InitCommand=cmd(effectmagnitude,0,100,0;CenterY;x,SCREEN_CENTER_X+136;z,16);
		StartCommand=cmd(zoom,0;sleep,0.5;linear,0.2;zoom,1;rotationy,0;linear,2.3;rotationy,-720;);
		FinishCommand=cmd(linear,2.7;rotationy,-720;linear,0.3;zoom,0;);
  };
	Def.Sprite{
		InitCommand=cmd(Center);
		BeforeLoadingNextCourseSongMessageCommand=function(self)
			self:LoadFromSongBanner( SCREENMAN:GetTopScreen():GetNextCourseSong() )
		end;
		StartCommand=cmd(diffusealpha,0;linear,0.2;diffusealpha,1;);
		FinishCommand=cmd(sleep,1.7;linear,0.3;diffusealpha,0);
	};
};
