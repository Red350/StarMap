// OOP Labtest 1
// Pádraig Redmond C15775659

ArrayList<Star> stars;
float gap = 50;
int numLines = 10;
int numSquares = 10;
float squareSize;
float gridSize;  // grid will be square, don't need width and height
Star clickedStar;    // points to a currently clicked star
Star secondClickedStar;  // points to a subsequently clicked star

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
  drawStars();
  drawLine();
}

void mousePressed()
{
  for (int i = 0; i < stars.size(); i++)
  {
    Star star = stars.get(i);
    
    if (star.checkHit() == true)
    {
      // This is the case where two stars are already connected
      if (secondClickedStar != null)
      {
        // reset the second star, and set the first star
        secondClickedStar = null;
        clickedStar = star;
      }
      else
      {
        // no stars are currently selected
        if (clickedStar == null)
        {
          clickedStar = star;
        }
        // first star has been selected already
        else
        {
          secondClickedStar = star;
        }
      }
    }
  }
}

// Draws a line either connecting a star to the mouse
// or a star to another star.
// In the case of two stars being connected, it calculates
// the distance between those stars and displays it.
void drawLine()
{
  if (clickedStar != null)
  {
    // One star is clicked
    stroke(#FFFF00);
    if (secondClickedStar == null)
    {
      line(clickedStar.realX, clickedStar.realY, mouseX, mouseY);
    }
    // Case where two stars are connected
    else
    {
      // I regret the length of these variable names...
      line(clickedStar.realX, clickedStar.realY, secondClickedStar.realX, secondClickedStar.realY);
      
      // calulate the distance between the two stars using the dist function
      float distance = dist(clickedStar.x, clickedStar.y, clickedStar.z, secondClickedStar.x, secondClickedStar.y, secondClickedStar.z);
      textAlign(LEFT, CENTER);
      text("Distance from " + clickedStar.name + " to " + secondClickedStar.name + " is " + distance + " parsecs", gap, height - gap / 2);
    }
  }
}

// Call the render method for each star in the array list
void drawStars()
{
  for (Star s : stars)
  {
    s.render();
  }
}

// Draw a purple grid
void drawGrid()
{
  stroke(#9932CC);
  noFill();
  
  // Draw the grid
  for(int i = 0; i < numSquares; i++)
  {
    for(int j = 0; j < numSquares; j++)
    {
      rect(i * squareSize + gap, j * squareSize + gap, squareSize, squareSize);
    }
  }
  
  // Draw the labels
  textAlign(CENTER, CENTER);
  fill(#9932CC);
  // There is 1 more label than there are squares
  for(int i = 0; i < numSquares+1; i++)
  {
    text(i-5, gap + i * squareSize, gap / 2);
    text(i-5, gap / 2, gap + i * squareSize);
  }
}

// Load the data from a csv file into a Star arraylist
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