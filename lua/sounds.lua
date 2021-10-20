sounds = {}
sounds.sources = {}

sounds.load = function ()
	-- Arena music
	sounds.sources.arenaMusic = love.audio.newSource("music/normal_battle.mp3", "stream")
	sounds.sources.arenaMusic:setLooping(true)

	-- Sewers music
	-- sounds.sources.sewersMusic = love.audio.newSource("music/sewers.mp3", "stream")
	-- sounds.sources.sewersMusic:setLooping(true)

	-- Sounds
	sounds.sources.charAttacks = love.audio.newSource("sounds/char_attacks.mp3", "static")
	sounds.sources.monsterDamageSound = love.audio.newSource("sounds/monster_damage.mp3", "static")
	sounds.sources.weaponWall = love.audio.newSource("sounds/weapon_wall.mp3", "static")
	sounds.sources.wizardReappear = love.audio.newSource("sounds/wizard_reappear.mp3", "static")
end

sounds.play = function (key)
	love.audio.play(sounds.sources[key])
end
