FMouseJoint cadena;
FCircle pala;
int tamPala;
PImage ImgPala;
void pala() {
  ImgPala = loadImage ("pala.png");
  tamPala = width/30;
  pala = new FCircle(tamPala);
  pala.setPosition(width / 2, height / 2);
  pala.attachImage(ImgPala);
  mundo.add(pala);
  cadena = new FMouseJoint(pala, width / 2, height / 2);// Crea una cadena para la pala
  mundo.add(cadena);
}

void dibujarPala() {
  cadena.setTarget(mouseX, mouseY);
}
