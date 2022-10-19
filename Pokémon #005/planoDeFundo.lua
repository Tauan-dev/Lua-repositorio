PlanoDeFundo = Classe:extend()

function PlanoDeFundo:new(x,y)
    self.imagem = love.graphics.newImage("recursos/imagem/background.png")
    self.x = x
    self.y = y
    self.altura = self.imagem:getHeight()
    self.largura = self.imagem:getWidth()
end 

function PlanoDeFundo:update()
   
end

function PlanoDeFundo:draw()
    love.graphics.draw(self.imagem, self.x, self.y)
end