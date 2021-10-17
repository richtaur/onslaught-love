playerBehavior = function (self, dt)
	if self.life <= 0 then
		return
	end

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

	-- Cooldown
	self.behaviorConfig.cooldownElapsed = self.behaviorConfig.cooldownElapsed + dt
	if self.behaviorConfig.cooldownElapsed < self.behaviorConfig.cooldownDuration then
		return
	end

	-- Projectiles
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
		-- Reset cooldown
		self.behaviorConfig.cooldownElapsed = 0

		-- Spawn a weapon at this tile
		local actor = makeActor(actorData.sword, self.team)
		actor.x = self.x
		actor.y = self.y
		actor.movementVector = aimVector

		if actor.rotateWithTrajectory then
			actor.rotation = math.atan2(aimVector.x, -aimVector.y)
		end

		sounds.play("charAttacks")
	end

end
