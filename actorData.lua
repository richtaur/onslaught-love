require("chaseBehavior")

actorData = {}

actorData.player = {}
actorData.player.behavior = nil
actorData.player.frameMin = 8
actorData.player.frameMax = 9

actorData.goblin = {}
actorData.goblin.behavior = chaseBehavior;
actorData.goblin.behaviorConfig = {};
-- actorData.goblin.behaviorConfig.proximityMin = 1 * TILE_SIZE
actorData.goblin.behaviorConfig.proximityMax = 3 * TILE_SIZE
actorData.goblin.frameMin = 118
actorData.goblin.frameMax = 119
