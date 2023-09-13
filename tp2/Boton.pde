int tamXBoton, tamYBoton, posXBoton, posYBoton;
String opcion_;
int opcionElegida;
boolean [] estaDentro = new boolean [5] ;
void dibujarBoton(int tamX, int tamY, int posX, int posY, String opcion, int i) {
  tamXBoton=tamX;
  tamYBoton= tamY;
  posXBoton = posX;
  posYBoton= posY;
  opcion_ = opcion;
  color relleno;
  if (estaDentro[i]) {
    relleno = #dbd3d3;
  } else {
    relleno = #c46e6e;
  }
  fill(relleno);
  rect(posXBoton - tamXBoton/2, posYBoton -tamYBoton/2, tamXBoton, tamYBoton);
  fill(255);
  text(opcion, posXBoton, posYBoton);
  verificarSiEstaDentro(i);
}
void verificarSiEstaDentro(int i) {
  if (mouseX > posXBoton-tamXBoton/2 && mouseX < posXBoton+tamXBoton/2 && mouseY > posYBoton-tamYBoton/2 && mouseY < posYBoton+tamYBoton/2) {
    estaDentro[i] = true;
  } else {
    estaDentro[i] = false;
  }
}
