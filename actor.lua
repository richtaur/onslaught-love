actors = {}

local actorId = 0;
makeActor = function(data, team)
	actorId = actorId + 1

	local actor = {}
	actor.id = actorId
	actor.team = team
	actor.target = nil
	actor.elapsedTime = 0
	actor.animationInterval = 0.5
	actor.frame = nil
	actor.speed = TILE_SIZE * 4 -- tiles per second
	actor.movementVector = makeVector(0, 0)
	actor.x = 320
	actor.y = 240

	-- Apply actor data
	actor.behavior = data.behavior
	actor.frameMin = data.frameMin
	actor.frameMax = data.frameMax
	actor.frameNumber = actor.frameMin

	actor.update = function(dt)
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
    actor.x = actor.x + (actor.movementVector.x * offset)
    actor.y = actor.y + (actor.movementVector.y * offset)
	end

	actors[actorId] = actor;
	return actor;
end
