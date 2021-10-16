playerBehavior = function (self, dt)
	print("player behavior")

	-- Movement
	self.movementVector.x = 0;
	self.movementVector.y = 0;
	self.running = keyIsDown("lshift") or keyIsDown("rshift")
	if keyIsDown("w") then
		self.movementVector.y = -1
	elseif keyIsDown("s") then
		self.movementVector.y = 1
	end
	if keyIsDown("a") then
		self.movementVector.x = -1
	elseif keyIsDown("d") then
		self.movementVector.x = 1
	end

	-- Projectiles
	if self.life > 0 then
		local aimVector = makeVector(0, 0)
		if keyIsDown("left") then
			aimVector.x = -1
		elseif keyIsDown("right") then
			aimVector.x = 1
		end
		if keyIsDown("up") then
			aimVector.y = -1
		elseif keyIsDown("down") then
			aimVector.y = 1
		end
		if aimVector.x ~= 0 or aimVector.y ~= 0 then
			-- Spawn a weapon at this tile
			local actor = makeActor(actorData.sword, self.team)
			actor.x = self.x
			actor.y = self.y
			actor.frame = charactersSmallFrames[actor.frameNumber]
			actor.movementVector = aimVector
		end
	end
end
