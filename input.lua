function love.gamepadreleased(joystick, button)
    if button == "minus" then
        console.status = false
    end
end  -- end of love.gamepadreleased()

function love.gamepadpressed(joystick, button)
    
    js = button

    if button == "plus" then
        love.event.quit()
    end
    if button == "minus" then
        console.status = true
    end
    	  if button == "a" then GameSprites[PLAYER1].sprite.dir = RIGHT 
    elseif button == "b" then GameSprites[PLAYER1].sprite.dir = DOWN  
    elseif button == "x" then GameSprites[PLAYER1].sprite.dir = UP	  
    elseif button == "y" then GameSprites[PLAYER1].sprite.dir = LEFT  
    else	
    GameSprites[PLAYER1].sprite.dir = STOP  end

        if button == "dpright"  then GameSprites[PLAYER2].sprite.dir = RIGHT 
    elseif button == "dpdown"   then GameSprites[PLAYER2].sprite.dir = DOWN  
    elseif button == "dpup"     then GameSprites[PLAYER2].sprite.dir = UP	  
    elseif button == "dpleft"   then GameSprites[PLAYER2].sprite.dir = LEFT  
    else 
    GameSprites[PLAYER2].sprite.dir = STOP  end

end -- end of love.gamepadpressed()

function love.gamepadreleased(joystick, button)
	
js = button	

  if button then 
      GameSprites[PLAYER2].sprite.dir = STOP  
  end
end -- end of love.gamepadreleased

function HandleInputs()
  
if OS == "Windows" or OS == "Linux" then
        
        if love.keyboard.isDown('up')     then GameSprites[PLAYER1].sprite.dir = UP     
    elseif love.keyboard.isDown('down')   then GameSprites[PLAYER1].sprite.dir = DOWN   
    elseif love.keyboard.isDown('left')   then GameSprites[PLAYER1].sprite.dir = LEFT  GameSprites[PLAYER1].sprite.lookat = LEFT 
    elseif love.keyboard.isDown('right')  then GameSprites[PLAYER1].sprite.dir = RIGHT GameSprites[PLAYER1].sprite.lookat = RIGHT 
    else   GameSprites[PLAYER1].sprite.dir = STOP end -- else
    
        if love.keyboard.isDown('w')     then GameSprites[PLAYER2].sprite.dir = UP     
    elseif love.keyboard.isDown('s')   then GameSprites[PLAYER2].sprite.dir = DOWN   
    elseif love.keyboard.isDown('a')   then GameSprites[PLAYER2].sprite.dir = LEFT  GameSprites[PLAYER2].sprite.lookat = LEFT 
    elseif love.keyboard.isDown('d')  then GameSprites[PLAYER2].sprite.dir = RIGHT GameSprites[PLAYER2].sprite.lookat = RIGHT 
    else   GameSprites[PLAYER2].sprite.dir = STOP  end -- else

  if love.keyboard.isDown('escape') then love.event.quit() end   
end  -- end of if OS == "Windows" or OS == "Linux" 

function love.keypressed(key)
    if key=='space' then console.status = true end
end

function love.keyreleased(key)
   if key=='space' then console.status = false end
end   

end  -- end of HandleInputs()

function love.gamepadaxis(joy, axis, value)
    if axis:find("left") then
        axes.left[1] = axis
        axes.left[2] = value
    elseif axis:find("right") then
        axes.right[1] = axis
        axes.right[2] = value
    end
end -- end of love.gamepadaxis()