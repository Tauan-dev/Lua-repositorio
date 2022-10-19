Moeda = Classe:extend()

function Moeda:new()

    self.angle = 0

    fps = 3
    self.frame = 1
    self.anim_timer = 1/fps
    self.num_frame = 5
    self.deslocamento = 0  
    
    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("Recursos/Imagens/coin.png")
    self.sprite = love.graphics.newQuad(0, 0,50, 54,self.image:getWidth(),self.image:getHeight())

    self.x = 10
    self.y = 80
    self.largura = 50
    self.altura  = 54

    self.escala = 0.7

    animaMoeda = false
    
end 


function Moeda:update(dt)

    if dt > 0.035 then return end
        
       self.anim_timer = self.anim_timer - dt 
    if self.anim_timer <= 0 then 
        self.anim_timer = 1 /fps
        self.frame = self.frame + 1
    
      if self.frame == self.num_frame then
          self.frame = 0
      end

       self.deslocamento =50 * self.frame 
       self.sprite:setViewport(self.deslocamento,0,50,54)
    end


end 

function Moeda:draw()
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
end
