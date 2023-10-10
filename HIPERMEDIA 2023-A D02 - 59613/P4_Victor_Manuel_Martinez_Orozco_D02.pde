PImage img, img2, piedra, simbolo, menos;

boolean bucle = false, on = true, lanzar = false;


//////Falta corregir algunos aspectos pero como boceto o primera edicion del trabajo,  es funcional.


void setup() {
  size(1280, 720);
  background(255);
  img = loadImage("fondo.png");
  img2 = loadImage("sujeto.png");
  piedra = loadImage("pedra.png");
  simbolo = loadImage("simbolomas.png");
  menos = loadImage("menos.png");
  frameRate(160);
}

int largo = 80;
int ancho = 25;

float ejeX = 2.0, ejeAux; //variable con la que se operará el aumento en el eje X de la parábola.
float x = 0.9, y;
int i = 0;
int movimientoLR = 0;

void draw() {
  image(img, 0, 0, width, height);

  stroke(0, 0, 0);
  y =  height - (height  * cos( 2 * PI * x  / width));//Trazo principal
  x+=2.0 + random(5);
  strokeWeight(10);
  //point(2.0*x, y);
  strokeWeight(5);
  stroke(5, 50, 150);
  ejeAux = ejeX*x;
  if (lanzar == true) {
    image(piedra, ejeAux, y, 80, 80);
  }
  stroke(0, 0, 0);
  strokeWeight(1);

  ///figuras
  //simobo +
  fill(0, 0, 255);
  rect( -200 + width, - 700 + height, largo, ancho); //eje x, eje y, altura, anchura
  image(simbolo, -170 + width, - 700 + height, ancho, ancho);

  //simbolo -
  rect(-300 + width, - 700 + height, largo, ancho); //eje x, eje y, altura, anchura
  fill(0, 0, 255);
  image(menos, -285 + width, - 710 + height, ancho*2, ancho*2);

  //figura pause/start
  rect(-300 + width, - 650 + height, largo *2 + ancho, ancho); //eje x, eje y, altura, anchura
  textSize(16); // define el tamaño del texto
  fill(0); // define el color del texto
  text("Pause/start", -250 + width, - 630 + height);

  //figura lanzar
  fill(0, 0, 255);
  rect(-300 + width, - 600 + height, largo *2 + ancho, ancho); //eje x, eje y, altura, anchura
  textSize(16); // define el tamaño del texto
  fill(0); // define el color del texto
  text("Lanzar", -245 + width, - 580 + height);
  
  //line(-300 + width, - 650 + height, -300 + width + largo *2 + ancho, - 650 + height + ancho); ///Linea para ver cuánto del eje X abarca el detectar botón de stop y start

  image(img2, movimientoLR, -200+height, 200, 200);

  if (movimientoLR <=  width && on == true) {
    movimientoLR+= width/height + random(55);
    if (movimientoLR > width) {
      on = false;
    }
  } else {
    movimientoLR-= width/height + random(55);
  }


  if (y >= height) {          ///condicional para resetear el juego automáticamente
    movimientoLR = 0;
    resetear();
  }
}

void mousePressed() {
  if ((mouseX >=  -200 + width) && (mouseX <= -200 + width + largo) &&                    ///Boton derecho de aumento
    (mouseY >= - 700 + height) && (mouseY <= - 700 + height + ancho)) {
    resetearSindatos();
    ejeX += .5;
    if (ejeX == width)
      ejeX = 0;
  }

  if ((mouseX >=  -300 + width) && (mouseX <= -300 + width + largo) &&            ///Botón izquierdo de disminuir
    (mouseY >= - 700 + height) && (mouseY <= - 700 + height + ancho)) {
    resetearSindatos();
    ejeX -= .5;
  }

  if ((mouseX >=  -300 + width) && (mouseX <= -300 + width + largo *2 + ancho) &&            ///Botón stop y start
    (mouseY >= - 650 + height) && (mouseY <=- 650 + height + ancho)) {
    if (!bucle) {
      noLoop();
      bucle = true;
    } else {
      loop();
      bucle = false;
    }
  }

  if ((mouseX >=  -300 + width) && (mouseX <= -300 + width + largo *2 + ancho) &&            ///Botón stop y start
    (mouseY >= - 600 + height) && (mouseY <=- 600 + height + ancho)) {
    x =0.9;
    y =  height - (height  * cos( 2 * PI * x  / width));//Trazo principal redibujado
    background(255, 255, 255);
    lanzar = true;
  }
}

void resetear() {
  ejeX = 2.0; //variable con la que se operará el aumento en el eje X de la parábola.
  x =0.9;
  y =  height - (height  * cos( 2 * PI * x  / width));//Trazo principal redibujado
  background(255, 255, 255);
  on=true;
  lanzar = false;
}

void resetearSindatos() {
  //ejeX = 2.0; //variable con la que se operará el aumento en el eje X de la parábola.
  movimientoLR = 0;
  x =0.9;
  y =  height - (height  * cos( 2 * PI * x  / width));//Trazo principal redibujado
  background(255, 255, 255);
  on=true;
  lanzar = false;
}
