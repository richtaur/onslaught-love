spawnerBehavior = function (self, dt)
	-- Cooldown
	self.behaviorConfig.cooldownElapsed = self.behaviorConfig.cooldownElapsed + dt
	if self.behaviorConfig.cooldownElapsed < self.behaviorConfig.cooldownDuration then
		return
	end

	-- Reset cooldown
	self.behaviorConfig.cooldownElapsed = 0

	-- Spawn an actor at this tile
	local actor = makeActor(self.behaviorConfig.spawnActor, self.team)
	actor.x = self.x
	actor.y = self.y

	sounds.play("wizardReappear")
end
