require("chaseBehavior")

actorData = {}

actorData.player = {}
actorData.player.behavior = nil
actorData.player.frameMin = 8
actorData.player.frameMax = 9
actorData.player.speed = 4

actorData.goblin = {}
actorData.goblin.behavior = chaseBehavior;
actorData.goblin.behaviorConfig = {};
actorData.goblin.behaviorConfig.proximityMin = 3 * TILE_SIZE
actorData.goblin.behaviorConfig.proximityMax = 5 * TILE_SIZE
actorData.goblin.frameMin = 118
actorData.goblin.frameMax = 119
actorData.goblin.speed = 2

actorData.sword = {}
-- actorData.sword.behavior = chaseBehavior;
-- actorData.sword.behaviorConfig = {};
-- actorData.sword.behaviorConfig.proximityMin = 3 * TILE_SIZE
-- actorData.sword.behaviorConfig.proximityMax = 5 * TILE_SIZE
actorData.sword.frameMin = 22
actorData.sword.frameMax = 22
actorData.sword.speed = 12
