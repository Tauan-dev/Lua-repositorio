function love.load()
    Classe = require "classic"

    require "jogo"
    require "jogador"
    require "mapa"
    require "acima"
    require "esquerda"
    require "abaixo"
    require "planoDeFundo"

    jogo = Jogo()

end

function love.update(dt)
    jogo:update(dt)
end


function love.draw()
    jogo:draw()
end