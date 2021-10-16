chaseBehavior = function (self, dt)
	-- Find a target
	if self.target == nil then
		for actorId, actor in pairs(actors) do
			if actor.team > 0 and actor.team ~= self.team then
				self.target = actor
				break
			end
		end
	end

	-- Chase the target ...

	-- Reset movement
	local movementVector = self.movementVector
	movementVector.x = 0
	movementVector.y = 0

	-- Determine proximity
	local target = self.target
	local distance = toolbox.distance(self.x, self.y, target.x, target.y)
	local aimVector = toolbox.vectorBetween(self.x, self.y, target.x, target.y)
	if distance > self.behaviorConfig.proximityMax then
		self.movementVector = aimVector
	elseif distance < self.behaviorConfig.proximityMin then
		self.movementVector.x = aimVector.x * -1
		self.movementVector.y = aimVector.y * -1
	end

end
