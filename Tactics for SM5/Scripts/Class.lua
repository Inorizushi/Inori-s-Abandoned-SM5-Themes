function GetDefaultClass( num )
	var = num
	if not var then var = GetClassNum() end
	if var > '020' then return var end
	return '000'
end

function GetDefaultClassName( num )
	var = num
	if not var then var = GetClassNum() end
	if var > '020' then return GetClassName(var) end
	return GetClassName('000')
end

function SelectClassDefaultChoice()
	num = GetClassNum()
	GAMESTATE:SetEnv('old',num)
	if num > '020' then return '000' end
	return num
end

function GetSleep()
	if GAMESTATE:GetEnv('Info') == "1" then return .125 end
	if GAMESTATE:GetCurrentSteps(PLAYER_1) then p1 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter() end
	if GAMESTATE:GetCurrentSteps(PLAYER_2) then p2 = GAMESTATE:GetCurrentSteps(PLAYER_2):GetMeter() end
	if not p1 and not p2 then p1 = 11 end
	if not p1 then p1 = 1 end
	if not p2 then p2 = 1 end
	local diff = math.max(p1,p2)
	rate = 10 * ( modRate - 1 )
	diff = diff + rate	
	local sleep = .235 - diff/100
	sleep = math.max(sleep,.0625)
	return sleep
end

function GetClassShadow( num )
	if IsRidingChocobo() then
		if not num then
			local path = THEME:GetPath( EC_GRAPHICS, '', '_blank' )
			return path
		end
	end
	local path = THEME:GetPath( EC_GRAPHICS, '', 'characters' )
	return path.."\/shadow"
end

function GetClassInit( num )
	if IsRidingChocobo( num ) then return "x,500" end
	local type = GetClassType( num )
	if type == '2' then
		return "zoomy,1.2;x,136;y,237;cropleft,.19;cropright,.625;croptop,0;cropbottom,.83"
	end
	if type == '3' then
		return "zoomy,1.2;x,136;y,214;cropleft,.19;cropright,.625;croptop,0;cropbottom,.83"
	end
	if type == '4' then
		return "zoomy,1.2;x,141;y,186;cropleft,.19;cropright,.625;croptop,0;cropbottom,.775"
	end
	return "zoomy,1.2;x,194;y,244;cropleft,.125;cropright,.75;croptop,0;cropbottom,.86"
end

function GetClassScroller( self , num )
	return "zbuffer,1;zoomy,2.4;addy,244"
end

function GetClassRiding1( num )
	return "zoomy,1.2;x,275;y,164;croptop,.14;cropbottom,.77;cropleft,0;cropright,.895"
end

function GetClassRiding2( num )
	local type = GetClassAnimationNum( num )
	if type == '1' then
		return "zoomy,1.2;x,155;y,108;croptop,.28;cropbottom,.65;cropleft,.20;cropright,.71"
	end
	if type == '2' then
		return "zoomy,1.2;x,155;y,106;croptop,.28;cropbottom,.65;cropleft,.20;cropright,.71"
	end
end

function GetClassOut( num )
	local type = GetClassType( num )
	if type == '2' then
		return "linear,1;fadebottom,.1;fadetop,.1;linear,1;croptop,.09;cropbottom,.92"
	end
	if type == '3' then
		return "linear,1;fadebottom,.1;fadetop,.1;linear,1;croptop,.09;cropbottom,.92"
	end
	if type == '4' then
		return "linear,1;fadebottom,.1;fadetop,.1;linear,1;croptop,.11;cropbottom,.89"
	end
	return "linear,1;fadebottom,.1;fadetop,.1;linear,1;croptop,.07;cropbottom,.93"
end

