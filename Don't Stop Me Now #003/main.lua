function love.load()
    Classe = require "classic" 
    require "direita"
    require "jogo"
    require "morcego"
    require "cogumelo"
    require "heroi"
    require "abaixo"
    require "acima"
    require "moeda"
    require "bonus"
    require "planoDeFundo"
    
    jogo = Jogo()

end


function love.update(dt)
    jogo:update(dt)
end



function love.draw()
    jogo:draw()
end
