os.execute("chcp 65001")

local player = require("definitions.player")            
local colossus = require("definitions.colossus")            

print([[
    =====================================================================
                    _
         _         | |
        | | _______| |---------------------------------------------\
        |:-)_______|==[]============================================>
        |_|        | |---------------------------------------------/
                   |_|
    
                    -----------------------------------------
    
                            ⚔ SIMULADOR DE BATALHA ⚔
    
    =====================================================================
    
                Você empunha sua espada e se prepara para lutar.
                                É hora da batalha!
    
    ]])


    print(string.format("A vida do jogador é %d/%d", player.health, player.maxHealth))

        local boss = colossus