Abaixo = Classe:extend()

function Abaixo:new()

    self.angle = 0

    fps = 3
    self.frame = 1
    self.anim_timer = 1/fps
    self.num_frame = 7
    self.deslocamento = 0  
    
   
    self.velocidade = heroi.velocidade
    

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("Recursos/Imagens/rasteira.png")
    self.sprite = love.graphics.newQuad(0, 0,70, 51,self.image:getWidth(),self.image:getHeight())
    --pato_sprite = love.graphics.newQuad(x ,y ,width ,heigth , sw, sh) pegar esses valores no animation do paint.net

    self.x = heroi.x
    self.y = heroi.y
    self.largura = 70
    self.altura  = 51

    self.escala = 2

    animaabaixo = false
    
end 


function Abaixo:update(dt)

    if dt > 0.035 then return end
        
       self.anim_timer = self.anim_timer - dt 
    if self.anim_timer <= 0 then 
        self.anim_timer = 1 /fps
        self.frame = self.frame + 1
    
      if self.frame == self.num_frame then
          self.frame = 0
      end

       self.deslocamento =70 * self.frame 
       --xdeslocamento =xinicial * frameatual
       self.sprite:setViewport(self.deslocamento,0,70,57)
       --imagem de referência,a sprite cortada nesse caso: setViewport ( x , y , w , h , sw , sh )
    end

    self.x = heroi.x
    self.y = heroi.y

    if love.keyboard.isDown("s") then
       
    end 

       
    

    if xAtual+ self.largura > love.graphics.getWidth() then
        xAtual = 0 - self.largura
    end
end 

function Abaixo:draw()
  --  love.graphics.draw(self.image,self.x ,self.y, 0 ,1.8, 1.8)
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
end 

