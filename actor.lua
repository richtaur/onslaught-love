actors = {}
actorId = 0;

makeActor = function(actorData)
	actorId = actorId + 1

	local actor = {}
	actor.id = actorId
	actor.elapsedTime = 0
	actor.animationInterval = 0.5
	actor.frame = 0
	actor.frameMin = actorData.frameMin
	actor.frameMax = actorData.frameMax
	actor.frameNumber = actor.frameMin
	actor.speed = SPRITE_SIZE * 4 -- tiles per second
	actor.x = 320
	actor.y = 240

	actor.update = function(dt)
	  actor.elapsedTime = actor.elapsedTime + dt
	  if actor.elapsedTime > actor.animationInterval then
	    actor.elapsedTime = 0
	    actor.frameNumber = actor.frameNumber + 1
	    if actor.frameNumber > actor.frameMax then
	      actor.frameNumber = actor.frameMin
	    end
	    actor.frame = charactersSmallFrames[actor.frameNumber]
	  end
	end

	actors[actorId] = actor;
	return actor;
end
