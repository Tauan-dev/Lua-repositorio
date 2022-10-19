Jogo = Classe:extend()

function Jogo:new()
    direita = Direita()
    heroi = Heroi()
    abaixo = Abaixo()
    acima = Acima()
    moeda = Moeda()
    
    heroiVida = 3

    tabelaMorcego = {}
    tabelaCogumelo = {}
    tabelaBonus = {}
    
    tempoMorcego = 2
    tempoCogumelo = 2
    tempoBonus = 5
    a = 0
    ponto = 0 

    
    planoDeFundo1 = PlanoDeFundo(0,0)
    planoDeFundo2 = PlanoDeFundo(-800,0)

    vida = love.graphics.newImage("Recursos/Imagens/hearth_teste.png")
    self.musicaJogo = love.audio.newSource("Recursos/Sons/musicatema.wav" ,"stream")
    self.musicaJogo:setLooping(true)

    
end

function Jogo:update(dt)

    self.musicaJogo:play()

    heroi:update(dt)
    direita:update(dt)
    acima:update(dt)
    abaixo:update(dt)
    moeda:update(dt)
    planoDeFundo1:update(dt)
    planoDeFundo2:update(dt)
   
    --tempoMorcego = tempoMorcego + love.math.random(0,tempoCriacao)

    tempoMorcego = tempoMorcego - 0.02
    if tempoMorcego < 0 then
        morcego = Morcego()
        table.insert(tabelaMorcego,morcego)
        tempoMorcego = 2
    end

    for i,morcego in pairs(tabelaMorcego) do 
        morcego:update(dt)
         
        if morcego.x < 0 - morcego.largura then
            a = a + 1
            table.remove(tabelaMorcego,i) 
        end

        if heroi:verificaColisao(morcego) then 
            heroi.x = heroi.x - 50
            morcego.x = love.graphics.getWidth() + morcego.largura

            if morcego.x > love.graphics.getWidth() then
                ponto = ponto +1 
               table.remove(tabelaMorcego,i)
            end
            
        end
        
    end


    tempoBonus = tempoBonus - 0.002
    if tempoBonus < 0 then
        bonus = Bonus()
        table.insert(tabelaBonus,bonus)
        tempoBonus= 5
    end

    for i,bonus in pairs(tabelaBonus) do 
        bonus:update(dt)
         
        bonus.x = 400

        if heroi:verificaColisao(bonus) then 
            bonus.x = love.graphics.getWidth() + bonus.largura

            if bonus.x > love.graphics.getWidth() then
                ponto = ponto + 10 
               table.remove(tabelaBonus,i)
            end
            
        end
  
    end

    
    if   a == 3 then
        heroiVida = 2
    end 

    if a == 6 then
        heroiVida = 1 
    end

    if a == 9 then
        heroiVida = 0
        self.musicaJogo:stop()
        self:new()
       
    end
    

end

function Jogo:draw()


    planoDeFundo1:draw()
    planoDeFundo2:draw()

    for i=1 ,heroiVida do
        love.graphics.draw(vida,30*i,25 , 0 ,0.3,0.3)
    end
    

    for i, morcego in pairs(tabelaMorcego) do
        morcego:draw()
    end
    
    for i,bonus in pairs (tabelaBonus) do
        bonus:draw()
    end
  
    love.graphics.print("Pontos: "..ponto,50,100)
    
   --[[ for i,cogumlo in pairs(tabelaCogumelo) do
       cogumelo:draw()
    end]]
    
    moeda:draw()
    
    if animaheroi == true then
        heroi:draw()
    end

    if animaacima == true then
        acima:draw()
    end 

    if animadireita == true then
        direita:draw()
    end 

    if animaabaixo ==  true then
        abaixo:draw()
    end
    
   
end






