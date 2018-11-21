scale = 2                     -- the scale of screen final result

UP    = 1                     -- Sprite Directions 
DOWN  = 2
LEFT  = 3 
RIGHT = 4 
STOP  = 5

PLAYER1   = 1                 -- Sprites
PLAYER2   = 2
ENEMY1    = 3

APPLE     = 1                 -- Items
BANANA    = 2

js = "hello"

console = { 
    x         = 0,            -- x screen position 
    y         = 0,            -- y screen position
    xm        = 8 * scale,    -- x margin
    ym        = 10 * scale,   -- y margin
    vel       = 5 * scale,    -- velocity
    status    = false,        -- status: true show console on screen
    lines     = { }           -- lines of text
}

-- Generic table for game sprites
GameSprites = {         
  sprite = { 
    x         = 1,
    y         = 1,
    tablepos  = 1,
    tposx     = 1,
    tposy     = 1,
    nxtposx   = 1,
    nxtposy   = 1,
    dir       = 1,
    lastdir   = 1,
    lookat    = 1,
    vel       = 1,
    status    = 1,
    score     = 1,
    walkanim = {},
    stopanim = {}
  }
}

axes = 
    {
        left = {"None", 0},
        right = {"None", 0}
    }