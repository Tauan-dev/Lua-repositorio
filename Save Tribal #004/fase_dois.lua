Fase_dois = Classe:extend()


function Fase_dois:new() 
    self.mapa = {
        {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 2},
        {2, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, 2},
        {2, 0, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4},
        }
        

        
        love.graphics.setDefaultFilter('nearest','nearest')
        floor_one  = love.graphics.newImage("recursos/imagem/floor.png")
        self.ponte = love.graphics.newImage("recursos/imagem/ponte_one.png")
        --self.imagem = love.graphics.newImage("recursos/imagem/plataforma_one.png")
        --self.x = x
        self.y = y
        self.escala = 1
        self.angle = 0
       
    
end

function Fase_dois:update(dt)
    
    if love.keyboard.isDown("right") then
      --dirX ,dirY = 1,0
      jogador.dest_x = jogador.dest_x + vel_x*dt

      --verifica direita
      if self.mapa[math.floor(jogador.dest_y/32)+1][math.floor((jogador.dest_x+jogador.largura)/32)+1] ~= 2 then
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

    if pulando == true then
      vel_y = vel_y + g
    end
    jogador.dest_y = jogador.dest_y + vel_y*dt

    if self.mapa[math.floor((jogador.dest_y+jogador.altura)/32)+1][math.floor((jogador.dest_x)/32)+1] == 1  then
      vel_y = 0
      pulando = false
    else
      pulando = true
    end

    if love.keyboard.isDown("up") then
      if pulando == false then
          pulando = true
          vel_y = -480
      end
    end

    if self.mapa[math.floor((jogador.dest_y+jogador.altura)/32)+1][math.floor((jogador.dest_x)/32)+1] ~= 1 then
      jogador.y = jogador.dest_y
    else
      jogador.dest_y = jogador.y
    end

    if jogador.y + jogador.altura >= love.graphics.getHeight() then
       jogador.y = jogador.y +32
    end
  

    
    function desenhamapa(mapa)
        for j, linha in ipairs(mapa) do
            for i, bloco in ipairs(linha) do
             --[[   if bloco == 0 then
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
                love.graphics.setColor(1, 1, 1)]]
                if bloco == 3 then
                    love.graphics.draw (self.ponte,(i-1)*32, (j-1)*32,math.rad(self.angle),self.escala)
                elseif bloco == 4 then
                    love.graphics.draw (floor_one,(i-1)*32, (j-1)*32,math.rad(self.angle),self.escala)
                end
            end
        end
    end

end

function Fase_dois:draw()
 --   love.graphics.draw(self.imagem,self.x,self.y)
    desenhamapa(self.mapa)
end


  
  
