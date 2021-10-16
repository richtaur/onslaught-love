require("chaseBehavior")

actorData = {}

actorData.player = {}
actorData.player.behavior = nil
actorData.player.frameMin = 8
actorData.player.frameMax = 9
actorData.player.damage = 0
actorData.player.life = 1
actorData.player.speed = 4

actorData.goblin = {}
actorData.goblin.behavior = chaseBehavior;
actorData.goblin.behaviorConfig = {};
actorData.goblin.behaviorConfig.proximityMin = 3 * TILE_SIZE
actorData.goblin.behaviorConfig.proximityMax = 5 * TILE_SIZE
actorData.goblin.frameMin = 118
actorData.goblin.frameMax = 119
actorData.goblin.damage = 1
actorData.goblin.life = 1
actorData.goblin.speed = 2

actorData.sword = {}
actorData.sword.frameMin = 22
actorData.sword.frameMax = 22
actorData.sword.damage = 1
actorData.sword.life = 1
actorData.sword.speed = 12
