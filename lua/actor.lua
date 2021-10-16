actors = {}

local actorId = 0;
makeActor = function (data, team)
	actorId = actorId + 1

	local self = {}
	self.id = actorId
	self.team = team
	self.target = nil
	self.elapsedTime = 0
	self.animationInterval = 0.5
	self.frame = nil
	self.speed = data.speed * TILE_SIZE
	self.speedMax = data.speedMax * TILE_SIZE
	self.running = false
	self.movementVector = makeVector(0, 0)
	self.x = 320
	self.y = 240

	-- Apply actor data
	self.behavior = data.behavior
	self.behaviorConfig = data.behaviorConfig
	self.damage = data.damage
	self.damageFromTilemap = data.damageFromTilemap
	self.life = data.life
	self.frameMin = data.frameMin
	self.frameMax = data.frameMax
	self.frameNumber = self.frameMin

	self.collide = function (actor)
		actor.life = actor.life - self.damage
	end

	self.update = function (dt)
		-- Update behavior
		if self.behavior ~= nil then
			self.behavior(self, dt)
		end

		-- Update animation frame
		self.elapsedTime = self.elapsedTime + dt
		if self.elapsedTime > self.animationInterval then
			self.elapsedTime = 0
			self.frameNumber = self.frameNumber + 1
			if self.frameNumber > self.frameMax then
				self.frameNumber = self.frameMin
			end
			self.frame = charactersSmallFrames[self.frameNumber]
		end

		-- Update movement ...

		local offset = self.speed * dt
		if self.running then
			offset = self.speedMax * dt
		end
		local previousX = self.x
		local tilemapCollision = false
		self.x = self.x + (self.movementVector.x * offset)
		if tilemap.checkActorCollision(self) then
			self.x = previousX
			tilemapCollision = true
		end

		local previousY = self.y
		self.y = self.y + (self.movementVector.y * offset)
		if tilemap.checkActorCollision(self) then
			self.y = previousY
			tilemapCollision = true
		end

		if tilemapCollision and self.damageFromTilemap > 0 then
			self.life = self.life - self.damageFromTilemap
		end

		-- Detect collision with other actors
		for key, actor in pairs(actors) do
			if key ~= actorId then
				if actor.team ~= self.team then
					-- Check collision on this dude
					if toolbox.actorsCollide(actor, self) then
						self.collide(actor)
						actor.collide(self)
					end
				end
			end
		end
	end

	actors[actorId] = self;
	return self;
end
