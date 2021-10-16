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
	-- local target = self.target
	-- if self.x < target.x then
	--	self.x 
end
