//facing the top pattern to front
void facing_top() {
  int[][][] temp = new int[6][3][3];
  for (int k=0; k<=5; k++) {
    for (int i=0; i<=2; i++) {
      for (int j=0; j<=2; j++) {
        temp[k][i][j]=rubik_color[k][i][j];
      }
    }
  }

  //facing-------
  for (int i=0; i<=2; i++) {
    for (int j=0; j<=2; j++) {
      rubik_color[2][i][j]= temp[0][i][j]; //top to front
      rubik_color[1][i][j]= temp[1][2-j][i];// left rotate CW
      rubik_color[3][i][j]= temp[3][j][2-i];// right rotate ACW
      rubik_color[5][i][j]= temp[2][i][j];//front to bottom
      rubik_color[0][i][j]= temp[4][2-i][2-j];//back to top
      rubik_color[4][i][j]= temp[5][2-i][2-j];//bottom to back
    }
  }
  update_box();
}

//facing the bottom pattern to front
void facing_bottom() {
  for (int i=0; i<=2; i++) facing_top();
  update_box();
}

//facing the left pattern to front
void facing_right() {
  int[][][] temp = new int[6][3][3];
  for (int k=0; k<=5; k++)
    for (int i=0; i<=2; i++) {
      for (int j=0; j<=2; j++) {
        temp[k][i][j]=rubik_color[k][i][j];
      }
    }

  //facing-------
  for (int i=0; i<=2; i++) {
    for (int j=0; j<=2; j++) {
      rubik_color[1][i][j]= temp[2][i][j]; //front to left
      rubik_color[2][i][j]= temp[3][i][j]; //right to front
      rubik_color[3][i][j]= temp[4][i][j]; //back to right
      rubik_color[4][i][j]= temp[1][i][j]; //left to back
      rubik_color[0][i][j]= temp[0][2-j][i];// top rotate CW
      rubik_color[5][i][j]= temp[5][j][2-i];// bottom rotate ACW
    }
  }
  update_box();
}

//facing the right pattern to front
void facing_left() {
  for (int i=0; i<=2; i++) facing_right();
  update_box();
}

//facing the back pattern to front
void facing_back() {
  for (int i=0; i<2; i++) facing_top();
  update_box();
}