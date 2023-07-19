local deposit = TalkAction("!depositall")

local showDistroLog = true -- Set this variable to true or false based on your requirement

function deposit.onSay(player, words, param)
    -- Check if the player wants to deposit all coins
    if words ~= "!depositall" then
        player:sendCancelMessage("Invalid command. Please use '!depositall' to deposit all coins.")
        return false
    end

    -- Check if the player has any coins to deposit
    local goldCoins = player:getItemCount(3031) -- ID of gold coins item
    local platinumCoins = player:getItemCount(3035) -- ID of platinum coins item
    local crystalCoins = player:getItemCount(3043) -- ID of crystal coins item
    local totalCoins = goldCoins + platinumCoins + crystalCoins

    if totalCoins == 0 then
        player:sendCancelMessage("You don't have any coins to deposit.")
        return false
    end

    -- Calculate the amount of gold to deposit based on actual quantity
    local depositedGold = goldCoins + platinumCoins * 1000 + crystalCoins * 10000

    -- Remove all coins from the player's inventory
    player:removeItem(3031, goldCoins) -- Remove gold coins
    player:removeItem(3035, platinumCoins) -- Remove platinum coins
    player:removeItem(3043, crystalCoins) -- Remove crystal coins

    -- Check if there is any gold to deposit
    if depositedGold > 0 then
        -- Update the player's bank balance
        local currentMoney = player:getBankBalance()
        player:setBankBalance(currentMoney + depositedGold)

        -- Send success message to the player
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Successfully deposited " .. depositedGold .. " gold coins to your bank balance.")

        -- Show distro log if enabled
        if showDistroLog then
            Spdlog.info("Deposited " .. depositedGold .. " gold coins to the bank balance for player " .. player:getName())
        end

        return true
    else
        player:sendCancelMessage("You don't have any coins to deposit.")
        return false
    end
end

deposit:separator(" ")
deposit:register()
