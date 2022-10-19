Alvo = Classe:extend()

function Alvo:new(x, y)
    self.x, self.y = x, y 

    self.img = love.graphics.newImage("recursos/imagens/tiro.png")
    self.escala = 0.6

    --self.largura, self.altura = self.img:getWidth(), self.img:getHeight()
    self.largura, self.altura = self.img:getDimensions()
    self.tiro = love.audio.newSource("recursos/sons/tiro.wav","static")

end

function Alvo:update(dt)
    self.x, self.y = love.mouse.getPosition()
end

function Alvo:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, self.escala, self.escala, self.largura/2, self.altura/2)
end

function Alvo:atirou()
    if love.mouse.isDown(1) then
        return true
    end
end

function Alvo:verificaColisao(A) 
    if  self.x-self.escala*self.largura/2 < A.x - A.posicao*A.largura*A.escala + A.largura*A.escala and
        self.x-self.escala*self.largura/2 + self.largura*self.escala > A.x - (A.posicao*A.largura*A.escala) and
        self.y-self.escala*self.altura/2 < A.y + A.altura*A.escala and
        self.y-self.escala*self.altura/2 + self.altura*self.escala > A.y then
        return true
    end
end
