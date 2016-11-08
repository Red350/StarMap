class Star
{
  boolean habitable;
  String name;
  float distance;
  float x, y;
  float size;
  float realX, realY;
  int crossSize = 2;  // half the size of the yellow cross
  
  Star(TableRow row)
  {
    if(row.getInt("Hab?") == 1)
    {
      this.habitable = true;
    }
    this.name = row.getString("Display Name");
    this.distance = row.getFloat("Distance");
    this.x = row.getFloat("Xg");
    this.y = row.getFloat("Yg");
    this.size = row.getFloat("AbsMag");
    
    // calculate actual coordinates of star
    // centre of the grid is the very centre of the sketch
    // so can just offset from that point using the size
    // of a single grid square
    realX = width / 2 + squareSize * x;
    realY = height / 2 + squareSize * y;
  }
  
  String toString()
  {
    return name + " " + habitable + " " + distance + " " + x + " " + y + " " + size;
  }
  
  void render()
  {
    // draw the cross
    stroke(#FFFF00);
    line(realX+crossSize, realY, realX-crossSize, realY);
    line(realX, realY+crossSize, realX, realY-crossSize);
    // draw the circle
    noFill();
    stroke(#FF0000);
    ellipse(realX, realY, size, size);
  }
}