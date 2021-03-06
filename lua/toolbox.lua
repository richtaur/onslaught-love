toolbox = {}

function toolbox.actorsCollide (actorA, actorB)
	if actorA.x < actorB.x + TILE_SIZE and
		actorA.x + TILE_SIZE > actorB.x and
		actorA.y < actorB.y + TILE_SIZE and
		actorA.y + TILE_SIZE > actorB.y then
			return true
		end
	return false
end

function toolbox.distance (x1, y1, x2, y2)
	local dx = x1 - x2
	local dy = y1 - y2
	return math.sqrt(dx * dx + dy * dy)
end

function toolbox.vectorBetween (x1, y1, x2, y2)
	local vector = makeVector(0, 0)
	vector.x = x2 - x1
	vector.y = y2 - y1

	local length = math.sqrt(vector.x * vector.x + vector.y * vector.y)
	vector.x = vector.x / length
	vector.y = vector.y / length

	return vector
end
