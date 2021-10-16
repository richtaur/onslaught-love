SPRITE_SIZE = 32

charactersSmallFrames = {}

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
  love.graphics.print("Centered Text Hi", 320, 240)

  love.graphics.draw(envSewerImage, 0, 0)

  -- love.graphics.draw(charactersSmallImage, 0, 0)
  love.graphics.draw(charactersSmallImage, charactersSmallFrameActive, 320, 240)
end
