function love.load()
    charactersSmallImage = love.graphics.newImage("images/sheet_characters_small.png")

    -- Sound effect?
    -- sound = love.audio.newSource("sounds/monster_damage", "stream")

    -- Music
    winMusic = love.audio.newSource("music/win.mp3", "stream")
    love.audio.play(winMusic)
end

function love.draw()
    love.graphics.print("Centered Text Hi", 320, 240)

    love.graphics.draw(charactersSmallImage, 300, 200)
end
