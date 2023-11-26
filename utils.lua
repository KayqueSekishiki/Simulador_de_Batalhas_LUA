local utils = {}

function  utils.enableUtf8()
    os.execute("chcp 65001")
end

function utils.printHeader()
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
end

function utils.getProgressBar(attribute)
    local fullChar = "▰"
    local emptyChar = "▱"

    local result = ""
    for i = 1, 10, 1 do
        result = result ..(i <= attribute and fullChar or emptyChar)
    end

    return result
end


function utils.printCreature(creature)
    local healthRate = math.floor((creature.health / creature.maxHealth) * 10)

    print("| " .. creature.name)
    print("| ")
    print("| " .. creature.description)
    print("| ")
    print("| Atributos")
    print("|    Vida:         " .. utils.getProgressBar(healthRate))
    print("|    Ataque:       " .. utils.getProgressBar(creature.attack))
    print("|    Defesa:       " .. utils.getProgressBar(creature.defense))
    print("|    Velocidade:   " .. utils.getProgressBar(creature.speed))
end


return utils