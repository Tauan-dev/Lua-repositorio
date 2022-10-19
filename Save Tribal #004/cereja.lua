Cereja = Classe:extend()

function Cereja:new()
    
    self.angle = 0 
    
    fps = 14
    self.frame = 1
    self.anim_timer = 1/fps
    self.num_frame = 17
    self.deslocamento = 0

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("recursos/imagem/Cerejas.png")
    self.sprite = love.graphics.newQuad(0, 0, 32, 32,self.image:getWidth(),self.image:getHeight())
    
    
    self.x = 600
    self.y = 480
    self.largura = 32
    self.altura  = 32
    self.tamanho = 32
    self.escala = 1

      

end

function Cereja:update(dt)
           
    if dt > 0.035 then return end
        
       self.anim_timer = self.anim_timer - dt 
    if self.anim_timer <= 0 then 
        self.anim_timer = 1 /fps
        self.frame = self.frame + 1
    
        if self.frame == self.num_frame then
          self.frame = 0
        end

       self.deslocamento = 32 * self.frame 
       --xdeslocamento =xinicial * frameatual
       self.sprite:setViewport(self.deslocamento,0,32,32)
       --imagem de referência,a sprite cortada nesse caso: setViewport ( x , y , w , h , sw , sh )
    end
end

function Cereja:draw()
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
end
