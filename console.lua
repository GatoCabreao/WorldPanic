function ShowConsole()
  
  love.graphics.setFont(consolefont)
  love.graphics.draw(console_image, console.x,console.y,0,scale,scale)
  
  for n=1, table.getn(console.lines) do
    love.graphics.print(console.lines[n],console.xm * scale, (console.ym * n))
  end
love.graphics.draw(logo,370,150,0,3,3)
end

function Console(text)
  table.insert(console.lines, table.getn(console.lines)+1, text)
end  -- end of Console()