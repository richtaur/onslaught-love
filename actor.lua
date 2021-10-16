actors = {}

local actorId = 0;
makeActor = function (data, team)
	actorId = actorId + 1

	local actor = {}
	actor.id = actorId
	actor.team = team
	actor.target = nil
	actor.elapsedTime = 0
	actor.animationInterval = 0.5
	actor.frame = nil
	actor.speed = data.speed * TILE_SIZE
	actor.movementVector = makeVector(0, 0)
	actor.x = 320
	actor.y = 240

	-- Apply actor data
	actor.behavior = data.behavior
	actor.behaviorConfig = data.behaviorConfig
	actor.frameMin = data.frameMin
	actor.frameMax = data.frameMax
	actor.frameNumber = actor.frameMin

	actor.update = function (dt)
		-- Update behavior
		if actor.behavior ~= nil then
			actor.behavior(actor, dt)
		end

		-- Update animation frame
	  actor.elapsedTime = actor.elapsedTime + dt
	  if actor.elapsedTime > actor.animationInterval then
	    actor.elapsedTime = 0
	    actor.frameNumber = actor.frameNumber + 1
	    if actor.frameNumber > actor.frameMax then
	      actor.frameNumber = actor.frameMin
	    end
	    actor.frame = charactersSmallFrames[actor.frameNumber]
	  end

		-- Update movement
	  local offset = actor.speed * dt
		local previousX = actor.x
    actor.x = actor.x + (actor.movementVector.x * offset)
		if tilemap.checkActorCollision(actor) then
			actor.x = previousX
		end

		local previousY = actor.y
    actor.y = actor.y + (actor.movementVector.y * offset)
		if tilemap.checkActorCollision(actor) then
			actor.y = previousY
		end

	end

	actors[actorId] = actor;
	return actor;
end
