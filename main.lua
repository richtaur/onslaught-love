-- Constants (fake)
SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 768
MARGIN = 16
TILE_SIZE = 32

require("actor")
require("actorData")
require("toolbox")
require("vector")

-- Setup
charactersSmallFrames = {}
paused = false

-- Actors
player = makeActor(actorData.player, 1)

-- Functions ...
keyIsDown = love.keyboard.isDown

function love.load()
  -- Images
  envSewerImage = love.graphics.newImage("images/arena_02.png")

  -- Load the small characters sprite sheet and assign frames
  charactersSmallImage = love.graphics.newImage("images/sheet_characters_small.png")

  sheetIndex = 0
  for y = 0, 21 do
    for x = 0, 21 do
    	charactersSmallFrames[sheetIndex] = love.graphics.newQuad(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE, charactersSmallImage:getDimensions())
      sheetIndex = sheetIndex + 1
    end
  end

	player.frame = charactersSmallFrames[player.frameNumber]

  -- Sounds
  monsterDamageSound = love.audio.newSource("sounds/monster_damage.mp3", "static")

  -- Music
  sewersMusic = love.audio.newSource("music/sewers.mp3", "stream")
  -- love.audio.play(sewersMusic)
end

function love.draw()
  love.graphics.draw(envSewerImage, 0, 0)

  -- Draw actors
  for actorId, actor in pairs(actors) do
    love.graphics.draw(charactersSmallImage, actor.frame, actor.x, actor.y)
  end

  -- Paused notification
  if paused then
    love.graphics.print("PAUSED", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
  end

  -- DEBUG text
  local controlsText = "Click to spawn goblin\nPress SPACE to kill all goblins"
  love.graphics.print(controlsText, MARGIN, SCREEN_HEIGHT - (MARGIN * 4), 0, 2)
end

function love.keypressed(key)
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

  -- Projectiles
  local aimVector = makeVector(0, 0)
  if key == "left" then
    aimVector.x = -1
  elseif key == "right" then
    aimVector.x = 1
  end
  if key == "up" then
    aimVector.y = -1
  elseif key == "down" then
    aimVector.y = 1
  end
  if aimVector.x ~= 0 or aimVector.y ~= 0 then
    print("spawn");

    -- Spawn a weapon at this tile
    local actor = makeActor(actorData.sword, 0)
    actor.x = player.x
    actor.y = player.y
  	actor.frame = charactersSmallFrames[actor.frameNumber]
    actor.movementVector = aimVector
  end

  -- Space key (debugging for now)
  if key == "space" then
    love.audio.play(monsterDamageSound)
    print("test")

    -- Kill all actors not in team 1
    for actorId, actor in pairs(actors) do
      if actor.team ~= 1 then
        -- actors.remove(actorId)
        actors[actorId] = nil
      end
    end
  end
end

function love.mousepressed(x, y, button, istouch, presses)
  local tileX = math.floor(x / TILE_SIZE)
  local tileY = math.floor(y / TILE_SIZE)
  print("Clicked tile: " .. tileX .. ", " .. tileY)

  -- Spawn a goblin at this tile
  local actor = makeActor(actorData.goblin, 0)
  actor.x = tileX * TILE_SIZE
  actor.y = tileY * TILE_SIZE
	actor.frame = charactersSmallFrames[actor.frameNumber]
end

function love.update(dt)
  -- Paused: do nothing
  if paused then
    return
  end

  -- Player movement
  player.movementVector.x = 0;
  player.movementVector.y = 0;
  if keyIsDown("w") then
    player.movementVector.y = -1
  elseif keyIsDown("s") then
    player.movementVector.y = 1
  end
  if keyIsDown("a") then
    player.movementVector.x = -1
  elseif keyIsDown("d") then
    player.movementVector.x = 1
  end

  -- Update actors
  for actorId, actor in pairs(actors) do
    actor.update(dt)
  end
end
