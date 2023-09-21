FBox fondo;
PImage ImgFondo;
void fondo() {
  ImgFondo  = loadImage ("fondo.jpg");
  ImgFondo.resize(width, height);
  fondo = new FBox(width, height);
  fondo.setStatic(true);
  fondo.setGrabbable(false);
  fondo.attachImage(ImgFondo);
  mundo.add(fondo);
}
void fondoDibujar() {
  fondo.setPosition(width/2, height/2); // Coloca la huerta en la parte inferior de la ventana
}
