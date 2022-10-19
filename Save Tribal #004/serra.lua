Serra = Classe:extend()

function Serra:new()
    
    self.angle = 0 
    
    self.fps = 4
    self.frame = 1
    self.anim_timer = 1/self.fps
    self.num_frame = 3
    self.deslocamento = 0

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("recursos/imagem/Serra.png")
    self.sprite = love.graphics.newQuad(0, 0, 38, 38,self.image:getWidth(),self.image:getHeight())
    
    
    self.x = 300
    self.y = 200
    self.largura = 38
    self.altura  = 38
    self.tamanho = 38
    self.escala = 1

    self.velocidade = 30


      

end

function Serra:update(dt)
           
    if dt > 0.035 then return end
        
       self.anim_timer = self.anim_timer - dt 
    if self.anim_timer <= 0 then 
        self.anim_timer = 1 /self.fps
        self.frame = self.frame + 1
    
        if self.frame == self.num_frame then
          self.frame = 0
        end

       self.deslocamento = 38 * self.frame 
       --xdeslocamento =xinicial * frameatual
       self.sprite:setViewport(self.deslocamento,0,38,38)
       --imagem de referência,a sprite cortada nesse caso: setViewport ( x , y , w , h , sw , sh )
    end

    if self.y < 210 then
        self.y = self.y + self.velocidade
        if self.y >= 500 then
            self.y = self.y - self.velocidade
        end
    end
end

function Serra:draw()
   -- lve.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
    
    love.graphics.draw(self.image,self.sprite,self.x, self.y,math.rad(self.angle),self.escala) 
    
end
