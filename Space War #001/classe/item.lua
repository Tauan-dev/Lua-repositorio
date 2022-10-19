--[[Item = Classe:extend()

function Item:new(tipo,x,y)
    self.x,self.y = x, y 
    --self.altura =  self.imagem:getHeight()
    --self.largura = self.imagem:getWidth()
    self.tipo = tipo
    self.velocidade = 6

    if self.tipo == 1 then
        self.imagem = love.graphics.newImage("recursos/imagens/itemTiro.png")
    elseif self.tipo == 2 then
        self.imagem = love.graphics.newImage("recursos/imagens/itemVelocidade.png")
    end 
        
end 

function Item:update()
    self.y = self.y+ self.velocidade 
end 

function Item:draw()
    love.graphics.draw(self.imagem , self.x ,self.y)
end 

function Item:saiuDaTela()
    if self.y > love.graphics.getWidth() then
        return true
    end
    return false
end]]