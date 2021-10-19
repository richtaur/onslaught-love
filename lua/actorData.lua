require("lua/behaviors/chaseBehavior")
require("lua/behaviors/playerBehavior")
require("lua/behaviors/spawnerBehavior")

actorData = {}

-- Player
actorData.player = {}
actorData.player.behavior = playerBehavior
actorData.player.behaviorConfig = {}
actorData.player.behaviorConfig.cooldownDuration = 0.25
actorData.player.behaviorConfig.cooldownElapsed = actorData.player.behaviorConfig.cooldownDuration
actorData.player.collides = true
actorData.player.frameMin = 8
actorData.player.frameMax = 9
actorData.player.damage = 0
actorData.player.damageFromTilemap = 0
actorData.player.imageKey = "charactersSmall"
actorData.player.life = 1
actorData.player.speed = 4
actorData.player.speedMax = 8

-- Goblin
actorData.goblin = {}
actorData.goblin.behavior = chaseBehavior
actorData.goblin.behaviorConfig = {}
actorData.goblin.behaviorConfig.proximityMin = 3 * TILE_SIZE
actorData.goblin.behaviorConfig.proximityMax = 5 * TILE_SIZE
actorData.goblin.collides = true
actorData.goblin.frameMin = 118
actorData.goblin.frameMax = 119
actorData.goblin.damage = 1
actorData.goblin.damageFromTilemap = 0
actorData.goblin.damageSound = "monsterDamageSound"
actorData.goblin.imageKey = "charactersSmall"
actorData.goblin.life = 1
actorData.goblin.speed = 2
actorData.goblin.speedMax = 2

-- Sword
actorData.sword = {}
actorData.sword.collides = true
actorData.sword.frameMin = 2
actorData.sword.frameMax = 2
actorData.sword.damage = 1
actorData.sword.damageFromTilemap = 1
actorData.sword.damageSound = "weaponWall"
actorData.sword.imageKey = "objects"
actorData.sword.life = 1
actorData.sword.rotateWithTrajectory = true
actorData.sword.speed = 12
actorData.sword.speedMax = 12

-- Gate
actorData.gate = {}
actorData.gate.collides = false
actorData.gate.imageKey = "gates"
actorData.gate.frameMin = 4
actorData.gate.frameMax = 4
actorData.gate.life = 1
actorData.gate.speed = 0
actorData.gate.speedMax = 0

-- Spawner
actorData.spawner = {}
actorData.spawner.behavior = spawnerBehavior
actorData.spawner.behaviorConfig = {}
actorData.spawner.behaviorConfig.cooldownDuration = 3
actorData.spawner.behaviorConfig.cooldownElapsed = actorData.player.behaviorConfig.cooldownDuration
actorData.spawner.behaviorConfig.spawnActor = actorData.goblin
actorData.spawner.collides = false
actorData.spawner.frameMin = 0
actorData.spawner.frameMax = 0
actorData.spawner.life = 1
actorData.spawner.speed = 0
actorData.spawner.speedMax = 0
