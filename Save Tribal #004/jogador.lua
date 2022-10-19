Jogador = Classe:extend()

function Jogador:new()
    
    self.angle = 0 
    
    fps = 8
    self.frame = 1
    self.anim_timer = 1/fps
    self.num_frame = 11
    self.deslocamento = 0

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("recursos/imagem/parado.png")
    self.sprite = love.graphics.newQuad(0, 0, 32, 32,self.image:getWidth(),self.image:getHeight())
    
    
    self.x = 32
    self.y = 542
    self.largura = 32
    self.altura  = 3
    self.tamanho = 32
    self.escala = 1

      
      
    self.dest_x = self.x
    self.dest_y = self.y
    self.vida = 3
      
    vel_x = 100
    vel_y = 0
    g = 10
    pulando = false

    animajogador = true
    animadireita = false



end

function Jogador:update(dt)
           
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

function Jogador:draw()
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
end

function Jogador:verificaColisao(e)
    if self.x < e.x * e.escala + e.largura and
    self.x + self.largura > e.x*e.escala and
    self.y < e.y*e.escala + e.altura and
    self.y + self.altura > e.y * e.escala then
        return true
    end
end

function Jogador:perderVida()
    self.vida = self.vida - 1 
end







function jogadorcorre()
    animajogador  = false
    animaesquerda = false
    acimaacima    = false
    animadireita  = true
end


function jogadorpula()
    animaesquerda  = false
    animadireita   = false
    animajogador   = false 
    animaacima     = true  
end


function jogadoresquerda()
    animadireita   = false
    animajogador   = false
    animaacima     = false   
    animaesquerda  = true
end
