function love.load()
    Classe = require "classic"
    require "jogador"
    require "jogo"
    require "fase_um"
    require "fase_dois"
    require "banana"
    require "planoDeFundo"
    require "maca"
    require "cereja"
    require "kiwi"
    require "espinho_um"
    require "espinho_dois"
    require "fogo"
    require "direita"
    require "acima"
    require "esquerda"
    require "laranja"
    require "serra"

    jogo = Jogo()
end

function love.update(dt)
    jogo:update(dt)
end

function love.draw()
    jogo:draw()
end