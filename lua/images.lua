images = {}
images.sources = {}
images.frames = {}

images.load = function ()
	print("images.load")

	local sheetIndex = 0

	-- Load the small characters sprite sheet and assign frames
	images.sources.characters = love.graphics.newImage("images/sheet_characters_small.png")
	images.frames.charactersSmall = {}
	sheetIndex = 0
	for y = 0, 21 do
		for x = 0, 21 do
			images.frames.charactersSmall[sheetIndex] = love.graphics.newQuad(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE, images.sources.characters:getDimensions())
			sheetIndex = sheetIndex + 1
		end
	end

	-- Load objects and sprite sheet
	images.sources.objects = love.graphics.newImage("images/sheet_objects.png")
	images.frames.objects = {}
	sheetIndex = 0
	for y = 0, 8 do
		for x = 0, 12 do
			images.frames.objects[sheetIndex] = love.graphics.newQuad(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE, images.sources.objects:getDimensions())
			sheetIndex = sheetIndex + 1
		end
	end

	images.sources.sewers = love.graphics.newImage("images/arena_02.png")
end
