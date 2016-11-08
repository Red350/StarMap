// OOP Labtest 1
// Pádraig Redmond C15775659

ArrayList<Star> stars;

void setup()
{
  size(800,800);
  stars = new ArrayList<Star>();
  loadData();
  printStars();
  
}

void draw()
{
  
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