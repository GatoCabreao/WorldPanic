function LoadGameData()  
  
    logo = love.graphics.newImage("romfs/logo.png")
    bg_image = love.graphics.newImage("romfs/1p_level1_1.png")
    console_image = love.graphics.newImage("romfs/console.png")
    brick_image = love.graphics.newImage("romfs/brick.png")
    ice_image = love.graphics.newImage("romfs/ice.png")
    --player1_image = love.graphics.newImage("romfs/sprite1.png")
    --player2_image = love.graphics.newImage("romfs/sprite2.png")
    consolefont = love.graphics.newFont("romfs/font.ttf", 8*scale)
    --font = love.graphics.newImageFont("romfs/Imagefont.png"," abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\"ñ")
  
    love.graphics.setFont(consolefont)

end
