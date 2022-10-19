Heroi = Classe:extend()

function Heroi:new()

    self.angle = 0

    fps = 3
    self.frame = 1
    self.anim_timer = 1/fps
    self.num_frame = 8
    self.deslocamento = 0  
    
   
    self.velocidade = 300
    

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("Recursos/Imagens/parado.png")
    self.sprite = love.graphics.newQuad(0, 0, 50, 71,self.image:getWidth(),self.image:getHeight())
    --pato_sprite = love.graphics.newQuad(x ,y ,width ,heigth , sw, sh) pegar esses valores no animation do paint.net
    self.x = 10
    self.y = 430
    self.largura = 50
    self.altura =  71
    

    self.escala = 2

    self.gravidade = 10
    

    animadireita = false
    animaheroi =true
end 


function Heroi:update(dt)
       
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
       self.sprite:setViewport(self.deslocamento,0,50,71)
       --imagem de referência,a sprite cortada nesse caso: setViewport ( x , y , w , h , sw , sh )
    end
     
    

    if love.keyboard.isDown("d") then
       heroicorre()
       animaacima = false
       self.x = self.x + self.velocidade *dt
       mantemNaTela()
      -- mantemNoChao()
    end

    
    if love.keyboard.isDown("w") then
        heroipula()   
        self.y = self.y - self.velocidade * dt
        if self.y < 320  then
            self.y = self.y + 120
           -- mantemNaTela()
            if love.keyboard.isDown("d") then
            
                self.x = self.x + self.velocidade *dt
            end
        end

        mantemNoChao()
   
    end
    
 --   if self.y < 400  then
 --       self.y = self.y + 100
  --  end

    if love.keyboard.isDown("s") then
       heroiabaixa()
       self.y = self.y + self.velocidade *dt
       if love.keyboard.isDown("d")then
          self.x =self.x + self.velocidade *dt
       end
       mantemNoChao()
       mantemNaTela()
    end

    if love.keyboard.isDown("a") then
        self.x = self.x-self.velocidade *dt 
    end
    
    function mantemNoChao() 
        if self.y > 560 then
            self.y = 430
        end
    end
    
    function mantemNaTela ()
        if self.y + self.altura > 430 then -- o modulo love.graphics.getHeight() é utilizado para descobrir a altura da tela
          self.y = 430 
        end 
    end
   
    xAtual = self.x
    yAtual = self.y
    
  --  if love.keyboard.isDown("w") then
  --      self.y = self.y - 10
  --  end 
    
    
    
    if love.keyboard.isDown("g") then
        animadireita = false
        animaheroi   = true
        animaabaixo  = false
    end

    if self.x+ self.largura > love.graphics.getWidth() then
        self.x = 0 - self.largura
    end
end 

function Heroi:draw()
  --  love.graphics.draw(self.image,self.x ,self.y, 0 ,1.8, 1.8)
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
    
end




function heroipula()
    animaabaixo  = false
    animadireita = false
    animaheroi   = false 
    animaacima   = true
   
end


function heroicorre()
    animaheroi   = false
    animaabaixo  = false
    acimaacima   = false
    animadireita = true
end

function heroiabaixa()
    animadireita = false
    animaheroi   = false
    animaacima   = false   
    animaabaixo  = true
end


--[[function Heroi:verificaColisao(A) 
    if  xAtual-self.escala*self.largura/2 < A.x - A.posicao*A.largura*A.escala + A.largura*A.escala and
        xAtual-self.escala*self.largura/2 + self.largura*self.escala > A.x - (A.posicao*A.largura*A.escala) and
        yAtual-self.escala*self.altura/2 < A.y + A.altura*A.escala and
        yAtual-self.escala*self.altura/2 + self.altura*self.escala > A.y then
        return true
    end
end]] 
function Heroi:verificaColisao(e)
    if self.x*self.escala < e.x * e.escala + e.largura and
    self.x*self.escala + self.largura > e.x*e.escala and
    self.y*self.escala < e.y*e.escala + e.altura and
    self.y*self.escala + self.altura > e.y * e.escala then
        return true
    end
end