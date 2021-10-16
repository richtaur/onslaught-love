chaseBehavior = function(self, dt)
	-- Find a target
	if self.target == nil then
		print("I ned target")
	  for actorId, actor in pairs(actors) do
			if actor.team ~= self.team then
				print("GOT target")
				self.target = actor
				break
			end
		end
	end

	-- Chase the target
	local movementVector = self.movementVector
	movementVector.x = 0
	movementVector.y = 0

	local target = self.target
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
