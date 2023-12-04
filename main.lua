local utils = require("utils")
local player = require("Player.player")  
local playerActions = require("Player.actions")          
local colossus = require("Colossus.colossus")            
local colossusActions = require("Colossus.actions")          


utils.enableUtf8()
utils.printHeader()


local boss = colossus
local bossActions = colossusActions

utils.printCreature(boss)

playerActions.build()
bossActions.build()

while true do
    print()
    print(string.format("Qual será a proxima ação de %s?", player.name))
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
    print(string.format("Sua escolha é inválida. %s perdeu a vez.", player.name))
end

    if boss.health <= 0 then
        break
    end

    print()
    local validBossActions = bossActions.getValidActions(player, boss) 
    local bossAction = validBossActions[math.random(#validBossActions)]
    bossAction.execute(player, boss)


    if player.health <= 0 then
        break
    end
end

if player.health <= 0 then
    print()
    print("------------------------------------------------------------------")
    print()
    print("😭")
    print(string.format("%s não foi capaz de derrotar %s", player.name, boss.name))
    print("Quem sabe outro dia...")

 elseif boss.health <= 0 then
    print()
    print("------------------------------------------------------------------")
    print()
    print("🥳")
    print(string.format("O reino está a salvo do %s, graças a %s!", boss.name, player.name))
    print("Parabéns!!!") 
end