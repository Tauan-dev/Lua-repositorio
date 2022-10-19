Inimigo = Classe:extend()

function Inimigo:new(x , y, velocidade)
    self.imagem = love.graphics.newImage("recursos/imagens/nave_inimiga.png")  -- é utilizado para printar na tela a imagem em png escolhida 
    self.x, self.y = x, y 
    self.altura =  self.imagem:getHeight()
    self.largura = self.imagem:getWidth()
    self.velocidade = velocidade

    self.pontosInimigo = 1
   -- self.musicaInimigo = love.audio.newSource("recursos/sons/inimigo_roar.mp3","static" )
    
end 

function Inimigo:update()
    self.y = self.y + self.velocidade 
end

function Inimigo:draw()
    love.graphics.draw(self.imagem, self.x, self.y)
end

function Inimigo:saiuDaTela()
    if self.y > love.graphics.getWidth() then
          return true
    end
    return false
end