int box_size=80;
// 0-white, 1-yellow, 2-orange, 3- red, 4-green, 5-blue
final int W=0,Y=1,O=2,R=3,G=4,B=5;
color fill_color[] ={#ffffff, #ffff00, #FF7F00, #ff0000, #02A500, #2C9EFF}; 

int rubik_color[][][]={{{5,3,1}, {2,2,2}, {3,2,0}}, 
  {{2,0,0}, {3,5,3}, {2,5,1}}, 
  {{4,5,5}, {4,1,4}, {3,4,0}}, 
  {{2,4,3}, {1,4,1}, {5,1,2}}, 
  {{4,0,1}, {5,0,1}, {0,5,1}}, 
  {{5,0,3}, {3,3,2}, {4,0,4}}};

final int base_color = rubik_color[0][1][1];
final int sides[] = {1,2,3,4};
final int top_color = rubik_color[5][1][1];
/*int rubik_color[][][]={{{0, 0, 0}, {0, 0, 0}, {0, 0, 0}}, 
 {{1, 1, 1}, {1, 1, 1}, {1, 1, 1}}, 
 {{2, 2, 2}, {2, 2, 2}, {2, 2, 2}}, 
 {{3, 3, 3}, {3, 3, 3}, {3, 3, 3}}, 
 {{4, 4, 4}, {4, 4, 4}, {4, 4, 4}}, 
 {{5, 5, 5}, {5, 5, 5}, {5, 5, 5}}};*/

void setup() {
  size(960, 720); 
  pixelDensity(2);
  update_box();
}

void draw() {
}

void keyPressed() {
  if (key == ' ') {
    top_cross();
    //print_data(rubik_color);
  }
  switch(key){
    case 'L':
    case 'R':
    case 'U':
    case 'D':
    case 'F':
    case 'B':
      do_formula(key+"");
      break;
    case 'l':
    case 'r':
    case 'u':
    case 'd':
    case 'f':
    case 'b':
      do_formula((key+"'").toUpperCase());
      break;
  }
  
}

void print_data(int _rubik_color[][][]) {
  for (int k=0; k<=5; k++){
    for (int i=0; i<=2; i++) {
      for (int j=0; j<=2; j++) {
        print(_rubik_color[k][i][j]);
        print(',');
      }
      println();
    }
    println();
  }
}