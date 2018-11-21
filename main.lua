require "variables"
require "initialize"
require "load"
require "map"
require "sprite"
require "console"
require "input"

function love.load()
  
  InitializeGame()
    
  CreateSprite(PLAYER1, 32, 32, STOP, 0.5, 2, 2, 2, 2, STOP, RIGHT)
  CreateSprite(PLAYER2, 48, 48, STOP, 0.5, 4, 4, 4, 4, STOP, LEFT)
  --CreateSprite(ENEMY1, 16, 48, STOP, 0.1)
  
  GameSprites[PLAYER1].sprite.walkanim = newAnimation(love.graphics.newImage("romfs/walkanim1.png"), 20, 20, 0.5)
  GameSprites[PLAYER1].sprite.stopanim = newAnimation(love.graphics.newImage("romfs/stopanim1.png"), 20, 20, 0.5)
  GameSprites[PLAYER2].sprite.walkanim = newAnimation(love.graphics.newImage("romfs/walkanim2.png"), 20, 20, 1)
  GameSprites[PLAYER2].sprite.stopanim = newAnimation(love.graphics.newImage("romfs/stopanim2.png"), 20, 20, 1)
  
  LoadGameData() 
  DrawMap(Level1)
  
end -- end of love.load()

function love.update(dt)
  
  HandleInputs()
  UpdateSpritesFrames(dt)
  UpdateSpritesPositions()
    
end -- end of love.update()

function love.draw()
    
  DrawMap(Level1)
  MoveSprites()
  DrawSprites()
  
  if console.status == true then ShowConsole() end
  
  love.graphics.print("tposx:".. GameSprites[1].sprite.tposx .." tposy:".. GameSprites[1].sprite.tposy .." tablepos:".. GameSprites[1].sprite.tablepos .." lookatx:".. GameSprites[1].sprite.lookat .." x:".. math.floor(GameSprites[1].sprite.x) .."  y:".. math.floor(GameSprites[1].sprite.y) .."", 8, 8)
  
  if js ~= "hello" then
        love.graphics.print( tostring(js), 100, 180)

  local i = 0
      for k, v in pairs(axes) do
        love.graphics.print("Stick " .. k .. ": " .. v[1] .. " " .. v[2], 100, 200 + (i * 18))
        i = i + 1
      end  -- end of for  
    end --end of if js ~= "hello"
  
end -- end of love.draw()