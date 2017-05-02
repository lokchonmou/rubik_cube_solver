int edgeCouples[][][] = {{{0, 0, 1}, {4, 0, 1}}, {{0, 1, 0}, {1, 0, 1}}, {{0, 1, 2}, {3, 0, 1}}, {{0, 2, 1}, {2, 0, 1}}, 
  {{1, 1, 2}, {2, 1, 0}}, {{2, 1, 2}, {3, 1, 0}}, {{3, 1, 2}, {4, 1, 0}}, {{4, 1, 2}, {1, 1, 0}}, 
  {{5, 0, 1}, {2, 2, 1}}, {{5, 1, 0}, {1, 2, 1}}, {{5, 1, 2}, {3, 2, 1}}, {{5, 2, 1}, {4, 2, 1}}};

int[] findEdgeCouple(int x[]){
  return findEdgeCouple(x[0], x[1], x[2]);
}
int[] findEdgeCouple(int a, int b, int c){
  for (int i=0; i<12; i++) {
    for (int j=0; j<2; j++) {
      if(edgeCouples[i][j][0] == a && edgeCouples[i][j][1] == b && edgeCouples[i][j][2] == c){
        return edgeCouples[i][1-j];
      }
    }
  }
  return new int[]{-1,-1,-1};
}

int getColor(int[] c){
  return rubik_color[c[0]][c[1]][c[2]];
}

int[] findEdge(int colour1, int colour2) {  //return the coordinates of the edge block of colour1
  for (int i=0; i<12; i++) {
    for (int j=0; j<2; j++) {
      if (getColor(edgeCouples[i][j])==colour1 &&
        getColor(edgeCouples[i][1-j])==colour2) {
        return edgeCouples[i][j];
      }
    }
  }
  return new int[]{-1, -1, -1};
}