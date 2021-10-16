-- Constants (fake)
SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 768
MARGIN = 16
SPRITE_SIZE = 32

-- Setup
charactersSmallFrames = {}
text = "Centered Text Hi"

-- Player
player = {}
player.elapsedTime = 0
player.animationInterval = 0.5
player.frameNumber = 1

-- Functions ...

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
  -- winMusic = love.audio.newSource("music/win.mp3", "stream")
  -- love.audio.play(winMusic)
end

function love.draw()
  love.graphics.draw(envSewerImage, 0, 0)

  -- love.graphics.draw(charactersSmallImage, 0, 0)
  love.graphics.draw(charactersSmallImage, charactersSmallFrame, 320, 240)

  love.graphics.print(text, MARGIN, SCREEN_HEIGHT - (MARGIN * 2))
end

function love.keypressed(key)
  if key == 'up' then
    text = "up"
    love.audio.play(monsterDamageSound)
  elseif key == 'down' then
    text = "down"
    love.audio.play(monsterDamageSound)
  end
end

function love.update(dt)
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
