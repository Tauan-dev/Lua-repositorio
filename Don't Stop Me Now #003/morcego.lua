Morcego = Classe:extend()

function Morcego:new()

    self.angle = 0

    fps = 3
    self.frame = 1
    self.anim_timer = 1/fps
    self.num_frame = 3
    self.deslocamento = 0  
    
    self.x = 0
    self.velocidade = 160
    

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("Recursos/Imagens/morcego_fly.png")
    self.sprite = love.graphics.newQuad(0, 0, 40, 35,self.image:getWidth(),self.image:getHeight())
    self.x = love.graphics.getWidth()- 40
    self.y = 410
    self.largura = 40
    self.altura =  35

    self.escala = 2
end 


function Morcego:update(dt)

    if dt > 0.035 then return end
        
       self.anim_timer = self.anim_timer - dt 
    if self.anim_timer <= 0 then 
        self.anim_timer = 1 /fps
        self.frame = self.frame + 1
    
      if self.frame == self.num_frame then
          self.frame = 0
      end

       self.deslocamento = 40 * self.frame 
       self.sprite:setViewport(self.deslocamento,0,40,35)

    end

    self.x = self.x - self.velocidade *dt
    
end 

function Morcego:draw()
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
end



function Morcego:saiuDaTela()
    if self.x > largura_tela+self.largura then
        return true
    elseif self.x < -self.largura*2 then
        return true
    end
end
