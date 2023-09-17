FMouseJoint cadena;
FCircle pala;
int tamPala;
PImage ImgPala;
void pala() {
  tamPala = width/20;
  ImgPala = loadImage ("pala.png");
  ImgPala.resize(tamPala*3, tamPala*3);
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
