Bonus = Classe:extend()

function Bonus:new()

    self.angle = 0

    self.fps = 5
    self.frame = 1
    self.anim_timer = 1/self.fps
    self.num_frame = 5
    self.deslocamento = 0  
    
    

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("Recursos/Imagens/Bonus.png")
    self.sprite = love.graphics.newQuad(0, 0, 50, 44,self.image:getWidth(),self.image:getHeight())
    self.x = love.graphics.getWidth() - 50
    self.y = 450
    self.largura = 50
    self.altura =  44

    self.escala = 2
end 


function Bonus:update(dt)

    if dt > 0.035 then return end
        
       self.anim_timer = self.anim_timer - dt 
    if self.anim_timer <= 0 then 
        self.anim_timer = 1 /self.fps
        self.frame = self.frame + 1
    
      if self.frame == self.num_frame then
          self.frame = 0
      end

       self.deslocamento = 50 * self.frame 
       self.sprite:setViewport(self.deslocamento,0,50,44)
    end
    
end 

function Bonus:draw()
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
end




