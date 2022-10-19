Ganso = Classe:extend()

function Ganso:new(velocidade)
   

    self.angle = 0 

  -- parametros de animação
    fps = 4  -- frames por segundo (o número de frames/quadros que ocorrem por segundo), resumidamente vai controlar a velocidade da animação
    self.anim_timer = 1/fps -- utilizado para achar o tempo para que cada quadro vai ser modificado 
    self.frame = 1 -- variavel para saber em qual frame se está
    self.num_frame = 3 -- número de frames 
    self.xdeslocamento = 0   -- responsável pelo deslocamento (obviamente)

    --love.graphics.setDefaultFilter('nearest','nearest')
    self.ganso_image = love.graphics.newImage("recursos/imagens/spritesheet_ganso.png")
    self.ganso_sprite = love.graphics.newQuad(1 ,0 ,173 ,139 ,self.ganso_image:getWidth(), self.ganso_image:getHeight())
 --ganso_sprite = love.graphics.newQuad(x ,y ,width ,heigth , sw, sh) pegar esses valores no animation do paint.net
    self.largura = 173
    self.altura =  139


    self.posicao = 1

    self.escala = 0.7

    self.x, self.y = ((-self.largura*self.escala)*(1-2*self.posicao)+largura_tela*self.posicao), love.math.random(0, altura_tela-self.altura*self.escala)
    self.velocidade = velocidade*(1-2*self.posicao)

    self.y = love.math.random(0, 400)

    self.quack = love.audio.newSource("recursos/sons/duck.mp3","static")
end

function Ganso:update(dt) -- dt é só declarado na função update, que no caso controla a atualização do código
    
    if dt > 0.035 then return end
   
       self.anim_timer = self.anim_timer - dt  -- a partir do delta time vai ser contado a quantidade de tempo que se passa entre cada atualização
    if self.anim_timer <= 0 then
       self.anim_timer = 1 /fps    -- reseta o valor do self.anim_timer, o que faz ele continuar atualizando
       self.frame = self.frame + 1      -- faz o sprite passar pro próximo tile 
   

       if  self.frame == self.num_frame then   -- faz com que quando o número de frames lidos for igual o número total de frames , ele volte ao início (criando um looping e consequentemente animando a imagem)
           self.frame = 0            
      end
   
        self.xdeslocamento = 173 * self.frame 
       --xdeslocamento =xinicial * frameatual
        self.ganso_sprite:setViewport(self.xdeslocamento,0,173,139)
        --imagem de referência,a sprite cortada nesse caso: setViewport ( x , y , w , h , sw , sh )
    end

    self.x = self.x + self.velocidade*dt

end

function Ganso:draw()
    love.graphics.draw(self.ganso_image,self.ganso_sprite,self.x,self.y,math.rad(self.angle),self.escala)
end

function Ganso:saiuDaTela()
    if self.x > largura_tela+self.largura then
        return true
    elseif self.x < -self.largura*2 then
        return true
    end
end

---------------------------------------------------------------------------------------------------------------------------

 

--[[function love.load()
   
end


function love.update(dt) 

   
    
   if dt > 0.035 then return end
   
    self.anim_timer = self.anim_timer - dt  -- a partir do delta time vai ser contado a quantidade de tempo que se passa entre cada atualização
   if self.anim_timer <= 0 then
        self.anim_timer = 1 /self.fps    -- reseta o valor do self.anim_timer, o que faz ele continuar atualizando
        self.frame = self.frame + 1      -- faz o sprite passar pro próximo tile 
       

       if self.frame == self.num_frame then   -- faz com que quando o número de frames lidos for igual o número total de frames , ele volte ao início (criando um looping e consequentemente animando a imagem)
          self.frame = 0            
       end
       
       self.xdeslocamento = 164 * self.frame 
       --xdeslocamento =xinicial * frameatual
       pato_sprite:setViewport(self.xdeslocamento,0,164,139)
     --imagem de referência,a sprite cortada nesse caso: setViewport ( x , y , w , h , sw , sh )
    end
        
end


function love.draw() 
    
 -- love.graphics.draw(imagem referêncial(onde esta o spritesheet),imagem que vai ser desenhada na tela,x,y,rotação, dimensional w, dimensional h )
end]]