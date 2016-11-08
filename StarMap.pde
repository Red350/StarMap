// OOP Labtest 1
// Pádraig Redmond C15775659

ArrayList<Star> stars;
float gap = 50;
int numLines = 10;
int numSquares = 10;
float squareSize;

float gridSize;  // grid will be square, don't need width and height

void setup()
{
  size(800,800);
  gridSize = height - gap * 2;
  squareSize = (width - (gap * 2)) / numSquares;
  stars = new ArrayList<Star>();
  loadData();
  printStars();
  
}

void draw()
{
  background(0);
  drawGrid();
}

void drawGrid()
{
  stroke(#9932CC);
  noFill();
  // draw grid
  for(int i = 0; i < numSquares; i++)
  {
    for(int j = 0; j < numSquares; j++)
    {
      rect(i * squareSize + gap, j * squareSize + gap, squareSize, squareSize);
    }
  }
  //for(int i = 0; i < numLines; i++)
  //{
  //  float x = map(i, 0, numLines, gap, gridSize+gap);
  //  line(x, gap, x, gap + gridSize);
  //}
}

void loadData()
{
  Table table = loadTable("HabHYG15ly.csv", "csv, header");
  
  for(TableRow row : table.rows())
  {
    Star s = new Star(row);
    stars.add(s);
  }
}

void printStars()
{
  for(Star s : stars)
  {
    println(s);
  }
}