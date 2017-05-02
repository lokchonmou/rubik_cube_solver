void top_cross() {
  for (int i=0; i<4; i++) {
    int side_color = rubik_color[sides[i]][1][1];
    int c[] = findEdge(base_color, side_color);
    if (c[0] == 0 || (c[0]!=5 && c[1]==0)) {//Case 1:The edge is on the top
      if (c[0]!=0 || rubik_color[findEdgeCouple(c)[0]][1][1]!=side_color) {  //which means not exactly correct
        do_formula("ULFRDB".charAt(findEdgeCouple(c)[0])+"");  // turn the edgeCouple face ... and it will become case 3
        c = findEdge(base_color, side_color);  //Update the edge
      }
    } else if (c[0] == 5 || (c[0]!=0 && c[1]==2)) {//Case 2:The edge is on the bottom
      while (c[0]!=sides[i] && findEdgeCouple(c)[0]!=sides[i]) {
        do_formula("D");
        c = findEdge(base_color, side_color);
      }
      do_formula("ULFRDB".charAt(sides[i])+"");  // then turn that face ... and it will become case 3
      c = findEdge(base_color, side_color);  //Update the edge
    }
    if (c[0]!=0 && c[0] != 5 && c[1] == 1) {//Case 3
      int ecs = findEdgeCouple(c)[0];//edgeCoupleSide
      int dif = (sides[i]-ecs+4)%4;
      switch(dif){
        case 0:// just turn that side
          if(c[2]==2) do_formula("ULFRDB".charAt(ecs)+"");//clockwise
          else do_formula("ULFRDB".charAt(ecs)+"'");//anti-clockwise
          break;
        case 1://turn U then the edgeCouple side then U'
          do_formula("U");
          if(c[2]==2) do_formula("ULFRDB".charAt(ecs)+"");//clockwise
          else do_formula("ULFRDB".charAt(ecs)+"'");//anti-clockwise
          do_formula("U'");
          break;
        case 2://turn U2 then the edgeCouple then U2
          do_formula("U2");
          if(c[2]==2) do_formula("ULFRDB".charAt(ecs)+"");//clockwise
          else do_formula("ULFRDB".charAt(ecs)+"'");//anti-clockwise
          do_formula("U2");
          break;
        case 3://turn U' then the edgeCouple side then U
          do_formula("U'");
          if(c[2]==2) do_formula("ULFRDB".charAt(ecs)+"");//clockwise
          else do_formula("ULFRDB".charAt(ecs)+"'");//anti-clockwise
          do_formula("U");
          break;
        default:
          break;
      }
    }
  }
  update_box();
}