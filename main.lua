-- Constants (fake)
SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 768
MARGIN = 16
SPRITE_SIZE = 32

-- Setup
charactersSmallFrames = {}
paused = false
text = "Centered Text Hi"

require("player")

-- Functions ...
keyIsDown = love.keyboard.isDown

function love.load()
  -- Images
  envSewerImage = love.graphics.newImage("images/arena_02.png")

  -- Load the small characters sprite sheet and assign frames
  charactersSmallImage = love.graphics.newImage("images/sheet_characters_small.png")
	charactersSmallFrames[1] = love.graphics.newQuad(8 * SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE, charactersSmallImage:getDimensions())
	charactersSmallFrames[2] = love.graphics.newQuad(9 * SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE, charactersSmallImage:getDimensions())
	charactersSmallFrame = charactersSmallFrames[player.frameNumber]

  -- Sound effect?
  -- sound = love.audio.newSource("sounds/monster_damage", "stream")

  -- Sounds
  monsterDamageSound = love.audio.newSource("sounds/monster_damage.mp3", "static")

  -- Music
  sewersMusic = love.audio.newSource("music/sewers.mp3", "stream")
  love.audio.play(sewersMusic)
end

function love.draw()
  love.graphics.draw(envSewerImage, 0, 0)

  -- love.graphics.draw(charactersSmallImage, 0, 0)
  -- Draw player
  love.graphics.draw(charactersSmallImage, charactersSmallFrame, player.x, player.y)

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

  -- Player animation
  player.elapsedTime = player.elapsedTime + dt
  if player.elapsedTime > player.animationInterval then
    player.elapsedTime = 0
    player.frameNumber = player.frameNumber + 1
    if player.frameNumber > 2 then
      player.frameNumber = 1
    end
    charactersSmallFrame = charactersSmallFrames[player.frameNumber]
  end

end
