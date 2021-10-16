require("lua/chaseBehavior")
require("lua/playerBehavior")

actorData = {}

-- Player
actorData.player = {}
actorData.player.behavior = playerBehavior;
actorData.player.behaviorConfig = {};
actorData.player.behaviorConfig.cooldownDuration = 0.5;
actorData.player.behaviorConfig.cooldownElapsed = actorData.player.behaviorConfig.cooldownDuration;
actorData.player.frameMin = 8
actorData.player.frameMax = 9
actorData.player.damage = 0
actorData.player.damageFromTilemap = 0
actorData.player.life = 1
actorData.player.speed = 4
actorData.player.speedMax = 8

-- Goblin
actorData.goblin = {}
actorData.goblin.behavior = chaseBehavior;
actorData.goblin.behaviorConfig = {};
actorData.goblin.behaviorConfig.proximityMin = 3 * TILE_SIZE
actorData.goblin.behaviorConfig.proximityMax = 5 * TILE_SIZE
actorData.goblin.frameMin = 118
actorData.goblin.frameMax = 119
actorData.goblin.damage = 1
actorData.goblin.damageFromTilemap = 0
actorData.goblin.life = 1
actorData.goblin.speed = 2
actorData.goblin.speedMax = 2

-- Sword
actorData.sword = {}
actorData.sword.frameMin = 22
actorData.sword.frameMax = 22
actorData.sword.damage = 1
actorData.sword.damageFromTilemap = 1
actorData.sword.life = 1
actorData.sword.speed = 12
actorData.sword.speedMax = 12
