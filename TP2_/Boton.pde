int tamXBoton, tamYBoton, posXBoton, posYBoton, tamfont;
String opcion_;
int opcionElegida;
boolean [] estaDentro = new boolean [5] ;
PImage Boton;

void dibujarBoton(int tamX, int tamY, int posX, int posY, int tamfont_, String opcion, int i) {
  Boton = loadImage("boton.png");
  pushMatrix();
  noStroke();
  textAlign(CENTER, CENTER);
  tamXBoton=tamX;
  tamYBoton= tamY;
  posXBoton = posX;
  posYBoton= posY;
  opcion_ = opcion;
  tamfont =tamfont_;
  
  image(Boton, posXBoton - tamXBoton/2, posYBoton - tamYBoton/2, tamXBoton, tamYBoton);
  textSize(tamfont);
  fill(255);
  text(opcion, posXBoton, posYBoton);
  verificarSiEstaDentro(i);
  popMatrix();
}
void verificarSiEstaDentro(int i) {
  if (mouseX > posXBoton-tamXBoton/2 && mouseX < posXBoton+tamXBoton/2 && mouseY > posYBoton-tamYBoton/2 && mouseY < posYBoton+tamYBoton/2) {
    estaDentro[i] = true;
  } else {
    estaDentro[i] = false;
  }
}
