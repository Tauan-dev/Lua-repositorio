TelaInicial= Classe:extend()


function TelaInicial:new()
    self.imagem = love.graphics.newImage("recursos/imagens/menu_background.png")
    self.opcoes =   {"Start" , "Quit"}


    self.iconeSelecao = {}
    self.iconeSelecao.imagem = love.graphics.newImage("recursos/imagens/tiro.png")
    self.iconeSelecao.x = love.graphics.getWidth()/2  - 10
    self.iconeSelecao.y = love.graphics.getHeight()/2 + 45
    
    self.escolha = 1
    self.tempoPularOpcao = 0
    self.crescenteTempo=0

    self.musicaMenu = love.audio.newSource("recursos/sons/start_game.mp3","stream")
   -- self.mudaOpcaoMenu = love.audio.newSource("recursos/sons/mudar_opcao_menu.ogg","static")
    self.escolherOpcao = love.audio.newSource("recursos/sons/start_round.mp3","static")
    

end 


function TelaInicial:update()
    if self.crescenteTempo < 1 then
        self.crescenteTempo = 0.02
    end
    self.tempoPularOpcao = self.tempoPularOpcao + self.crescenteTempo
    if love.keyboard.isDown("up","down") and self.tempoPularOpcao > 0.5 then
        self.tempoPularOpcao = 0
        --self.mudaOpcaoMenu:play()

        if self.iconeSelecao.y == love.graphics.getHeight()/2 + 45 then
           self.iconeSelecao.y = love.graphics.getHeight()/2 + 100
           self.escolha = 2 -- Sair
        
        elseif self.iconeSelecao.y == love.graphics.getHeight()/2 + 100 then
            self.iconeSelecao.y = love.graphics.getHeight()/2 + 45
            self.escolha = 1 -- Jogar
        end
    end

    if  love.keyboard.isDown("space") and self.tempoPularOpcao > 0.5 then 
        self.tempoPularOpcao = 0
        if self.escolha == 1 then
            cenaAtual= "jogo"
            jogo:new()
           self.musicaMenu:stop()
           self.escolherOpcao:play()
          --  jogo.musicaJogo:play()
        elseif self.escolha == 2 then
            love.event.quit()
        end
    end        

end 


function TelaInicial:draw()
    love.graphics.draw(self.imagem)
    
    love.graphics.setColor(0 ,0, 0)
    love.graphics.setFont(fonte20)
   
    for i= 1, #self.opcoes do
        love.graphics.print(self.opcoes[i], love.graphics.getWidth()/2 , love.graphics.getHeight()/2 + 50*i )
    end
    love.graphics.setColor(1,1,1)
    love.graphics.draw(self.iconeSelecao.imagem,self.iconeSelecao.x -50,self.iconeSelecao.y - 10, 0,0.5,0.5)
    
end