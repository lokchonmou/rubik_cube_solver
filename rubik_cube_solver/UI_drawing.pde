void update_box(){
 //draw_box
  stroke(0);
  strokeWeight(1);
  for (int x=0; x<=5; x++) {
    for (int y=0; y<=2; y++) {
      for (int z=0; z<=2; z++) {
        fill(fill_color[rubik_color[x][y][z]]);
        if (x==0) rect((z+3)*box_size, y*box_size, box_size, box_size);
        if (x>0 && x<5)  rect((z+(x-1)*3)*box_size, (y+3)*box_size, box_size, box_size);
        if (x==5) rect((z+3)*box_size, (y+6)*box_size, box_size, box_size);
        //print(_rubik_color[x][y][z]);
      }
      //println();
    }
    //println();
  }
  // draw frame
   strokeWeight(5);
   noFill();
   for (int i=0; i<=5; i++) {
    if (i==0)  rect(3*box_size, 0, 3*box_size, 3*box_size);
    if (i>0 && i<5) rect((i-1)*3*box_size, 3*box_size, 3*box_size, 3*box_size);
    if (i==5)  rect(3*box_size, 6*box_size, 3*box_size, 3*box_size);
   }
}