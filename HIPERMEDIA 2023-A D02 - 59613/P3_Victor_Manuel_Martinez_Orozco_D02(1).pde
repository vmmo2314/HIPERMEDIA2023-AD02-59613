void setup() {
  size(1000, 787);
  background(255, 255, 255);
  frameRate(165);
}
float x =0.9, y;
int i = 0;
void draw() {
    stroke(0,0,0);
    y =  height - (height  * cos( 2 * PI * x  / width));//Trazo diagonal
    x+=.2;
    point(2*x, y);
    
    if(i != height){ ///linea vertical
    i++;
    stroke(0,0,255);
    point(width/2,i);
    }
}  
