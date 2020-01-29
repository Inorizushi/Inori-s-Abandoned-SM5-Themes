local t = Def.ActorFrame{};

local screenName = Var "LoadingScreen"
local headerTextImage

if screenName == "ScreenSelectStyle" then
  headerTextImage = "SELECT STYLE.png"
elseif screenName == "ScreenSelectProfile" then
  headerTextImage = "LOGIN.png"
end;

t[#t+1] = LoadActor("base");

if headerTextImage then
  t[#t+1] = LoadActor(headerTextImage)..{
    InitCommand=function(self)
    end;
  };
end

return t;
