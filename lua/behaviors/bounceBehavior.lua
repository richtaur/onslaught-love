bounceBehavior = function (self, dt)
	-- Reset movement
	local movementVector = self.movementVector
	if movementVector.x == 0 and movementVector.y == 0 then
		movementVector.x = love.math.random(-100, 100) / 100
		movementVector.y = love.math.random(-100, 100) / 100
	end

	if true then
		return
	end

	-- Find a target
	if self.target == nil then
		for key, actor in pairs(actors) do
			if actor.team > 0 and actor.team ~= self.team then
				self.target = actor
				break
			end
		end
	end
	if self.target == nil then
		return
	end

	-- Chase the target ...

	-- Reset movement
	local movementVector = self.movementVector
	movementVector.x = 0
	movementVector.y = 0

	-- Determine proximity to target
	local target = self.target
	local distance = toolbox.distance(self.x, self.y, target.x, target.y)
	local aimVector = toolbox.vectorBetween(self.x, self.y, target.x, target.y)
	if distance <= self.behaviorConfig.proximityTrigger then
		-- Start chasing
		self.movementVector = aimVector
	end

end