function GetClassIn( num )
	local type = GetClassType( num )
	if type == '2' then
		return "fadeleft,.1;faderight,.1;cropleft,.28;cropright,.72;linear,1.8;fadeleft,.03;faderight,.03;cropleft,.19;cropright,.625;linear,.2;fadeleft,0;faderight,0"
	end
	if type == '3' then
		return "fadeleft,.1;faderight,.1;cropleft,.28;cropright,.72;linear,1.8;fadeleft,.03;faderight,.03;cropleft,.19;cropright,.625;linear,.2;fadeleft,0;faderight,0"
	end
	if type == '4' then
		return "fadeleft,.1;faderight,.1;cropleft,.28;cropright,.72;linear,1.8;fadeleft,.03;faderight,.03;cropleft,.19;cropright,.625;linear,.2;fadeleft,0;faderight,0"
	end
	return "fadeleft,.1;faderight,.1;cropleft,.18;cropright,.82;linear,1.8;fadeleft,.03;faderight,.03;cropleft,.125;cropright,.75;linear,.2;fadeleft,0;faderight,0"
end

function GetClassHurt( num )
	if IsRidingChocobo( num ) then return "" end
	local type = GetClassType( num )
	if type == '2' then
		return "zoomy,1.2;x,256;y,-147;cropleft,0;cropright,.81;croptop,.67;cropbottom,.134"
	end
	if type == '3' then
		return "zoomy,1.2;x,256;y,-170;cropleft,0;cropright,.81;croptop,.67;cropbottom,.134"
	end
	if type == '4' then
		return "zoomy,1.2;x,-99;y,186;cropleft,.56;cropright,.25;croptop,0;cropbottom,.775"
	end
	return "zoomy,1.2;x,-128;y,-172;cropleft,.625;cropright,.26;croptop,.75;cropbottom,.125"
end

function GetClassDead( num )
	if IsRidingChocobo( num ) then return "x,-500" end
	local type = GetClassType( num )
	if type == '2' then
		return "zoomy,1.2;x,136;y,-147;cropleft,.19;cropright,.625;croptop,.67;cropbottom,.134"
	end
	if type == '3' then
		return "zoomy,1.2;x,136;y,-170;cropleft,.19;cropright,.625;croptop,.67;cropbottom,.134"
	end
	if type == '4' then
		return "zoomy,1.2;x,-133;y,-169;cropleft,.625;cropright,.26;croptop,.75;cropbottom,.125"
	end
	return "zoomy,1.2;x,-131;y,-26;cropleft,.63;cropright,.23;croptop,.53;cropbottom,.36"
end

function GetClassBanner()
	return "x,-10;y,-359;cropleft,.3;cropright,.50;croptop,.86666;cropbottom,0;zoomx,1.25;zoomy,.8;rotationz,-90;vertalign,bottom;horizalign,right"
end

function GetClassType( num )
	local var = GetClassNum( num )
	if not var then return "1" end
	if var == '033' then return "2" end
	if var == '034' then return "2" end
	if var == '035' then return "2" end
	if var == '077' then return "1" end
	if var == '080' then return "1" end
	if var == '083' then return "1" end
	if var == '093' then return "1" end
	if var == '096' then return "1" end
	if var == '099' then return "1" end
	if var == '109' then return "1" end
	if var == '112' then return "1" end
	if var == '115' then return "1" end
	if var == '066' then return "4" end
	if var == '069' then return "3" end
	if var == '079' then return "3" end
	if var == '081' then return "3" end
	if var == '095' then return "3" end
	if var == '097' then return "3" end
	if var == '111' then return "3" end
	if var == '113' then return "3" end
	if var >= '067' then return "2" end
	return "1"
end

function GetClassNum( num )
	if num then	return num end
	if not Profile(0).Tactics then Profile(0).Tactics = {} end
	local class = GAMESTATE:GetEnv('class') or Profile(0).Tactics.Class or 0
	class = clamp(math.floor(class),0,123)
	GAMESTATE:SetEnv('class',string.format('%3.3u',class))
	Profile(0).Tactics.Class = class
	return string.format('%3.3u',class)
end

function GetClass( num )
	if IsRidingChocobo( num ) then 
		local path = THEME:GetPath( EC_GRAPHICS, '', 'characters' )
		return path.."\/riding.xml"
	end
	return GetClassPath( num )
end

