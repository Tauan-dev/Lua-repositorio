largura_tela, altura_tela = love.graphics.getDimensions()

function love.load()
    Classe = require "classic"
    require "jogo"
    require "alvo"
    require "pato"
    require "ganso"
    require "telaInicial"
    require "gameOver"


    jogo = Jogo()
    telaInicial = TelaInicial()
    gameOver = GameOver()
    cenas = {

        jogo = jogo,
        telaInicial = telaInicial,
        gameOver = gameOver

    }
    cenaAtual= "telaInicial"
    telaInicial.musicaMenu:play()


    fonte20 = love.graphics.newFont("recursos/fontes/visitor1.ttf", 20)

end

function love.update(dt)
    cenas[cenaAtual]:update(dt)
    --jogo:update(dt)
end

function love.draw()
    cenas[cenaAtual]:draw()
   -- jogo:draw()
end


