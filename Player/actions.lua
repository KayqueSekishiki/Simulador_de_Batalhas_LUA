local utils = require "utils"

local actions = {}

actions.list = {}


function actions.build()
    actions.list = {}

    local swordAttack = {
        description = "Atacar com a espada",
        requirement = nil,
        execute = function(playerData, creatureData)
            local successChance = creatureData.speed == 0 and 1 or playerData.speed / creatureData.speed
            local success = math.random() <= successChance

            local rawDamage = playerData.attack - math.random() * creatureData.defense
            local damage = math.max(1, math.ceil(rawDamage))

            if success then
                creatureData.health = creatureData.health - damage
                print(string.format("Você atacou a criatura e causou %d pontos de dano", damage))
                local healthRate = math.floor((creatureData.health / creatureData.maxHealth) * 10)
                print(string.format("%s: %s", creatureData.name, utils.getProgressBar(healthRate)))

            else
                print(string.format("Você tentou atacar, mas esqueceu a espada na mochila"))
            end
        end
    }

local regenPotion = {
    description = "Tomar uma poção de regeneração de vida",
    requirement = function (playerData)
        return playerData.potions >= 1
    end,
    execute = function (playerData)
        playerData.potions = playerData.potions - 1

        local regenPoints = 5
        playerData.health = math.min(playerData.maxHealth, playerData.health + regenPoints)
        print("Você usou uma poção e recuperou alguns pontos de vida!")
    end
}

    actions.list[#actions.list+1] = swordAttack
    actions.list[#actions.list+1] = regenPotion
end

function actions.getValidActions(playerData, creatureData)
    local validActions = {}
    for _, action in pairs(actions.list) do
        local requirement = action.requirement
        local isValid = requirement == nil or requirement(playerData, creatureData)
        if isValid then
            validActions[#validActions+1] = action
        end
    end
    return validActions
end


return actions