local utils = require("utils")
local player = require("Player.player")  
local playerActions = require("Player.actions")          
local colossus = require("Colossus.colossus")            

utils.enableUtf8()
utils.printHeader()


local boss = colossus
utils.printCreature(boss)

playerActions.build()

while true do
    print()
    print("O que você deseja fazer em seguida?")
    local validPlayerActions = playerActions.getValidActions(player, boss)

    for i, action in pairs(validPlayerActions) do
    print(string.format("%d. %s", i, action.description))
end

local chosenIndex = utils.ask()
local chosenAction = validPlayerActions[chosenIndex]
local isActionValid = chosenAction ~= nil

if isActionValid then
    chosenAction.execute(player, boss)
else 
    print("Sua ação é inválida. Você perdeu a vez.")
end


    
    if boss.health <= 0 then
        break
    end

    if player.health <= 0 then
        break
    end
end