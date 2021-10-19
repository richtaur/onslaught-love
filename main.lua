require("lua/definitions")
require("lua/actor")
require("lua/actorData")
require("lua/disk")
require("lua/gameData")
require("lua/images")
require("lua/sounds")
require("lua/tilemap")
require("lua/toolbox")
require("lua/vector")

-- Setup
paused = false

-- Functions ...
keyIsDown = love.keyboard.isDown

function love.load ()
	-- Load assets
	images.load()
	sounds.load()

	-- Load game data
	disk.load()

	-- Music
	if gameData.values.playMusic then
		love.audio.play(sounds.sources.sewersMusic)
	end

	-- Player
	local player = makeActor(actorData.player, TEAM_PLAYER)
	player.x = (SCREEN_WIDTH / 2) - (TILE_SIZE / 2)
	player.y = (SCREEN_HEIGHT / 2) - (TILE_SIZE * 3)

	-- Gates
	gates = {}
	gates[1] = makeActor(actorData.gate, 0)
	gates[1].x = 6 * TILE_SIZE
	gates[1].y = 0 * TILE_SIZE

	gates[2] = makeActor(actorData.gate, 0)
	gates[2].x = 15 * TILE_SIZE
	gates[2].y = 0 * TILE_SIZE

	gates[2] = makeActor(actorData.gate, 0)
	gates[2].x = 24 * TILE_SIZE
	gates[2].y = 0 * TILE_SIZE

	-- Spawner
	local spawner = makeActor(actorData.spawner, 2)
	spawner.x = 4 * TILE_SIZE
	spawner.y = 4 * TILE_SIZE
end

function love.draw ()
	-- Draw environment
	love.graphics.draw(images.sources.sewers, 0, 0)
	-- tilemap.draw() -- DEBUG: show the tilemap

	-- Draw actors
	local halfTile = TILE_SIZE / 2
	for key, actor in pairs(actors) do
		-- love.graphics.rectangle("fill", actor.x, actor.y, TILE_SIZE, TILE_SIZE, 0, 0); -- DEBUG: draw rectangle behind sprite
		if actor.imageKey ~= nil then
			love.graphics.draw(images.sources[actor.imageKey], actor.frame, actor.x + halfTile, actor.y + halfTile, actor.rotation, 1, 1, halfTile, halfTile)
		end
	end

	-- Paused notification
	if paused then
		love.graphics.print("PAUSED", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 0, 4)
	end

	-- Controls / how to play text
	local controlsText = "Click to spawn goblin\nPress M to toggle music\nPress SPACE to kill all goblins"
	love.graphics.print(controlsText, MARGIN, SCREEN_HEIGHT - 100, 0, 1.5)
end

function love.keypressed (key)
	-- Escape to pause
	if key == "escape" then
		if paused then
			paused = false
			if gameData.values.playMusic then
				love.audio.play(sounds.sources.sewersMusic)
			end
		else
			paused = true
			love.audio.pause(sounds.sources.sewersMusic)
		end
	end

	-- M to toggle music
	if key == "m" and not paused then
		if gameData.values.playMusic then
			gameData.values.playMusic = false
			love.audio.pause(sounds.sources.sewersMusic)
		else
			gameData.values.playMusic = true
			love.audio.play(sounds.sources.sewersMusic)
		end
		disk.save()
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
