Jogo = Classe:extend()
tempoCriacao = 6
velocidadeNave = 0
function Jogo:new()
    nave = Nave()
    
 --   item = Item()
    
    tempoInimigo=0
    listaDeInimigos = {}
   -- listaDeItens = {}
    self.musicaJogo = love.audio.newSource("recursos/sons/jogo_theme.mp3" ,"stream")
    self.musicaJogo:setLooping(true)
    

    self.tiroNoInimigo = love.audio.newSource("recursos/sons/inimigo_roar.mp3","static")

    planoDeFundo1 = PlanoDeFundo(0,0)
    planoDeFundo2 = PlanoDeFundo(0,-600)

end

function Jogo:update(dt)
       tempoInimigo = tempoInimigo + love.math.random(0,tempoCriacao)

    if tempoInimigo > 200 then
        local inimigo = Inimigo(love.math.random(0, 690),-100,3+velocidadeNave)
        table.insert(listaDeInimigos, inimigo)
        tempoInimigo = 0
        --inimigo.musicaInimigo:play()
       -- inimigo.musicaInimigo:stop()
    end


    
    

    
    if nave.pontos > 35 and nave.pontos < 160 then
      tempoCriacao = tempoCriacao + 0.002
    end 
    
   --[[] if nave.pontos == 5 then 
       nave.vidas = nave.vidas+ 1 -- fiz para aumentar a quantidade de vidas do jogo, porem adiciona muito, e eu só queria que fosse 1
    end]]

    if nave.pontos > 180 then
        velocidadeNave = velocidadeNave + 0.001
    end    
  
    nave:update()
    planoDeFundo1:update()
    planoDeFundo2:update()


    for i, inimigo in pairs(listaDeInimigos) do
        inimigo:update()
        
        if verificaColisao(inimigo,nave) then
            table.remove(listaDeInimigos,i)
            nave:perderVida()


            local explosao = love.audio.newSource("recursos/sons/explosion.mp3" ,"static")
            explosao:play()


            if nave.vidas == 0 then
                cenaAtual= "gameOver"
                self.musicaJogo:stop()
                self.tiroNoInimigo:stop()
                explosao:stop()
                gameOver.musicaGameOver:play()

            end 

        end
         

        if  inimigo:saiuDaTela() then
            table.remove(listaDeInimigos ,i)
          end
        
        for j , tiro in pairs(nave.listaDeTiros, j) do  -- observações : as vezes  1 tiro remove 2 inimigos em x posições diferentes
            if  verificaColisao(inimigo , tiro) then 
                
                self.tiroNoInimigo:play()
            --  local tipo  = love.math.random(1,2)   
            -- local item  = Item(tipo, inimigo.x, inimigo.y)
            --  table.insert(listaDeItens,item)

              table.remove(listaDeInimigos,i)
              table.remove(nave.listaDeTiros,j)
             

              nave:incrementarPontos(inimigo.pontosInimigo)  -- usa como parâmetro pontosInimigo do modulo inimigo.lua, acessando atraves do . ,  busca modificar a pontução atual atraves do valor atribuido ao inimigo
            end
        end

        
    end

   --[[ for i, itens in pairs (listaDeItens) do
        item:update()

        if item.saiuDaTela() then
           table.remove(listaDeItens,i)
        end   
        
    end]]

end 

function Jogo:draw()
    planoDeFundo1:draw()
    planoDeFundo2:draw()
    nave:draw()

    for i, inimigo in pairs(listaDeInimigos) do
       inimigo:draw()
    end

    love.graphics.print("Pontos:"..nave.pontos, 20 ,50,0 ,1.3)

    for i= 1,nave.vidas do
        love.graphics.draw(nave.imagem , 30*i,25,0,0.3) -- desenha na tela a vida da nave 
    end   
    
  --[[ for i, itens in pairs (listaDeItens) do
        item:draw()
    end]]
end

function verificaColisao (A , B)
    if A.x < B.x + B.largura and
       A.x + A.largura > B.x and
       A.y < B.y + B.largura and
       A.y + A.largura > B.y then
        return true
    end
end