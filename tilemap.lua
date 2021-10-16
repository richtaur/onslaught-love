require("sewersTilemap")

tilemap = {}
tilemap.config = {}
tilemap.tiles = {}

tilemap.draw = function()
  for y = 1, tilemap.config.height do
    for x = 1, tilemap.config.width do
			local tile = tilemap.tiles[y][x]
			if tile > 0 then
				local tileX = (x - 1) * TILE_SIZE
				local tileY = (y - 1) * TILE_SIZE
			  love.graphics.draw(objectsImage, objectFrames[tile], tileX, tileY)
			end
		end
	end
end

tilemap.load = function(loadTilemap)
	tilemap.config = loadTilemap.config
	tilemap.tiles = loadTilemap.tiles
end

tilemap.load(sewersTilemap)
