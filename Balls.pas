

uses
  CRT, Graph;

type
  TBall = record
    bc, br : integer;
    bx, by : integer;
    dx, dy : integer;
    mx, my : integer;
    nx, ny : integer;
    gl, gu : boolean;
  end;

const
  nBall = 900; 

var
  Balls : array[1..nBall] of TBall;

function randomColor : integer;
var
  cs : android_graphics_Color;
begin
  randomColor := cs.rgb(random(224) + 32,
                         random(224) + 32, random(224) + 32);
end;

procedure MoveBall(var aBall : TBall);
begin
  with aBall do
  begin
  
    if gl then bx := bx - dx
    else bx := bx + dx;
    if gu then by := by - dy
    else by := by + dy;
  
    if bx < nx then
    begin
      bx := nx;
      gl := false;
    end;
    if bx > mx then
    begin
      bx := mx;
      gl := true;
    end;
    if by < ny then
    begin
      by := ny;
      gu := false;
    end;
    if by > my then
    begin
      by := my;
      gu := true;
    end;
  end;
end;

procedure DrawBall(aBall : TBall);
begin
  with aBall do
  begin
    SetColor(bc);
    SetFillStyle(SolidFill, bc);
    PieSlice(bx, by, 0, 360, br);
  end;
end;

procedure InitBalls(w, h : integer);
var
  i : integer;
begin
  for i := 1 to nBall do
    with Balls[i] do
    begin
      bc := randomColor; 
      br := random(34) + 23; 
      bx := random(w - br) + br; 
      by := random(h - br) + br; 
      dx := random(20) + 1; 
      dy := random(20) + 1;
      mx := w - br - 1; 
      my := h - br - 1; 
      nx := br + 1; 
      ny := br + 1; 
      gl := random(2) = 0;
      gu := random(2) = 0; 
    end;
end;

var
  cs : android_graphics_Color;
  i, c : integer;
  mx, my : integer;
begin
 
  setBufferEnable(true);
  InitGraph(detect, 0, '');
  mx := GetMaxX;
  my := GetMaxY;

 
  Randomize;
  InitBalls(mx, my);
  SetLineStyle(SolidLn, 0, ThickWidth);

 
  while not keyPressed do
  begin
    
    SetColor(15);
    c := cs.argb(100, 1, 1, 1);
    setFillStyle(solidFill, c);
    Bar(0, 0, mx, my);
  
    SetTextStyle(boldFont, horizDir, 9);
    SetTextJustify(centerText, centerText);
    outTextXY(mx div 2, my div 2, '');

   
    for i := 1 to nBall do
      DrawBall(Balls[i]);
 
    for i := 1 to nBall do
      MoveBall(Balls[i]);

   
    drawBuffer;
  end;
end.
