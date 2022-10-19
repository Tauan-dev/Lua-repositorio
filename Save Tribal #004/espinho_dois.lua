Espinho_dois = Classe:extend()

function Espinho_dois:new()
    self.imagem = love.graphics.newImage("recursos/imagem/espinhos.png")
        
    self.x = 520 
    self.y = 254
    self.largura = 32
    self.altura = 32
    self.escala = 1
end

function Espinho_dois:update(dt)
end

function Espinho_dois:draw()
    love.graphics.draw(self.imagem, self.x, self.y)
end