// rotate the front pattern clockwise
void F_CW() {
  int[][][] temp = new int[6][3][3];
  for (int k=0; k<=5; k++)
    for (int i=0; i<=2; i++) {
      for (int j=0; j<=2; j++) {
        temp[k][i][j]=rubik_color[k][i][j];
      }
    } 
  //front rotate--------------
  for (int i=0; i<=2; i++) {
    for (int j=0; j<=2; j++) {
      rubik_color[2][i][j]= temp[2][2-j][i];
    }
  }
  //side regulate-------------
  for (int j=0; j<=2; j++) {
    rubik_color[1][j][2]= temp[5][0][j];  //bottom
    rubik_color[3][j][0]= temp[0][2][j];  //top
    rubik_color[5][0][2-j]= temp[3][j][0];  //right
    rubik_color[0][2][2-j]= temp[1][j][2];  //left
  }
  update_box();
}

// rotate the front pattern anti-clockwise
void F_ACW() {
  for (int i=0; i<=2; i++) F_CW();
  update_box();
}

// rotate the left pattern clockwise
void L_CW() {
  facing_left();
  F_CW();
  facing_right();
  update_box();
}

// rotate the left pattern anti-clockwise
void L_ACW() {
  facing_left();
  F_ACW();
  facing_right();
  update_box();
}

// rotate the right pattern clockwise
void R_CW() {
  facing_right();
  F_CW();
  facing_left();
  update_box();
}

// rotate the right pattern anti-clockwise
void R_ACW() {
  facing_right();
  F_ACW();
  facing_left();
  update_box();
}

// rotate the top pattern clockwise
void U_CW() {
  facing_top();
  F_CW();
  facing_bottom();
  update_box();
}

// rotate the top pattern anti-clockwise
void U_ACW() {
  facing_top();
  F_ACW();
  facing_bottom();
  update_box();
}

// rotate the bottom pattern clockwise
void D_CW() {
  facing_bottom();
  F_CW();
  facing_top();
  update_box();
}

// rotate the top pattern anti-clockwise
void D_ACW() {
  facing_bottom();
  F_ACW();
  facing_top();
  update_box();
}