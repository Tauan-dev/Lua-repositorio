function love.load()-- vai funcionar como o escopo principal do seu programa
    Classe = require "classic"
    require "cenas/jogo"
    require "classe/nave"
    require "classe/tiro"
    require "classe/inimigo"
    require "cenas/telaInicial"
    require "cenas/gameOver"
    require "classe/planoDeFundo"
  --  require "item"

    
    jogo = Jogo() -- Classes são chamadas com letras maiusculas assim como no Jogo(), e jogo iniciado com letra minuscula é um objeto que é uma instância da classe Jogo
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
    -- jogo.update(dt)
    cenas[cenaAtual]:update()
end

function love.draw() 
    -- jogo.draw()
    cenas[cenaAtual]:draw()
end