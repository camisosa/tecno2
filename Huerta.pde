FBox huerta;
int tamXHuerta, tamYHuerta;
int vidaHuerta = 100;
int totalDeImagenesDeLaHuerta = 4;
PImage [] ImgHuerta = new PImage [totalDeImagenesDeLaHuerta];
void huerta() {
  tamXHuerta = width;
  tamYHuerta = height/8;
  for (int i = 0; i < totalDeImagenesDeLaHuerta; i++ ) {
    ImgHuerta [i] = loadImage ("huerta ("+i+").png");
    ImgHuerta [i].resize(tamXHuerta, tamYHuerta*2);
  }
  huerta = new FBox(tamXHuerta, tamYHuerta);
  huerta.setStatic(true);
  huerta.setGrabbable(false);
  mundo.add(huerta);
}

void huertaDibujar() {
  imagenDeLaHuerta();
  huerta.setPosition(tamXHuerta/2, height - tamYHuerta/2); // Coloca la huerta en la parte inferior de la ventana
}
void imagenDeLaHuerta() {
  int imagenActual = round(map(vidaHuerta, 0, 100, totalDeImagenesDeLaHuerta-1, 0));
  println(imagenActual);
  image(ImgHuerta[imagenActual], width - tamXHuerta, height - tamYHuerta*2);
}
