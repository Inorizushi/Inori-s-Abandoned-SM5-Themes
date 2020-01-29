function curved_wheel_transform(self,offsetFromCenter,_fake1,_fake2)
	self:x( math.sin(offsetFromCenter*(math.pi/10))*330 );
	self:y(-math.cos(offsetFromCenter*(math.pi/10))*280);
	local function GetRotationZ(offsetFromCenter)
		if offsetFromCenter > 0.9 then
			return 18+(offsetFromCenter-0.9)*14;
		elseif offsetFromCenter < -0.9 then
			return -18+(offsetFromCenter+0.9)*14;
		else
			return offsetFromCenter*18/0.9;
		end;
	end;
	self:rotationz(GetRotationZ(offsetFromCenter))
	self:z(1-math.abs(offsetFromCenter));
	self:draworder( math.abs(offsetFromCenter)*10 );
end
