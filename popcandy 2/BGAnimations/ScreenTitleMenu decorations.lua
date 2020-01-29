InitUserPrefs();

local t = Def.ActorFrame {}

t[#t+1] = StandardDecorationFromFileOptional("Logo","Logo");
t[#t+1] = StandardDecorationFromFileOptional("VersionInfo","VersionInfo");

t[#t+1] = StandardDecorationFromFileOptional("NumSongs","NumSongs") .. {
	SetCommand=function(self)
		local InstalledSongs, AdditionalSongs, InstalledCourses, AdditionalCourses, Groups, Unlocked = 0;
		if SONGMAN:GetRandomSong() then
			InstalledSongs, AdditionalSongs, InstalledCourses, AdditionalCourses, Groups, Unlocked =
				SONGMAN:GetNumSongs(),
				SONGMAN:GetNumAdditionalSongs(),
				SONGMAN:GetNumCourses(),
				SONGMAN:GetNumAdditionalCourses(),
				SONGMAN:GetNumSongGroups(),
				SONGMAN:GetNumUnlockedSongs();
		else
			return
		end

		self:settextf(THEME:GetString("ScreenTitleMenu","%i Songs (%i Groups), %i Courses"), InstalledSongs, Groups, InstalledCourses);
-- 		self:settextf("%i (+%i) Songs (%i Groups), %i (+%i) Courses", InstalledSongs, AdditionalSongs, Groups, InstalledCourses, AdditionalCourses);
	end;
};

return t
