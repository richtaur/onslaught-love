require("actor")
require("actorData")

-- Constants (fake)
SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 768
MARGIN = 16
SPRITE_SIZE = 32

-- Setup
charactersSmallFrames = {}
paused = false
text = "Centered Text Hi"

-- Actors
player = makeActor(actorData.player)
goblin = makeActor(actorData.goblin)
goblin.x = SCREEN_WIDTH / 2;
goblin.y = SCREEN_HEIGHT / 2;

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
    	charactersSmallFrames[sheetIndex] = love.graphics.newQuad(x * SPRITE_SIZE, y * SPRITE_SIZE, SPRITE_SIZE, SPRITE_SIZE, charactersSmallImage:getDimensions())
      sheetIndex = sheetIndex + 1
    end
  end

	-- charactersSmallFrames[1] = love.graphics.newQuad(8 * SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE, charactersSmallImage:getDimensions())
	-- charactersSmallFrames[2] = love.graphics.newQuad(9 * SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE, charactersSmallImage:getDimensions())

	player.frame = charactersSmallFrames[player.frameNumber]
	goblin.frame = charactersSmallFrames[goblin.frameNumber]

  -- Sound effect?
  -- sound = love.audio.newSource("sounds/monster_damage", "stream")

  -- Sounds
  monsterDamageSound = love.audio.newSource("sounds/monster_damage.mp3", "static")

  -- Music
  sewersMusic = love.audio.newSource("music/sewers.mp3", "stream")
  -- love.audio.play(sewersMusic)
end

function love.draw()
  love.graphics.draw(envSewerImage, 0, 0)

  -- Draw actors
  love.graphics.draw(charactersSmallImage, player.frame, player.x, player.y)
  love.graphics.draw(charactersSmallImage, goblin.frame, goblin.x, goblin.y)

  love.graphics.print(text, MARGIN, SCREEN_HEIGHT - (MARGIN * 2))

  if paused then
    love.graphics.print("PAUSED", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
  end
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

  -- Space key (debugging for now)
  if key == 'space' then
    love.audio.play(monsterDamageSound)
    print("test")
  end
end

function love.update(dt)
  -- Paused: do nothing
  if paused then
    return
  end

  -- Player movement
  playerOffset = player.speed * dt
  if keyIsDown("up") or keyIsDown("w") then
    player.y = player.y - playerOffset
  elseif keyIsDown("down") or keyIsDown("s") then
    player.y = player.y + playerOffset
  end
  if keyIsDown("left") or keyIsDown("a") then
    player.x = player.x - playerOffset
  elseif keyIsDown("right") or keyIsDown("d") then
    player.x = player.x + playerOffset
  end

  -- Actor animations
  for actorId, actor in pairs(actors) do
    actor.update(dt)
  end
end
