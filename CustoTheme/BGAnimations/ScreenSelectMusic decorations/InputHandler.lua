local function InputHandler(event)
local player = event.PlayerNumber
local MusicWheel = SCREENMAN:GetTopScreen("ScreenSelectMusic"):GetChild("MusicWheel");
  if event.type == "InputEventType_Release" then return false end
    if MusicWheel ~= nil then
      if event.GameButton == "MenuLeft" then
        MESSAGEMAN:Broadcast("SongUnchosen")
        MESSAGEMAN:Broadcast("TwoPartConfirmCancelled")
        MusicWheel:Move(-2):Move(0)
      end
      if event.GameButton == "MenuUp" then
        MESSAGEMAN:Broadcast("SongUnchosen")
        MESSAGEMAN:Broadcast("TwoPartConfirmCancelled")
        MusicWheel:Move(-1):Move(0)
      end
      if event.GameButton == "MenuRight" then
        MESSAGEMAN:Broadcast("SongUnchosen")
        MESSAGEMAN:Broadcast("TwoPartConfirmCancelled")
        MusicWheel:Move(2):Move(0)
      end
      if event.GameButton == "MenuDown" then
        MESSAGEMAN:Broadcast("SongUnchosen")
        MESSAGEMAN:Broadcast("TwoPartConfirmCancelled")
        MusicWheel:Move(1):Move(0)
      end
    end
	end

local t = Def.ActorFrame{};

return t;
