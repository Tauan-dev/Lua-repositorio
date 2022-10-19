Tiro = Classe:extend()

function Tiro:new(x,y)
    self.x ,self.y = x , y
    self.velocidade = 7
    self.imagem = love.graphics.newImage("recursos/imagens/tiro.png")
    self.altura =  self.imagem:getHeight()
    self.largura = self.imagem:getWidth()

end 

function Tiro:update()
    self.y = self.y - self.velocidade

end 

function Tiro:draw()
    --love.graphics.rectangle("fill",self.x ,self.y ,self.largura ,self.altura)
    love.graphics.draw(self.imagem ,self.x , self.y)
end 

function Tiro:saiuDaTela()
    if self.y < -self.altura then -- quando a altura do tiro fica menor que o inicio a tela, o que se da no canto superior, indica que o tiro saiu totalmente da tela
          return true
    end
    return false
end 