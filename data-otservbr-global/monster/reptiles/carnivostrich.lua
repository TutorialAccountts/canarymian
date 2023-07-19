local mType = Game.createMonsterType("Carnivostrich")
local monster = {}

monster.description = "a carnivostrich"
monster.experience = 61000
monster.outfit = {
	lookType = 1605,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2341
monster.Bestiary = {
	class = "Bird",
	race = BESTY_RACE_BIRD,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Ingol"
	}

monster.health = 77500
monster.maxHealth = 77500
monster.race = "blood"
monster.corpse = 42226
monster.speed = 168
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 3,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Yooohhouuu!", yell = false},
	{text = "GRROARR", yell = false},
	{text = "Grrrrrrrr!", yell = false},
	{text = "Yoooohhuuuu!!", yell = false},
}

monster.loot = {
	{name = "platinum coin", chance = 80450, maxCount = 22},
	{name = "small ruby", chance = 16390, maxCount = 8},
	{id = 3043, chance = 100000, maxCount = 3}, -- crystal coin
	{id = 34109, chance = 10}, -- bag you desire
	{id = 39546, chance = 10}, -- primal bag
	{name = "small emerald", chance = 8330, maxCount = 8},
	{name = "strong mana potion", chance = 4910, maxCount = 4},
	{name = "carnivostrich feather", chance = 3470, maxCount = 4},
	{name = "underworld rod", chance = 2420},
	{name = "wand of voodoo", chance = 2110},
	{name = "blue gem", chance = 2090},
	{name = "spellbook of mind control", chance = 810},
	{name = "boots of haste", chance = 620},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 1800, maxDamage = -3500, condition = {type = CONDITION_POISON, totalDamage = 480, interval = 4000}},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -1886, maxDamage = -3480, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -1700, maxDamage = -3135, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = true},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -1750, maxDamage = -3495, length = 7, spread = 0, effect = CONST_ME_BLACKSMOKE, target = false},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -1780, maxDamage = -3320, length = 7, spread = 0, effect = CONST_ME_ENERGYHIT, target = false},
}

monster.defenses = {
	defense = 50,
	armor = 63,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
