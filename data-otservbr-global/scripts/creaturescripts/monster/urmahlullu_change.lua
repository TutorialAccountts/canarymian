local timetochange = 60 --in seconds
local time = os.time()

local bodyToRemove = {
	{itemId = 31413},
	{itemId = 2886},
}

local healthMultiplier = configManager.getFloat(configKeys.RATE_BOSS_HEALTH)

local healthStages = {
	515000 * healthMultiplier,
	400000 * healthMultiplier,
	300000 * healthMultiplier,
	200000 * healthMultiplier,
	100000 * healthMultiplier,
}

--base urmahlullu have 515000/515000 hp, next form 400000/515000,
-- next form 300000/515000, next form 200000/515000, and last 100000/515000

local urmahlulluChanges = CreatureEvent("UrmahlulluChanges")

function urmahlulluChanges.onHealthChange(creature, attacker, primaryDamage, primaryType,
                                          secondaryDamage, secondaryType)
	if creature and creature:getName() == 'Urmahlullu the Immaculate' then
		if creature:getHealth() <= healthStages[2] then
			position = creature:getPosition()
			creature:remove()
			Game.createMonster('Wildness of Urmahlullu', position, true, true)
			time = os.time()
			-- make change and start counter (~ 1 minute)
		end
	end
	if creature and creature:getName() == 'Wildness of Urmahlullu' then
		if creature:getHealth() <= healthStages[3] then
			if os.time() <= time + timetochange  then
				position = creature:getPosition()
				creature:remove()
				Game.createMonster('Urmahlullu the Tamed', position, true, true)
				time = os.time()
				-- make change to urmahlullu the tamed and start new count (~1 minute)
			else
				position = creature:getPosition()
				creature:remove()
				Game.createMonster('Urmahlullu the Immaculate', position, true, true)
				-- back to wildness of urmahlullu
			end
		end
	end
	if creature and creature:getName() == 'Urmahlullu the Tamed' then
		if creature:getHealth() <= healthStages[4] then
			if os.time() <= time + timetochange then
				position = creature:getPosition()
				creature:remove()
				Game.createMonster('Wisdom of Urmahlullu', position, true, true)
				time = os.time()
				-- make change to wisdom of urmahlullu and start new count (~1 minute)
			else
				position = creature:getPosition()
				creature:remove()
				Game.createMonster('Wildness of Urmahlullu', position, true, true)
				time = os.time()
				-- back to wildness of urmahlullu
			end
		end
	end
	if creature and creature:getName() == 'Wisdom of Urmahlullu' then
		if creature:getHealth() <= healthStages[5] then
			if os.time() <= time + timetochange then
				position = creature:getPosition()
				creature:remove()
				Game.createMonster('Urmahlullu the Weakened', position, true, true)
				time = os.time()
				-- make change to urmahlullu the weakened and start new count (~1 minute)
			else
				position = creature:getPosition()
				creature:remove()
				Game.createMonster('Urmahlullu the Tamed', position, true, true)
				time = os.time()
				--back to urmahlullu the tamed
			end
		end
	end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

urmahlulluChanges:register()

local weakenedDeath = CreatureEvent("WeakenedDeath")

function weakenedDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	if creature and creature:getName() == 'Urmahlullu the Weakened' then
		if os.time() > time + timetochange then
			local position = creature:getPosition()
			for _, tab in ipairs(bodyToRemove) do
				local item = Tile(position):getItemById(tab.itemId)
				if item then
					item:remove()
				end
			end
			Game.createMonster('Wisdom of Urmahlullu', position, true, true)
			time = os.time()
		end
	end
	return true
end

weakenedDeath:register()
