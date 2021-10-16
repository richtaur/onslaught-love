SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 768
MARGIN = 16
SPRITE_SIZE = 32

charactersSmallFrames = {}
text = "Centered Text Hi"

function love.load()
  -- Images
  envSewerImage = love.graphics.newImage("images/arena_02.png")

  -- Load the small characters sprite sheet and assign frames
  charactersSmallImage = love.graphics.newImage("images/sheet_characters_small.png")
	charactersSmallFrames[1] = love.graphics.newQuad(8 * SPRITE_SIZE, 0, SPRITE_SIZE, SPRITE_SIZE, charactersSmallImage:getDimensions())
	charactersSmallFrameActive = charactersSmallFrames[1]

  -- Sound effect?
  -- sound = love.audio.newSource("sounds/monster_damage", "stream")

  -- Music
  -- winMusic = love.audio.newSource("music/win.mp3", "stream")
  -- love.audio.play(winMusic)
end

function love.draw()
  love.graphics.draw(envSewerImage, 0, 0)

  -- love.graphics.draw(charactersSmallImage, 0, 0)
  love.graphics.draw(charactersSmallImage, charactersSmallFrameActive, 320, 240)

  love.graphics.print(text, MARGIN, SCREEN_HEIGHT - (MARGIN * 2))
end

function love.keypressed(key)
  if key == 'up' then
    text = "up"
  elseif key == 'down' then
    text = "down"
  end
end
