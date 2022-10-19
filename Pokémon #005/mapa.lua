Mapa  = Classe:extend()

function Mapa:new()
    self.mapa = {
        {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2},
        {2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2},
        {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
        {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2}
        }
end


function Mapa:update(dt)

    jogador.dest_x = jogador.x
    jogador.dest_y = jogador.y

    if love.keyboard.isDown("right") then
        --dirX ,dirY = 4,0
        jogador.dest_x = jogador.dest_x + vel_x*dt
  
        --verifica direita
        if self.mapa[math.floor(jogador.dest_y/32)+4][math.floor((jogador.dest_x+jogador.largura)/32)+1] ~= 2 then
            jogador.x = jogador.dest_x
        else
            jogador.dest_x = jogador.x
        end
      end
      if love.keyboard.isDown("left") then
       -- dirX ,dirY = -1,0
        jogador.dest_x = jogador.dest_x - vel_x*dt
  
       --verifica esquerda
        if self.mapa[math.floor(jogador.dest_y/32)+1][math.floor(jogador.dest_x/32)+1] ~= 2 then
            jogador.x = jogador.dest_x
        else
            jogador.dest_x = jogador.x
        end
      end

      if love.keyboard.isDown("up") then

        jogador.y = jogador.y - vel_y*dt
        --verifica acima
        if self.mapa[math.floor((jogador.dest_y+jogador.altura)/32)+1][math.floor((jogador.dest_x)/32)+1] == 1  then
            vel_y = 0
            jogador.y = jogador.y + 7 * jogador.escala
        else
            vel_y = 50
        end
  
      end

        
        --verifica esquerda
        --[[ if self.mapa[math.floor(jogador.dest_y/32)+1][math.floor(jogador.dest_x/32)+1] ~= 4 then
                jogador.y = jogador.dest_y
            else
                jogador.dest_y = jogador.y
            end]]
      

      if love.keyboard.isDown("down") then
         
        jogador.y = jogador.y + vel_y*dt
         
        if self.mapa[math.floor((jogador.dest_y+jogador.altura*jogador.escala)/32)+1][math.floor((jogador.dest_x)/32)+1] == 1  then
             jogador.y = jogador.dest_y
        else
             jogador.dest_y = jogador.y
        end

      end
        --verifica esquerda
            --[[if self.mapa[math.floor((jogador.dest_y+jogador.altura)/32)+1][math.floor((jogador.dest_x)/32)+1] == 1  then
                vel_y = 0
            else
                vel_y = 20
            end]]
      







    function desenhamapa(mapa)
        for j, linha in ipairs(mapa) do
            for i, bloco in ipairs(linha) do
               if bloco == 0 then
                    love.graphics.setColor(1, 0, 0)
                    love.graphics.rectangle("line", (i-1)*32, (j-1)*32, 32, 32)
                    love.graphics.setColor(1, 1, 1)
                elseif bloco == 1 then
                    love.graphics.setColor(0, 1, 0)
                    love.graphics.rectangle("line", (i-1)*32, (j-1)*32, 32, 32)
                    love.graphics.setColor(1, 1, 1)
                elseif bloco == 2 then
                    love.graphics.setColor(0, 0, 1)
                    love.graphics.rectangle("line", (i-1)*32, (j-1)*32, 32, 32)
                    love.graphics.setColor(1, 1, 1)
                if bloco == 3 then
                    love.graphics.setColor(0, 1, 1)
                    love.graphics.rectangle("line", (i-1)*32, (j-1)*32, 32, 32)
                    love.graphics.setColor(1, 1, 1)
                elseif bloco == 4 then
                    love.graphics.setColor(1, 0, 1)
                    love.graphics.rectangle("line", (i-1)*32, (j-1)*32, 32, 32)
                    love.graphics.setColor(1, 1, 1)
                end
            end
        end
    end
  end 
end
function Mapa:draw()
    desenhamapa(self.mapa)
end 