function GetClassPath( num )
	local var = GetClassNum( num )
	local path = THEME:GetPath( EC_GRAPHICS, '', 'characters' )
	local file = GetClassName( var )
	local pallet = GetClassPallet( var )
	if GAMESTATE:GetEnv('gender') == 'F' then
		if var <= '020' then
			return path.."\/"..file..pallet.."F\.png"
		end
	end
	return path.."\/"..file..pallet.."\.png"
end

function GetClassPallet( num )
	if num == '021' then return "1" end
	if num == '022' then return "2" end
	if num == '023' then return "3" end
	if num == '032' then return "1" end
	if num == '033' then return "2" end
	if num == '043' then return "2" end
	if num == '044' then return "1" end
	if num == '059' then return "1" end
	if num == '060' then return "2" end
	if num == '061' then return "3" end
	if num <= '020' then
		if GAMESTATE:GetEnv('pallet') then 
			if GAMESTATE:GetEnv('pallet') >= '2' then 
				return GAMESTATE:GetEnv('pallet')
			end
		end
	end
	return ""
end

function GetClassName( num )
	if num == '001' then return "Chemist" end
	if num == '002' then return "Knight" end
	if num == '003' then return "Archer" end
	if num == '004' then return "Monk" end
	if num == '005' then return "Priest" end
	if num == '006' then return "Wizard" end
	if num == '007' then return "Time Mage" end
	if num == '008' then return "Summoner" end
	if num == '009' then return "Thief" end
	if num == '010' then return "Mediator" end
	if num == '011' then return "Oracle" end
	if num == '012' then return "Geomancer" end
	if num == '013' then return "Lancer" end
	if num == '014' then return "Samurai" end
	if num == '015' then return "Ninja" end
	if num == '016' then return "Calculator" end
	if num == '017' then return "Bard" end
	if num == '018' then return "Mime" end
	if num == '019' then return "Dark Knight" end
	if num == '020' then return "Onion Knight" end
	if num == '021' then return "Ramza" end
	if num == '022' then return "Ramza" end
	if num == '023' then return "Ramza" end
	if num == '024' then return "Agrias" end
	if num == '025' then return "Beowulf" end
	if num == '026' then return "Cloud" end
	if num == '027' then return "Malak" end
	if num == '028' then return "Meliadoul" end
	if num == '029' then return "Mustadio" end
	if num == '030' then return "Orlandu" end
	if num == '031' then return "Rafa" end
	if num == '032' then return "Reis" end
	if num == '033' then return "Reis" end
	if num == '034' then return "Byblos" end
	if num == '035' then return "Worker 8" end
	if num == '036' then return "Balthier" end
	if num == '037' then return "Luso" end
	if num == '038' then return "Balk" end
	if num == '039' then return "Izlude" end
	if num == '040' then return "Kletian" end
	if num == '041' then return "Rofel" end
	if num == '042' then return "Vormov" end
	if num == '043' then return "Wiegraf" end
	if num == '044' then return "Wiegraf" end
	if num == '045' then return "Balmafula" end
	if num == '046' then return "Draclau" end
	if num == '047' then return "Funeral" end
	if num == '048' then return "Simon" end
	if num == '049' then return "Zalmo" end
	if num == '050' then return "Souryo" end
	if num == '051' then return "Alma" end
	if num == '052' then return "Zalbag" end
	if num == '053' then return "Dycedarg" end
	if num == '054' then return "Olan" end
	if num == '055' then return "Algus" end
	if num == '056' then return "Elmdor" end
	if num == '057' then return "Larg" end
	if num == '058' then return "Goltana" end
	if num == '059' then return "Delita" end
	if num == '060' then return "Delita" end
	if num == '061' then return "Delita" end
	if num == '062' then return "Ovelia" end
	if num == '063' then return "Gafgarion" end
	if num == '064' then return "Celia" end
	if num == '065' then return "Lede" end
	if num == '066' then return "Altima" end
	if num == '067' then return "Hashmalum" end
	if num == '068' then return "Adramelk" end
	if num == '069' then return "Zarela" end
	if num == '070' then return "Velius" end
	if num == '071' then return "Queklain" end
	if num == '072' then return "Elidibs" end
	if num == '073' then return "Archaic Demon" end
	if num == '074' then return "Ultima Demon" end
	if num == '075' then return "Apanda" end
	if num == '076' then return "Chocobo" end
	if num == '077' then return "Goblin" end
	if num == '078' then return "Red Panther" end
	if num == '079' then return "Bomb" end
	if num == '080' then return "Skeleton" end
	if num == '081' then return "Ghoul" end
	if num == '082' then return "Floatiball" end
	if num == '083' then return "Pisco Demon" end
	if num == '084' then return "Juravis" end
	if num == '085' then return "Bull Demon" end
	if num == '086' then return "Morbol" end
	if num == '087' then return "Woodman" end
	if num == '088' then return "Dragon" end
	if num == '089' then return "Behemoth" end
	if num == '090' then return "Hyudra" end
	if num == '091' then return "Uribo" end
	if num == '092' then return "Black Chocobo" end
	if num == '093' then return "Black Goblin" end
	if num == '094' then return "Cuar" end
	if num == '095' then return "Grenade" end
	if num == '096' then return "Bone Snatch" end
	if num == '097' then return "Gust" end
	if num == '098' then return "Ahriman" end
	if num == '099' then return "Squidlarkan" end
	if num == '100' then return "Steel Hawk" end
	if num == '101' then return "Minitaurus" end
	if num == '102' then return "Ochu" end
	if num == '103' then return "Trent" end
	if num == '104' then return "Blue Dragon" end
	if num == '105' then return "King Behemoth" end
	if num == '106' then return "Hydra" end
	if num == '107' then return "Porky" end
	if num == '108' then return "Red Chocobo" end
	if num == '109' then return "Gobbledeguck" end
	if num == '110' then return "Vampire" end
	if num == '111' then return "Explosive" end
	if num == '112' then return "Living Bone" end
	if num == '113' then return "Revnant" end
	if num == '114' then return "Plague" end
	if num == '115' then return "Mindflare" end
	if num == '116' then return "Cockatoris" end
	if num == '117' then return "Sacred" end
	if num == '118' then return "Great Morbol" end
	if num == '119' then return "Taiju" end
	if num == '120' then return "Red Dragon" end
	if num == '121' then return "Dark Behemoth" end
	if num == '122' then return "Tiamat" end
	if num == '123' then return "Wildbow" end
	return "Squire"
