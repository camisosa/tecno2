int tamXBoton, tamYBoton, posXBoton, posYBoton, tamfont;
String opcion_;
int opcionElegida;
boolean [] estaDentro = new boolean [5] ;
void dibujarBoton(int tamX, int tamY, int posX, int posY, int tamfont_, String opcion, int i) {
  pushMatrix();
  noStroke();
  textAlign(CENTER, CENTER);
  tamXBoton=tamX;
  tamYBoton= tamY;
  posXBoton = posX;
  posYBoton= posY;
  opcion_ = opcion;
  tamfont =tamfont_;
  color relleno;
  if (estaDentro[i]) {
    relleno = #dbd3d3;
  } else {
    relleno = #c46e6e;
  }
  textSize(tamfont);
  fill(relleno);
  rect(posXBoton - tamXBoton/2, posYBoton -tamYBoton/2, tamXBoton, tamYBoton);
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
