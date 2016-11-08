class Star
{
  boolean habitable;
  String name;
  float distance;
  float x, y;
  float size;
  
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
  }
  
  String toString()
  {
    return name + " " + habitable + " " + distance + " " + x + " " + y + " " + size;
  }
}