-- Constants (fake)
SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 768
MARGIN = 16
TILE_SIZE = 32

TEAM_PLAYER = 1
TEAM_MONSTER = 2

require("lua/actor")
require("lua/actorData")
require("lua/images")
require("lua/sounds")
require("lua/tilemap")
require("lua/toolbox")
require("lua/vector")

-- Setup
charactersSmallFrames = {}
objectFrames = {}
paused = false

-- Actors
player = makeActor(actorData.player, TEAM_PLAYER)

-- Functions ...
keyIsDown = love.keyboard.isDown

function love.load ()
	-- Load assets
	images.load()
	sounds.load()

	-- Load the small characters sprite sheet and assign frames
	sheetIndex = 0
	for y = 0, 21 do
		for x = 0, 21 do
			charactersSmallFrames[sheetIndex] = love.graphics.newQuad(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE, images.sources.characters:getDimensions())
			sheetIndex = sheetIndex + 1
		end
	end

	player.frame = charactersSmallFrames[player.frameNumber]

	-- Load objects and sprite sheet
	sheetIndex = 0
	for y = 0, 8 do
		for x = 0, 12 do
			objectFrames[sheetIndex] = love.graphics.newQuad(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE, images.sources.objects:getDimensions())
			sheetIndex = sheetIndex + 1
		end
	end

	-- Music
	sewersMusic = love.audio.newSource("music/sewers.mp3", "stream")
	-- love.audio.play(sewersMusic)
end

function love.draw ()
	-- Draw environment
	love.graphics.draw(images.sources.sewers, 0, 0)
	-- tilemap.draw() -- DEBUG: show the tilemap

	-- Draw actors
	for key, actor in pairs(actors) do
		love.graphics.draw(images.sources.characters, actor.frame, actor.x, actor.y)
	end

	-- Paused notification
	if paused then
		love.graphics.print("PAUSED", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 0, 4)
	end

	-- DEBUG text
	local controlsText = "Click to spawn goblin\nPress SPACE to kill all goblins"
	love.graphics.print(controlsText, MARGIN, SCREEN_HEIGHT - (MARGIN * 4), 0, 2)
end

function love.keypressed (key)
	-- Escape to pause
	if key == "escape" then
		if paused then
			paused = false
			love.audio.play(sewersMusic)
		else
			paused = true
			love.audio.pause(sewersMusic)
		end
	end

	-- Space key (debugging for now)
	if key == "space" then
		sounds.play("monsterDamageSound")
		print("test")

		-- Kill all actors not in team 1
		for key, actor in pairs(actors) do
			if actor.team ~= 1 then
				actors[key] = nil
			end
		end
	end
end

function love.mousepressed (x, y, button, istouch, presses)
	local tileX = math.floor(x / TILE_SIZE)
	local tileY = math.floor(y / TILE_SIZE)
	print("Clicked tile: " .. tileX .. ", " .. tileY)

	-- Spawn a goblin at this tile
	local actor = makeActor(actorData.goblin, TEAM_MONSTER)
	actor.x = tileX * TILE_SIZE
	actor.y = tileY * TILE_SIZE
	actor.frame = charactersSmallFrames[actor.frameNumber]

	sounds.play("wizardReappear")
end

function love.update (dt)
	-- Paused: do nothing
	if paused then
		return
	end

	-- Update actors
	for key, actor in pairs(actors) do
		actor.update(dt)
	end

	-- Remove dead actors
	for key, actor in pairs(actors) do
		if actor.life <= 0 then
			actors[key] = nil
		end
	end
end
