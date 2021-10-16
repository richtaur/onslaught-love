function love.load()
    charactersSmallImage = love.graphics.newImage("images/sheet_characters_small.png")
end

function love.draw()
    love.graphics.print("Centered Text Hi", 320, 240)

    love.graphics.draw(charactersSmallImage, 300, 200)
end
