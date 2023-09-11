class Pala {
  FMouseJoint cadena;
  FCircle pala;
  FWorld mundo;
  PImage imagenPala;
  int tamPala;
  Pala(FWorld mundo) {
    this.mundo = mundo;
    imagenPala = loadImage("pala.png");
    tamPala = width / 30;
    pala = new FCircle(tamPala);
    pala.setPosition(width / 2, height / 2);
    cadena = new FMouseJoint(pala, width / 2, height / 2);
  }
  void dibujar(int posX, int posY) {
    cadena.setTarget(posX, posY);
  }
  void quitarDelMundo() {
    mundo.remove(cadena);
    mundo.remove(pala);
  }
  void agregarAlMundo() {
    mundo.add(cadena);
    mundo.add(pala);
  }
}
