images = {}
images.sources = {}

images.load = function ()
	print("images.load")

	images.sources.characters = love.graphics.newImage("images/sheet_characters_small.png")
	images.sources.objects = love.graphics.newImage("images/sheet_objects.png")
	images.sources.sewers = love.graphics.newImage("images/arena_02.png")
end
