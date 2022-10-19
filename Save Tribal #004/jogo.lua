Jogo = Classe:extend()

function Jogo:new()
    

    -- fases
    fase_um = Fase_um()
    fase_dois = Fase_dois()
    -- jogador
    jogador = Jogador()
    direita = Direita()
    acima = Acima()
    esquerda = Esquerda()
    -- frutas
    banana  = Banana()
    cereja = Cereja()
    maca = Maca()
    kiwi = Kiwi()
    laranja = Laranja()
    -- armadilhas
    espinho_um = Espinho_um()
    espinho_dois = Espinho_dois()
    fogo = Fogo()
    serra = Serra()
    
    

    ponto = 0

    fase = {

        fase_um = fase_um,
        fase_dois = fase_dois

    }
    faseAtual= "fase_um"
    faseum = true
    fasedois = false

    planoDeFundo1 = PlanoDeFundo(0,0)
    planoDeFundo2 = PlanoDeFundo(0,-608)

    vida = love.graphics.newImage("recursos/imagem/vida.png")

    self.musicaJogo = love.audio.newSource("recursos/musica_tema.mp3" ,"stream")
    self.musicaJogo:setLooping(true)
    self.dor = love.audio.newSource("recursos/dor.wav" ,"static")
    self.coletado = love.audio.newSource("recursos/item.wav" ,"static")

    

end

function Jogo:update(dt)

    self.musicaJogo:play()
 --update jogador
    jogador:update(dt)
    direita:update(dt)
    acima:update(dt)
    esquerda:update(dt)
 --update fruta
    banana:update(dt)
    kiwi:update(dt)
    maca:update(dt)
    cereja:update(dt)
    laranja:update(dt)
 --update armadilha
    espinho_um:update(dt)
    espinho_dois:update(dt)
    serra:update(dt)
    fogo:update(dt)


   -- mudança de fase
    fase[faseAtual]:update(dt)
   -- animação do pesonagem
    if love.keyboard.isDown("right") then
        jogadorcorre()
        animaacima = false
    end

    if love.keyboard.isDown("up") then
        jogadorpula()
    end

    if love.keyboard.isDown("left") then
        jogadoresquerda()
    end
    -- colisões com as frutas
    if jogador:verificaColisao(banana) then 
        banana.x = love.graphics.getWidth() + banana.largura
        self.coletado:play()
        if banana.x > love.graphics.getWidth() then
            ponto = ponto + 1 
        end
        
    end

    if jogador:verificaColisao(maca) then 
        maca.x = love.graphics.getWidth() + maca.largura
        self.coletado:play()
        if maca.x > love.graphics.getWidth() then
            ponto = ponto + 1 
        end
        
    end

    if jogador:verificaColisao(cereja) then 
        cereja.x = love.graphics.getWidth() + cereja.largura
        self.coletado:play()
        if cereja.x > love.graphics.getWidth() then
            ponto = ponto +1 
        end
    end    
    
        
    if jogador:verificaColisao(kiwi) then 
        kiwi.x = love.graphics.getWidth() + kiwi.largura
        self.coletado:play()
        if kiwi.x > love.graphics.getWidth() then
            ponto = ponto +1 
        end   
    end


    if jogador:verificaColisao(laranja) then 
        self.coletado:play()
        laranja.x = love.graphics.getWidth() + laranja.largura
        if laranja.x > love.graphics.getWidth() then
            ponto = ponto +1 
        end   
    end


    -- colisão das armadilhas 
    if jogador:verificaColisao(espinho_um) then 
       jogador:perderVida() 
       self.dor:play()
       jogador.y = jogador.y - 400 * 0.2
    end

    if jogador:verificaColisao(espinho_dois) then 
        jogador:perderVida() 
        self.dor:play()
        jogador.y = jogador.y - 480 * 0.2
    end

    if jogador:verificaColisao(fogo) then 
        jogador:perderVida() 
        self.dor:play()
        jogador.y = jogador.y - 480 * 0.2
    end

    if jogador:verificaColisao(serra) then 
        jogador:perderVida() 
        self.dor:play()
        jogador.y = jogador.y - 480 * 0.2
    end

    
        

    if ponto == 4 then 
        faseAtual = "fase_dois"
        faseum = false
        fasedois = true
        banana.x = 400
        banana.y = 540
        maca.x   = 300
        maca.y   = 120 
        cereja.x = 530
        cereja.y = 380
        kiwi.x   = 190
        kiwi.y   = 200
        laranja.x = 600
        laranja.y = 128
        espinho_um.x = 290
        espinho_um.y = 126
        espinho_dois.x = 120
        espinho_dois.y = 254
        fogo.x = 585
        fogo.y = 383

    end

    if jogador.vida == 0 then
        self.musicaJogo:stop()
      --self.dor:stop()
        jogo:new()
    end

    planoDeFundo1:update()
    planoDeFundo2:update()
    
end

function Jogo:draw()
    planoDeFundo1:draw()
    planoDeFundo2:draw()

    for i=1 ,jogador.vida do
        love.graphics.draw(vida,30*i,25 , 0 ,1,1)
    end

    --love.graphics.print("Pontos: "..ponto,50,100)
    --love.graphics.setColor(0,0,0)
    --love.graphics.print("Vidas: "..jogador.vida,50,50)
    --love.graphics.setColor(1,1,1)

    if faseum == true then
        fase_um:draw()
        espinho_um:draw()
        espinho_dois:draw()
        fogo:draw()
        serra:draw()
    end

    if fasedois == true then
        fase_dois:draw()
        espinho_um:draw()
        espinho_dois:draw()
        fogo:draw()
        laranja:draw()
        serra:draw()
    end
    if animajogador == true then
        jogador:draw()
    end

    if animadireita == true then
        direita:draw()
    end

    if animaacima == true then
        acima:draw()
    end

    if animaesquerda == true then
        esquerda:draw()
    end

    banana:draw()
    kiwi:draw()
    maca:draw()
    cereja:draw()
    
end
