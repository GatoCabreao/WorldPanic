function DrawSprites()
    
  for n=1, table.getn(GameSprites) do
    
   spriteNum = math.floor(GameSprites[n].sprite.walkanim.currentTime / GameSprites[n].sprite.walkanim.duration * #GameSprites[n].sprite.walkanim.quads) + 1 
    
  if GameSprites[n].sprite.dir == RIGHT then
  love.graphics.draw( GameSprites[n].sprite.walkanim.spriteSheet, GameSprites[n].sprite.walkanim.quads[spriteNum], 
                      GameSprites[n].sprite.x * scale-16, 
                      GameSprites[n].sprite.y * scale-16, 0, scale, scale)
  elseif GameSprites[n].sprite.dir == LEFT then
  love.graphics.draw( GameSprites[n].sprite.walkanim.spriteSheet, GameSprites[n].sprite.walkanim.quads[spriteNum], 
                      GameSprites[n].sprite.x * scale-16+40, 
                      GameSprites[n].sprite.y * scale-16, 0, -scale, scale) 
  elseif GameSprites[n].sprite.dir == UP and GameSprites[n].sprite.lookat==LEFT then
  love.graphics.draw( GameSprites[n].sprite.walkanim.spriteSheet, GameSprites[n].sprite.walkanim.quads[spriteNum], 
                      GameSprites[n].sprite.x * scale-16+40, 
                      GameSprites[n].sprite.y * scale-16, 0, -scale, scale)
  elseif GameSprites[n].sprite.dir == DOWN and GameSprites[n].sprite.lookat==LEFT then
  love.graphics.draw( GameSprites[n].sprite.walkanim.spriteSheet, GameSprites[n].sprite.walkanim.quads[spriteNum], 
                      GameSprites[n].sprite.x * scale-16+40, 
                      GameSprites[n].sprite.y * scale-16, 0, -scale, scale)
  elseif GameSprites[n].sprite.dir == UP and GameSprites[n].sprite.lookat==RIGHT then
  love.graphics.draw( GameSprites[n].sprite.walkanim.spriteSheet, GameSprites[n].sprite.walkanim.quads[spriteNum], 
                      GameSprites[n].sprite.x * scale-16, 
                      GameSprites[n].sprite.y * scale-16, 0, scale, scale)
  elseif GameSprites[n].sprite.dir == DOWN and GameSprites[n].sprite.lookat==RIGHT then
  love.graphics.draw( GameSprites[n].sprite.walkanim.spriteSheet, GameSprites[n].sprite.walkanim.quads[spriteNum], 
                      GameSprites[n].sprite.x * scale-16, 
                      GameSprites[n].sprite.y * scale-16, 0, scale, scale)
  elseif GameSprites[n].sprite.dir == STOP and GameSprites[n].sprite.lookat==LEFT then
  love.graphics.draw( GameSprites[n].sprite.stopanim.spriteSheet, GameSprites[n].sprite.stopanim.quads[spriteNum], 
                      GameSprites[n].sprite.x * scale-16+40, 
                      GameSprites[n].sprite.y * scale-16, 0, -scale, scale)
  else 
  love.graphics.draw( GameSprites[n].sprite.stopanim.spriteSheet, GameSprites[n].sprite.stopanim.quads[spriteNum], 
                      GameSprites[n].sprite.x * scale-16, 
                      GameSprites[n].sprite.y * scale-16, 0, scale, scale) 
end  -- if elseif else
      
  end -- end of for
  
end -- end of DrawSprites()

function CreateSprite(id, x, y, dir, vel, tposx, tposy, nxtposx, nxtposy, lastdir, lookat)
  
  table.insert(GameSprites, id,{ sprite = { x = x, 
                                            y = y, 
                                            dir = dir, 
                                            vel = vel, 
                                            tposx = tposx, 
                                            tposy = tposy, 
                                            nxtposx = nxtposx, 
                                            nxtposy = nxtposy,
                                            lastdir = lastdir,
                                            lookat = lookat      }} )
  
end  -- end of CreateSprite()

function MoveSprites()
    
    for n=1, table.getn(GameSprites) do
      if GameSprites[n].sprite.dir == UP    then GameSprites[n].sprite.nxtposy = GameSprites[n].sprite.tposy - 1 end
      if GameSprites[n].sprite.dir == DOWN  then GameSprites[n].sprite.nxtposy = GameSprites[n].sprite.tposy + 1 end
      if GameSprites[n].sprite.dir == RIGHT then GameSprites[n].sprite.nxtposx = GameSprites[n].sprite.tposx + 1 end
      if GameSprites[n].sprite.dir == LEFT  then GameSprites[n].sprite.nxtposx = GameSprites[n].sprite.tposx - 1 end
      
    if GameSprites[n].sprite.tposx < GameSprites[n].sprite.nxtposx then 
        GameSprites[n].sprite.x = GameSprites[n].sprite.x + GameSprites[n].sprite.vel GameSprites[n].sprite.dir = RIGHT 
    elseif GameSprites[n].sprite.tposx > GameSprites[n].sprite.nxtposx then 
        GameSprites[n].sprite.x = GameSprites[n].sprite.x - GameSprites[n].sprite.vel GameSprites[n].sprite.dir = LEFT
    elseif GameSprites[n].sprite.tposy < GameSprites[n].sprite.nxtposy then 
        GameSprites[n].sprite.y = GameSprites[n].sprite.y + GameSprites[n].sprite.vel GameSprites[n].sprite.dir = DOWN 
    elseif GameSprites[n].sprite.tposy > GameSprites[n].sprite.nxtposy then 
        GameSprites[n].sprite.y = GameSprites[n].sprite.y - GameSprites[n].sprite.vel GameSprites[n].sprite.dir = UP
    
    elseif GameSprites[n].sprite.tposy == GameSprites[n].sprite.nxtposy and 
           GameSprites[n].sprite.tposx == GameSprites[n].sprite.nxtposx then 
           GameSprites[n].sprite.lastdir = GameSprites[n].sprite.dir  
           GameSprites[n].sprite.dir = STOP
    end --else
    
    end -- end of for
end -- end of MoveSprites()

function newAnimation(image, width, height, duration)
  
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};
 
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
 
    animation.duration = duration or 1
    animation.currentTime = 0
 
    return animation
