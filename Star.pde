class Star
{
  boolean habitable;
  String name;
  float distance;
  float x, y, z;
  float size;
  float realX, realY;
  int crossSize = 2;  // half the size of the yellow cross
  int textOffset = 10; // number of pixels the text is moved to the right
  
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
    this.z = row.getFloat("Zg");
    this.size = row.getFloat("AbsMag");
    
    // calculate actual coordinates of the centre star
    // centre of the grid is the very centre of the sketch
    // so can just offset from that point using the size
    // of a single grid square
    realX = width / 2 + squareSize * x;
    realY = height / 2 + squareSize * y;
  }
  
  boolean checkHit()
  {
    // calculate distance from mouse to center of star
    float d = sqrt(pow(mouseX-realX,2) + pow(mouseY-realY,2));
    if (d < distance)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  String toString()
  {
    return name + " " + habitable + " " + distance + " " + x + " " + y + " " + z + " " + size;
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
    
    // print the name
    fill(255);
    textAlign(LEFT, CENTER);
    text(name, realX+textOffset, realY);
  }
}