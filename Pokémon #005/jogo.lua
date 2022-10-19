Jogo  = Classe:extend()

function Jogo:new ()
    jogador  = Jogador()
    esquerda = Esquerda()
    mapa = Mapa()
    acima = Acima()
    esquerda = Esquerda()
    abaixo   = Abaixo()
    planoDeFundo = PlanoDeFundo()

    self.musicaJogo = love.audio.newSource("recursos/som/fundosonoro.mp3" ,"stream")
    self.musicaJogo:setLooping(true)
end


function Jogo:update(dt)

    self.musicaJogo:play()
    
    jogador:update(dt)
    acima:update(dt)
    esquerda:update(dt)
    abaixo:update(dt)
    mapa:update(dt)
    planoDeFundo:update(dt)



    if love.keyboard.isDown("right") then
        jogadorcorre()
        animaacima = false
    end

    if love.keyboard.isDown("up") then
        jogadoracima()
        animaacima = true
    end

    if love.keyboard.isDown("left") then
        jogadoresquerda()
    end
    if love.keyboard.isDown("down") then
        jogadorabaixa()
        --animaabaixo
    end
end 

function Jogo:draw()
    
    planoDeFundo:draw()
    --mapa:draw()
    
    if animaabaixa == true then
        abaixo:draw()
    end

    if animajogador == true then
        jogador:draw()
    end

    if animaacima == true then
        acima:draw()
    end

    if animaesquerda == true then
        esquerda:draw()
    end
end 