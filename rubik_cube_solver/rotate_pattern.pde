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

// rotate the bottom pattern anti-clockwise
void D_ACW() {
  facing_bottom();
  F_ACW();
  facing_top();
  update_box();
}

// rotate the bottom pattern clockwise
void B_CW() {
  facing_back();
  F_CW();
  facing_back();
  update_box();
}

// rotate the bottom pattern anti-clockwise
void B_ACW() {
  facing_back();
  F_ACW();
  facing_back();
  update_box();
}

void do_formula(String formula) {
  String step[] = formula.split(" ");
  for (int i=0; i<step.length; i++) {
    switch(step[i].charAt(0)) {
    case 'L':
      if (step[i].length()==1) {//which mean "L"
        L_CW();
      } else if (step[i].charAt(1)=='\'') {//which mean "L'"
        L_ACW();
      } else if (step[i].charAt(1)=='2') {//which mean "L2"
        L_CW();
        L_CW();
      }
      break;
    case 'R':
      if (step[i].length()==1) {//which mean "R"
        R_CW();
      } else if (step[i].charAt(1)=='\'') {//which mean "R'"
        R_ACW();
      } else if (step[i].charAt(1)=='2') {//which mean "R2"
        R_CW();
        R_CW();
      }
      break;
    case 'U':
      if (step[i].length()==1) {//which mean "U"
        U_CW();
      } else if (step[i].charAt(1)=='\'') {//which mean "U'"
        U_ACW();
      } else if (step[i].charAt(1)=='2') {//which mean "U2"
        U_CW();
        U_CW();
      }
      break;
    case 'D':
      if (step[i].length()==1) {//which mean "D"
        D_CW();
      } else if (step[i].charAt(1)=='\'') {//which mean "D'"
        D_ACW();
      } else if (step[i].charAt(1)=='2') {//which mean "D2"
        D_CW();
        D_CW();
      }
      break;
    case 'F':
      if (step[i].length()==1) {//which mean "F"
        F_CW();
      } else if (step[i].charAt(1)=='\'') {//which mean "F'"
        F_ACW();
      } else if (step[i].charAt(1)=='2') {//which mean "F2"
        F_CW();
        F_CW();
      }
      break;
    case 'B':
     if (step[i].length()==1) {//which mean "B"
       B_CW();
     } else if (step[i].charAt(1)=='\'') {//which mean "B'"
       B_ACW();
     } else if (step[i].charAt(1)=='2') {//which mean "B2"
       B_CW();
       B_CW();
     }
     break;
    default:
      break;
    }
  }
}