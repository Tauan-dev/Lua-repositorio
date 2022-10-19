TelaInicial= Classe:extend()


function TelaInicial:new()
    self.imagem = love.graphics.newImage("recursos/imagens/menu_final.png")
    self.opcoes =   {"Jogar" , "Sair"}


    self.iconeSelecao = {}
    self.iconeSelecao.imagem = love.graphics.newImage("recursos/imagens/nave.png")
    self.iconeSelecao.x = love.graphics.getWidth()/2  - 10
    self.iconeSelecao.y = love.graphics.getHeight()/2 + 45
    
    self.escolha = 1
    self.tempoPularOpcao = 0
    self.crescenteTempo=0

    self.musicaMenu = love.audio.newSource("recursos/sons/menu_theme.mp3","stream")
    self.mudaOpcaoMenu = love.audio.newSource("recursos/sons/mudar_opcao_menu.ogg","static")
    self.escolherOpcao = love.audio.newSource("recursos/sons/alert_siren_cut.mp3","static")
    

end 


function TelaInicial:update()
    if self.crescenteTempo < 1 then
        self.crescenteTempo = 0.02
    end
    self.tempoPularOpcao = self.tempoPularOpcao + self.crescenteTempo
    if love.keyboard.isDown("up","down") and self.tempoPularOpcao > 0.5 then
        self.tempoPularOpcao = 0
        self.mudaOpcaoMenu:play()

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
            jogo.musicaJogo:play()
        elseif self.escolha == 2 then
            love.event.quit()
        end
    end        

end 


function TelaInicial:draw()
    love.graphics.draw(self.imagem)
    
    love.graphics.setColor(0 ,1, 1)
    love.graphics.setFont(fonte20)
    --love.graphics.setColor(0, 1 ,1)

    for i= 1, #self.opcoes do
        love.graphics.print(self.opcoes[i], love.graphics.getWidth()/2 , love.graphics.getHeight()/2 + 50*i )
    end
    love.graphics.setColor(1,1,1)
    love.graphics.draw(self.iconeSelecao.imagem,self.iconeSelecao.x ,self.iconeSelecao.y, 1.5,0.3)
    
end