local function InputHandler(event)
local player = event.PlayerNumber
local MusicWheel = SCREENMAN:GetTopScreen("ScreenSelectMusic"):GetChild("MusicWheel");
  if event.type == "InputEventType_Release" then return false end
    if MusicWheel ~= nil then
      if event.GameButton == "MenuLeft" then
        MESSAGEMAN:Broadcast("SongUnchosen")
        MESSAGEMAN:Broadcast("TwoPartConfirmCancelled")
        MusicWheel:Move(-2):Move(1)
        SOUND:PlayOnce(THEME:GetPathS("","_MusicWheel change.ogg"))
      end
      if event.GameButton == "MenuUp" then
        MESSAGEMAN:Broadcast("SongUnchosen")
        MESSAGEMAN:Broadcast("TwoPartConfirmCancelled")
        MusicWheel:Move(1):Move(0)
        SOUND:PlayOnce(THEME:GetPathS("","_MusicWheel change.ogg"))
      end
      if event.GameButton == "MenuRight" then
        MESSAGEMAN:Broadcast("SongUnchosen")
        MESSAGEMAN:Broadcast("TwoPartConfirmCancelled")
        MusicWheel:Move(2):Move(-1)
        SOUND:PlayOnce(THEME:GetPathS("","_MusicWheel change.ogg"))
      end
      if event.GameButton == "MenuDown" then
        MESSAGEMAN:Broadcast("SongUnchosen")
        MESSAGEMAN:Broadcast("TwoPartConfirmCancelled")
        MusicWheel:Move(-1):Move(0)
        SOUND:PlayOnce(THEME:GetPathS("","_MusicWheel change.ogg"))
      end
    end
	end

local t = Def.ActorFrame{
  OnCommand=function(self)
    local MusicWheel = SCREENMAN:GetTopScreen():GetChild("MusicWheel");
    SCREENMAN:GetTopScreen():AddInputCallback(InputHandler)
  end;
};

return t;
