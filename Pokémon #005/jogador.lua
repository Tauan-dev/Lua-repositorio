Jogador = Classe:extend()

function Jogador:new()
    
    self.angle = 0 
    
    fps = 5
    self.frame = 1
    self.anim_timer = 1/fps
    self.num_frame = 3
    self.deslocamento = 0

    love.graphics.setDefaultFilter('nearest','nearest')
    self.image = love.graphics.newImage("recursos/imagem/normal.png")
    self.sprite = love.graphics.newQuad(0, 0, 22, 25,self.image:getWidth(),self.image:getHeight())
    
    
    self.x = 400
    self.y = 500
    self.largura = 22
    self.altura  = 25
    self.tamanho = 32
    self.escala = 2

      
      
   
   -- self.vida = 3
      
    vel_x = 50
    vel_y = 50
    --g = 10
    --pulando = false

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

       self.deslocamento = 22 * self.frame 
       --xdeslocamento =xinicial * frameatual
       self.sprite:setViewport(self.deslocamento,0,22,25)
       --imagem de referência,a sprite cortada nesse caso: setViewport ( x , y , w , h , sw , sh )

       
    end
end

function Jogador:draw()
    love.graphics.draw(self.image,self.sprite,self.x,self.y,math.rad(self.angle),self.escala)
end



function jogadorabaixa()
    animaacima     = false
    animaesquerda  = false
    animajogador   = false 
    animaabaixa    = true  
end

function jogadoracima()
    animaabaixa    = false
    animaesquerda  = false
    animajogador   = false 
    animaacima     = true  
end


function jogadoresquerda()
    animaabaixa    = false
    animajogador   = false
    animaacima     = false   
    animaesquerda  = true
end

function jogadorcorre()
    animaabaixa    = false
    animajogador   = true
    animaacima     = false   
    animaesquerda  = false
end