end

function UpdateSpritesFrames(dt)
  
  for n=1, table.getn(GameSprites) do
    GameSprites[n].sprite.walkanim.currentTime = GameSprites[n].sprite.walkanim.currentTime + dt
      if GameSprites[n].sprite.walkanim.currentTime >= GameSprites[n].sprite.walkanim.duration then
          GameSprites[n].sprite.walkanim.currentTime = GameSprites[n].sprite.walkanim.currentTime - GameSprites[n].       sprite.walkanim.duration
      end -- if
  end -- for
end -- end of UpdateSpriteFrames()  

function UpdateSpritesPositions()
  
  for n=1, table.getn(GameSprites) do
    GameSprites[n].sprite.tposx = (40 * GameSprites[n].sprite.x) / 640
    GameSprites[n].sprite.tposy = (22.5 * GameSprites[n].sprite.y) / 360
    GameSprites[n].sprite.tposx = math.floor(GameSprites[n].sprite.x /16)+1
    GameSprites[n].sprite.tposy = math.floor(GameSprites[n].sprite.y /16)+1
    GameSprites[n].sprite.tablepos = (GameSprites[n].sprite.tposy - 1) * 40 + GameSprites[n].sprite.tposx
    if n == PLAYER1 and Level1[GameSprites[n].sprite.tablepos] ~= 1 then Level1[GameSprites[n].sprite.tablepos] = 2 end
    if n == PLAYER2 and Level1[GameSprites[n].sprite.tablepos] ~= 1 then Level1[GameSprites[n].sprite.tablepos] = 0 end
  end -- for
  
end -- end of UpdateSpritePositions() 