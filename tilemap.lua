require("sewersTilemap")

tilemap = {}
tilemap.tiles = {}

tilemap.draw = function()
  -- love.graphics.draw(charactersSmallImage, 0, 0, 0)
end

tilemap.load = function(tiles)
	print("load()")
	tilemap.tiles = tiles
end

tilemap.load(sewersTilemap)
