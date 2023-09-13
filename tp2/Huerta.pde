FBox huerta;
int tamXHuerta, tamYHuerta;
int vidaHuerta = 100;
PImage ImgHuerta;
void huerta() {
  ImgHuerta = loadImage ("huerta.png");
  tamXHuerta = width;
  tamYHuerta = height/8;
  huerta = new FBox(tamXHuerta, tamYHuerta);
  huerta.setStatic(true);
  huerta.setGrabbable(false);
  //huerta.attachImage(ImgHuerta);
  mundo.add(huerta);
}

void huertaDibujar() {
  huerta.setPosition(tamXHuerta/2, height - tamYHuerta/2); // Coloca la huerta en la parte inferior de la ventana
}
