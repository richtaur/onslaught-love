chaseBehavior = function(self, dt)
	-- Find a target
	if self.target == nil then
	  for actorId, actor in pairs(actors) do
			if actor.team ~= self.team then
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
	if distance > self.behaviorConfig.proximityMax then
		-- Move towards target
		if self.x < target.x then
			movementVector.x = 1
		elseif self.x > target.x then
			movementVector.x = -1
		end
		if self.y < target.y then
			movementVector.y = 1
		elseif self.y > target.y then
			movementVector.y = -1
		end
	end

end
