FCircle bruja;
int vidaBruja = 100;
int posXBruja, posYBruja, tamBruja;
int velocidad = 1;
boolean cambioDeDireccion = true;
PImage brujaDerecha, brujaIzquierda;

void bruja() {
  brujaDerecha = loadImage ("brujaDerecha.png");
  brujaIzquierda = loadImage ("brujaIzquierda.png");  
  posXBruja = width/2;
  posYBruja = height/7;
  tamBruja = width/10;
  bruja = new FCircle(tamBruja);
  bruja.setStatic(true);
  bruja.setGrabbable(false);
  mundo.add(bruja);
}
void dibujarBruja() {
  bruja.setPosition(posXBruja, posYBruja);
  rebote();
}
void rebote() {
  if (posXBruja + tamBruja / 2 > width || posXBruja - tamBruja / 2  < 0) {
    cambioDeDireccion = !cambioDeDireccion;
  }
  if (cambioDeDireccion) {
    posXBruja += velocidad;    
  bruja.attachImage(brujaDerecha);
  } else {
    posXBruja -= velocidad;
  bruja.attachImage(brujaIzquierda);
  }
}
