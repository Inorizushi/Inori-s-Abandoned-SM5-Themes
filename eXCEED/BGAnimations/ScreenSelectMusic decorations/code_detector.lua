local t = Def.ActorFrame{}

t[#t+1] = Def.Actor{
  CodeMessageCommand=function(self,params)
    local codeName = params.Name
    if codeName == "GroupLeft" then
      MESSAGEMAN:Broadcast("SectionChanged");
    elseif codeName == 'GroupRight' then
      MESSAGEMAN:Broadcast("SectionChanged");
    end;
  end;
};
