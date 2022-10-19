PlanoDeFundo = Classe:extend()

function PlanoDeFundo:new(x,y)
    self.imagem = love.graphics.newImage("Recursos/Imagens/background.png")
    self.x = x
    self.y = y
    self.altura = self.imagem:getHeight()
    self.largura = self.imagem:getWidth()
    self.velocidade = 200
end 

function PlanoDeFundo:update(dt)
    self.x = self.x = self.velocidade * dt

    if self.x > love.graphics.getWidth() then
        self.x = - self.largura
    end
end

function PlanoDeFundo:draw()
    love.graphics.draw(self.imagem, self.x, self.y)
end