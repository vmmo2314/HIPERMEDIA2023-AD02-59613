void setup() {
  size(600, 400);
  background(100,100,255);
}
float randNum(){
float x;
return x=random(255);
}
void draw(){
 int x=0, y=10, x2=10, y2=10, tope=0; 
  do{
    for(;x<=width-x2; x++)
    point(x,y);
    stroke(randNum(), randNum(), randNum());
    for(;y<=height-y2; y++)
    point(x,y);
    stroke(randNum(), randNum(), randNum());
    for(;x>=x2; x--)
    point(x,y);
    x2=x2+10; y2=y2+10; tope=tope+10;
    for(;y>=y2; y--)
    point(x,y);
    stroke(randNum(),randNum(), randNum());
   }while(tope<=200);
}
