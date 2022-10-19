Jogo = Classe:extend()



function Jogo:new()
    alvo = Alvo(400, 300)

    tabelaPatos = {}
    tempoPatos = 1
    patosPerdidos = 0

    tabelaGansos = {}
    tempoGansos = 1
    gansosPerdidos = 0


    pontos = 0

    imgCenario = love.graphics.newImage("recursos/imagens/duck_background.png")
    vida = love.graphics.newImage("recursos/imagens/hearth_teste.png")
    point = love.audio.newSource("recursos/sons/point.wav","static")

    playerVida = 4
    dano = love.audio.newSource("recursos/sons/hit.wav","static")
    game_over = love.audio.newSource("recursos/sons/game_over.mp3","static")
    
end

function Jogo:update(dt)
    
    alvo:update(dt)

    tempoPatos = tempoPatos - dt
    if tempoPatos < 0 then
        local pato = Pato(200)
        table.insert(tabelaPatos, pato)
        tempoPatos = 1
        pato.quack:play()
    end

    tempoGansos = tempoGansos - dt
    if tempoGansos < 0 then
        local ganso = Ganso(200)
        table.insert(tabelaGansos, ganso)
        tempoGansos = 1
       -- ganso.quack:play()

    end

    for i, pato in pairs(tabelaPatos) do
        pato:update(dt)

        if pato:saiuDaTela() then
            table.remove(tabelaPatos, i)
            patosPerdidos = patosPerdidos + 1
        end

        if alvo:atirou() then
            if alvo:verificaColisao(pato) then
                alvo.tiro:play()
                table.remove(tabelaPatos, i)
                
                pontos = pontos + 1
                point:play()
            end
        end
    end

    for i, ganso in pairs(tabelaGansos) do
        ganso:update(dt)

        if ganso:saiuDaTela() then
            table.remove(tabelaGansos, i)
            gansosPerdidos = gansosPerdidos + 1
        end

        if alvo:atirou() then
            if alvo:verificaColisao(ganso) then
                alvo.tiro:play()
                table.remove(tabelaGansos, i)

                pontos = pontos + 1
            end
        end
    end

     
    local totalPerdidos = gansosPerdidos + patosPerdidos
    if totalPerdidos >28 then
        self:new()
    end
    
    
    if totalPerdidos == 7 then
        dano:play()
        playerVida = 3
        
        if love.mouse.isDown(1) then 
           dano:stop()
        end
    end
        

    if totalPerdidos == 14 then
        playerVida = 2
        dano:play()
        if love.mouse.isDown(1) then 
            dano:stop()
        end
    end

    if totalPerdidos == 21 then
        playerVida = 1
        dano:play()
        if love.mouse.isDown(1) then 
            dano:stop()
        end
    end

    

    if totalPerdidos == 28 then
        playerVida = 0
        game_over:play()
        cenaAtual= "gameOver"
    end

   -- if totalPerdidos == 25 then
    --    playerVida = 0
        
    --end
end

function Jogo:draw()
    love.graphics.draw(imgCenario)

    for i=1 ,playerVida do
        love.graphics.draw(vida,30*i,25 , 0 ,0.3,0.3)
    end
    
    

    for i, pato in pairs(tabelaPatos) do
        pato:draw()
    end

    for i, ganso in pairs(tabelaGansos) do
        ganso:draw()
    end
    
    alvo:draw()
    love.graphics.setColor(0,0,0)
    love.graphics.print("Score:"..pontos, 30, 60, 0, 1.5, 1.5)
    love.graphics.setColor(1,1,1)
   -- love.graphics.print("patosperdidos:"..patosPerdidos,50,200)
   -- love.graphics.print("gansosperdidos:"..gansosPerdidos,50,300)
end



