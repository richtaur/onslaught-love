require("lua/arenaTilemap")
-- require("lua/sewersTilemap")

tilemap = {}
tilemap.width = 0
tilemap.height = 0
tilemap.tiles = {}

tilemap.draw = function ()
	for y = 1, tilemap.height do
		for x = 1, tilemap.width do
			local tile = tilemap.tiles[y][x]
			if tile > 0 then
				local tileX = (x - 1) * TILE_SIZE
				local tileY = (y - 1) * TILE_SIZE
				love.graphics.draw(images.sources.objects, images.frames.objects[tile], tileX, tileY)
			end
		end
	end
end

tilemap.load = function (loadTilemap)
	tilemap.width = loadTilemap.width
	tilemap.height = loadTilemap.height
	tilemap.tiles = loadTilemap.tiles
end

tilemap.checkActorCollision = function (actor)
	if tilemap.checkTile(actor.x, actor.y) then
		return true
	end
	if tilemap.checkTile(actor.x + TILE_SIZE, actor.y) then
		return true
	end
	if tilemap.checkTile(actor.x, actor.y + TILE_SIZE) then
		return true
	end
	if tilemap.checkTile(actor.x + TILE_SIZE, actor.y + TILE_SIZE) then
		return true
	end

	return false
end

tilemap.checkTile = function (x, y)
	local tileX = math.floor(x / TILE_SIZE) + 1
	if tileX < 1 or tileX > tilemap.width then
		return true
	end

	local tileY = math.floor(y / TILE_SIZE) + 1
	if tileY < 1 or tileY > tilemap.height then
		return true
	end

	if tilemap.tiles[tileY][tileX] > 0 then
		return true
	end

	return false
end

tilemap.load(arenaTilemap)
