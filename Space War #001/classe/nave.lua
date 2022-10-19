Nave = Classe:extend()
--nave = Nave()

function Nave:new()
    self.imagem = love.graphics.newImage("recursos/imagens/nave.png")  -- é utilizado para printar na tela a imagem em png escolhida 
    self.x, self.y = 400, 300
    self.altura =  self.imagem:getHeight()
    self.largura = self.imagem:getWidth()
    self.velocidade = 8
   
    self.listaDeTiros = {}

    self.pontos = 0
    self.vidas = 3

    self.tempoDeTiro = 0
    self.delay = 0

    self.somTiro = love.audio.newSource("recursos/sons/tiro_sound.mp3","static")
end

function Nave:update()
     self:mover()
     self:manterNaTela()
     
     for i, tiro in pairs(self.listaDeTiros) do
       tiro:update()
       
          if  tiro:saiuDaTela() then
            table.remove(self.listaDeTiros,i)
          end
      end 

      if self.delay < 1 then
            self.delay = 0.02
      end
       
      self.tempoDeTiro = self.tempoDeTiro + self.delay
     
      
     if love.keyboard.isDown("space") and self.tempoDeTiro > 0.3 then
         self.tempoDeTiro = 0
         self:atirar()
     end  
end


    
function Nave:draw()
    --love.graphics.rectangle( "fill", self.x ,self.y ,self.largura ,self.altura )
     for i, tiro in pairs(self.listaDeTiros) do
      tiro:draw()
     end
     love.graphics.draw(self.imagem, self.x, self.y)
     
end

function Nave:mover()
      if love.keyboard.isDown("up") then
            self.y = self.y - self.velocidade
      elseif love.keyboard.isDown("down") then
            self.y = self.y + self.velocidade
      end
      
      if love.keyboard.isDown("right") then
            self.x = self.x + self.velocidade
      elseif love.keyboard.isDown("left") then
            self.x = self.x - self.velocidade
      end     
end  

function Nave:manterNaTela()
      if self.x < 0 then 
            self.x = 0
      elseif self.x + self.largura > love.graphics.getWidth() then -- o modulo love.graphics.getWidth() é utilizado para descobrir o tamanho da tela
           self.x = love.graphics.getWidth() - self.largura 
      end
      
      if self.y < 0 then 
            self.y = 0
      elseif self.y + self.altura > love.graphics.getHeight() then -- o modulo love.graphics.getHeight() é utilizado para descobrir a altura da tela
           self.y = love.graphics.getHeight() - self.altura 
      end
end


function Nave:atirar()
     self.somTiro:play()
     
     local tiro = Tiro((self.x + self.largura/2 )-2, self.y) -- recebe como paramêtro os valores da nave ,pois o tiro surge a partir da posição da nave . atráves do cálculo  é posicionado no meio, onde foi escolhido como posição de origem do tiro
     table.insert(self.listaDeTiros,tiro)
end

function Nave:incrementarPontos(pontosInimigo)
      self.pontos = self.pontos + pontosInimigo

end

function Nave:ganharVida()
      self.vidas = self.vidas + 1 
end

function Nave:perderVida()
      self.vidas = self.vidas - 1 
end