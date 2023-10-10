void setup() {
  size( 653, 800);
  background(0,0,0);
  stroke(255, 255, 255);
}

void draw(){
 int y = 0;
 int x;

  for (x = 0; x <= width; x++) {
    y = height * x / width;
    point(x, y);
    point(width - x, y);
  }

 }

/*
do{
 x = 0; y = 0;
 dif = dif + 1/2;
 while(x <= width){
   point(x, y);
   x = x + dif * dif; 
   y = y + dif;
 }
}while(dif == 0);
stop();
*/

/*
  if(width == height){
     while(x != width){
       point(x++, y++);
       }
    stop();
    return;
    }
 
 int dif = width / height; 
 while(x <= width){
 point(x, y);
 point(x+dif, y+dif);
 x = x + dif * dif; y = y + dif;
*/
