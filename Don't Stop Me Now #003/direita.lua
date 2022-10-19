Direita = Classe:extend()

function Direita:new()
    heroi = Heroi()

    self.angle = 0

    fps = 3
    self.frame = 1
    self.anim_timer = 1/fps
    self.num_frame = 8
    self.deslocamento = 0  
    
    
    self.velocidade = heroi.velocidade
    

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("Recursos/Imagens/run_scott.png")
    self.sprite = love.graphics.newQuad(0, 0, 50, 64,self.image:getWidth(),self.image:getHeight())
    --pato_sprite = love.graphics.newQuad(x ,y ,width ,heigth , sw, sh) pegar esses valores no animation do paint.net
    
    self.largura = 50
    self.altura =  64

    self.escala = 2
end 


function Direita:update(dt)

    if dt > 0.035 then return end
        
       self.anim_timer = self.anim_timer - dt 
    if self.anim_timer <= 0 then 
        self.anim_timer = 1 /fps
        self.frame = self.frame + 1
    
      if self.frame == self.num_frame then
          self.frame = 0
      end

       self.deslocamento = 50 * self.frame 
       --xdeslocamento =xinicial * frameatual
       self.sprite:setViewport(self.deslocamento,0,50,64)
       --imagem de referência,a sprite cortada nesse caso: setViewport ( x , y , w , h , sw , sh )
    end
    
    --[[if love.keyboard.isDown("d") then
        animaheroi   = false
        animaabaixo  = false
        animaacima   = false   
        animadireita = true
        self.x = self.x + self.velocidade * dt
    end ]]
        
    self.x = heroi.x
    self.y = heroi.y

    if self.x+ self.largura > love.graphics.getWidth() then
        self.x = 0 - self.largura
    end
end 

function Direita:draw()
  --  love.graphics.draw(self.image,self.x ,self.y, 0 ,1.8, 1.8)
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
   

end