end

function GetEvalTimerY( base )
	if GetClassType() == '4' then 
		if not OnePassed() then return base+15 end
	return base-49 end
	if GetClassType() == '3' then return base end
	if not OnePassed() then return base+30 end
	if GetClassType() == '2' then return base end
	if IsRidingChocobo() then
		if STATSMAN:GetBestGrade() > GRADE_TIER08 then return base+30 end
		return base-19 
	end
	if STATSMAN:GetBestGrade() > GRADE_TIER08 then return base+15 end
	return base
end

function GetEvalTimerX( base )
	if GetClassType() == '4' then 
		if OnePassed() then if STATSMAN:GetBestGrade() > GRADE_TIER08 then return base+20 end end
	return base end	
	if not IsRidingChocobo() then return base end
	if not OnePassed() then return base+35 end
	if STATSMAN:GetBestGrade() > GRADE_TIER08 then return base+35 end
	return base+5
end

function GetNameTimerY( base )
	if GetClassType() == '4' then 
		if not OnePassed() then return base+15 end
	return base-49 end
	if GetClassType() == '3' then return base end
	if not OnePassed() then return base+30 end
	if GetClassType() == '2' then return base end
	if IsRidingChocobo() then
		if not GAMESTATE:AnyPlayerHasRankingFeats() and GetBestFinalGrade() > GRADE_TIER05 then return base+30 end
		return base-19 
	end
	if not GAMESTATE:AnyPlayerHasRankingFeats() and GetBestFinalGrade() > GRADE_TIER05 then return base+15 end
	return base
end

