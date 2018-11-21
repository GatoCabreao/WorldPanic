
function InitializeGame()
Console(" _ _ _     _                   ") 
Console("| | | |___! !___ ___ _____ ___ ")
Console("| | | | ._| | __| . |     | ._|")
Console("!_____|___|_|___|___|_|_|_|___|")
Console("")
 
  Console("Initializing game ..." )
  OS = love.system.getOS()                                            -- Get the host OS... Windows, Linux or Horizon (Nintendo Switch)
  Console("OS Detected: ".. OS .."")
  love.graphics.setDefaultFilter("nearest","nearest",0)               -- No antialising, please.
  Console("Antializasing: OFF")
  
end