Acima = Classe:extend()


function Acima:new()
    self.imagem = love.graphics.newImage("recursos/imagem/Jump.png")

     
    self.largura = 32
    self.altura  = 32
    self.tamanho = 32
    self.escala = 1



    animaacima = false
end

function Acima:update(dt)
    self.x = jogador.x
    self.y = jogador.y
    self.dest_x = self.x
    self.dest_y = self.y
end

function Acima:draw()
    love.graphics.draw(self.imagem, self.x, self.y)
end