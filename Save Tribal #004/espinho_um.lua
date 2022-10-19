Espinho_um = Classe:extend()

function Espinho_um:new()
    self.imagem = love.graphics.newImage("recursos/imagem/espinhos.png")
        
    self.x = 440  
    self.y = 542
    self.largura = 32
    self.altura = 32
    self.escala = 1
end

function Espinho_um:update(dt)
end

function Espinho_um:draw()
    love.graphics.draw(self.imagem, self.x, self.y)
end