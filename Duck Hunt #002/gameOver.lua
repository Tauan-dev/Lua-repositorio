GameOver= Classe:extend()

function GameOver:new()
    self.imagem = love.graphics.newImage("recursos/imagens/game_over.png")
   -- self.musicaGameOver = love.audio.newSource("recursos/sons/game_over_theme.mp3","stream")
    
end 

function GameOver:update()
    if love.keyboard.isDown("space") then 
        cenaAtual= "telaInicial"
       -- self.musicaGameOver:stop()
        telaInicial.musicaMenu:play()
    end

end 

function GameOver:draw()
    love.graphics.draw(self.imagem)
    love.graphics.setColor(0,0,0)
    love.graphics.print("Aperte espaço para voltar ao menu",220 , love.graphics.getHeight()/2)
    love.graphics.setColor(1,1,1)


end