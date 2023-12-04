local utils = require("utils")
local player = require("Player.player")            
local colossus = require("Colossus.colossus")            

utils.enableUtf8()
utils.printHeader()


local boss = colossus
utils.printCreature(boss)


while true do




    
    if boss.health <= 0 then
        break
    end

    if player.health <= 0 then
        break
    end
end