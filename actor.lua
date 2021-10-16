actors = {}
actorId = 0;

makeActor = function()
	actorId = actorId + 1

	actor = {}
	actor.id = actorId
	actor.elapsedTime = 0
	actor.animationInterval = 0.5
	actor.frame = 0
	actor.frameNumber = 1
	actor.speed = SPRITE_SIZE * 4 -- tiles per second
	actor.x = 320
	actor.y = 240

	actors[actorId] = actor;
	return actor;
end