function GetNameTimerX( base )
	if GetClassType() == '4' then 
		if OnePassed() then if not GAMESTATE:AnyPlayerHasRankingFeats() and GetBestFinalGrade() > GRADE_TIER05 then return base+20 end end
	return base end
	if not IsRidingChocobo() then return base end
	if not OnePassed() then return base+35 end
	if not GAMESTATE:AnyPlayerHasRankingFeats() and GetBestFinalGrade() > GRADE_TIER05 then return base+35 end
	return base+5
end

function GetClassAnimation( num )
	local path = THEME:GetPath( EC_GRAPHICS, '', 'characters' )
	local var = GetClassAnimationNum( num )
	if IsRidingChocobo() then
		local var = 6
		return path.."\/Class Animation"..var
	end
	return path.."\/Class Animation"..var
end

function GetClassAnimationNum( num )
	local var = GetClassNum( num )
	if var == '001' then return "2" end
	if var == '005' then return "2" end
	if var == '006' then return "2" end
	if var == '007' then return "2" end
	if var == '008' then return "2" end
	if var == '010' then return "2" end
	if var == '011' then return "2" end
	if var == '012' then return "2" end
	if var == '016' then return "2" end
	if var == '017' then return "2" end
	if var == '018' then return "2" end
	if var == '031' then return "2" end
	if var == '032' then return "2" end
	if var == '033' then return "3" end
	if var == '034' then return "3" end
	if var == '035' then return "3" end
	if var == '045' then return "2" end
	if var == '048' then return "2" end
	if var == '049' then return "2" end
	if var == '050' then return "2" end
	if var == '051' then return "2" end
	if var == '056' then return "2" end
	if var == '057' then return "2" end
	if var == '062' then return "2" end
	if var == '064' then return "2" end
	if var == '065' then return "2" end
	if var == '066' then return "5" end
	if var == '077' then return "1" end
	if var == '080' then return "1" end
	if var == '093' then return "1" end
	if var == '096' then return "1" end
	if var == '109' then return "1" end
	if var == '112' then return "1" end
	if var == '083' then return "2" end
	if var == '099' then return "2" end
	if var == '115' then return "2" end
	if var == '082' then return "4" end
	if var == '084' then return "4" end
	if var == '090' then return "4" end
	if var == '098' then return "4" end
	if var == '100' then return "4" end
	if var == '106' then return "4" end
	if var == '114' then return "4" end
	if var == '116' then return "4" end
	if var == '122' then return "4" end
	if var >= '067' then return "3" end
	return "1"
end

function IsRidingChocobo( num )
	if num then return false end
	local type = GetClassType( num )
	if type ~= '1' then return false end
	if GAMESTATE:GetEnv('chocobo') == '076' then return true end
	if GAMESTATE:GetEnv('chocobo') == '092' then return true end
	if GAMESTATE:GetEnv('chocobo') == '108' then return true end
	return false
end	

function GetChocobo()
	local num = GAMESTATE:GetEnv('chocobo')
	if num then 
		if num ~= '0' then return GetClass( num ) end
	end
	return GetClass( '076' )
end

function GetChocoboOverlay()
	local num = GAMESTATE:GetEnv('chocobo')
	local path = THEME:GetPath( EC_GRAPHICS, '', 'characters' )
	local file = GetClassName( num )
	if num then
		if num ~= '0' then return path.."\/"..file.." rider\.png" end
	end
	local file = GetClassName('076')
	return path.."\/"..file.." rider\.png"
end

function GetChocoboInit()
	return GetClassInit('076')
end

function GetClassCode( num )
	if num <= '020' then return "" end
	local start = num - 20
	local part1 = math.mod(math.floor(start/64),4)
	local part2 = math.mod(math.floor(start/16),4)
	local part3 = math.mod(math.floor(start/4),4)
	local part4 = math.mod(start,4)
	local arrow1 = GetArrow( part1 )
	local arrow2 = GetArrow( part2 )
	local arrow3 = GetArrow( part3 )
	local arrow4 = GetArrow( part4 )
	return "L R "..arrow1..arrow2..arrow3..arrow4
end

function GetArrow( num )
	if num == 0 then return "L " end
	if num == 1 then return "U " end
	if num == 2 then return "D " end
	if num == 3 then return "R " end
end	