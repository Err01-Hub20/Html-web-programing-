
{ Made by Frank }
Uses Crt, Graph; 

Var 
graphicsDriver, graphicsMode, 
color, maxColor, startX, startY : integer; 

Begin
graphicsDriver := Detect;
InitGraph(graphicsDriver, graphicsMode, ''); 

startX := getMaxX; 
startY := getMaxY; 

randomize; 
While (not keypressed) do 
Begin 
color := random(maxColor) + 1; 
putPixel(random(startX), random(startY), color); 
end; 
  Closegraph;
  End. 
  
