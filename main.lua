function love.load()
  -- Images
  charactersSmallImage = love.graphics.newImage("images/sheet_characters_small.png")
  envSewerImage = love.graphics.newImage("images/arena_02.png")

  -- Sound effect?
  -- sound = love.audio.newSource("sounds/monster_damage", "stream")

  -- Music
  winMusic = love.audio.newSource("music/win.mp3", "stream")
  love.audio.play(winMusic)
end

function love.draw()
  love.graphics.print("Centered Text Hi", 320, 240)

  love.graphics.draw(envSewerImage, 0, 0)
  love.graphics.draw(charactersSmallImage, 300, 200)
end
