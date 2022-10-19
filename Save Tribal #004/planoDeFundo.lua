PlanoDeFundo = Classe:extend()

function PlanoDeFundo:new(x,y)
    self.imagem = love.graphics.newImage("recursos/imagem/background.png")
    self.x = x
    self.y = y
    self.altura = self.imagem:getHeight()
    self.largura = self.imagem:getWidth()
end 

function PlanoDeFundo:update()
    self.y = self.y + 50 * 0.02

    if self.y >= love.graphics.getHeight() then
        self.y = - self.altura
    end
end

function PlanoDeFundo:draw()
    love.graphics.draw(self.imagem, self.x, self.y)
end