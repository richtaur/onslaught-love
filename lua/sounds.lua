sounds = {}
sounds.sources = {}

sounds.load = function ()
	sounds.sources.monsterDamageSound = love.audio.newSource("sounds/monster_damage.mp3", "static")
end

sounds.play = function (key)
	love.audio.play(sounds.sources[key])
end
