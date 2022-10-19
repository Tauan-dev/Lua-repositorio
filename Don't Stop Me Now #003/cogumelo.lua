Cogumelo = Classe:extend()

function Cogumelo:new()

    self.angle = 0

    fps = 3
    self.frame = 1
    self.anim_timer = 1/fps
    self.num_frame = 3
    self.deslocamento = 0  
    
    
    self.velocidade = 100
    
    self.escala = 2

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("Recursos/Imagens/cogumelo.png")
    self.sprite = love.graphics.newQuad(0, 0, 47, 48,self.image:getWidth(),self.image:getHeight())
    --pato_sprite = love.graphics.newQuad(x ,y ,width ,heigth , sw, sh) pegar esses valores no animation do paint.net
    self.x = love.graphics.getWidth() - 47 * self.escala
    self.y = 450
    self.largura = 47
    self.altura =  48

    
end 


function Cogumelo:update(dt)

    if dt > 0.035 then return end
        
       self.anim_timer = self.anim_timer - dt 
    if self.anim_timer <= 0 then 
        self.anim_timer = 1 /fps
        self.frame = self.frame + 1
    
      if self.frame == self.num_frame then
          self.frame = 0
      end

       self.deslocamento = 47 * self.frame 
       --xdeslocamento =xinicial * frameatual
       self.sprite:setViewport(self.deslocamento,0,47,48)
       --imagem de referência,a sprite cortada nesse caso: setViewport ( x , y , w , h , sw , sh )
    end
    
    self.x = self.x - self.velocidade *dt
    if self.x <= 0 - self.largura then
        self.x = (love.graphics.getWidth() - self.largura )- 100
    end
    
end 

function Cogumelo:draw()
  --  love.graphics.draw(self.image,self.x ,self.y, 0 ,1.8, 1.8)
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
    
end
