import fisica.*;
class Huerta {
  FBox huerta;
  int vida;
  int tamX;
  int tamY;
  FWorld mundo;
  Huerta(FWorld mundo) {
    this.mundo = mundo;
    vida = 100;
    tamX = width;
    tamY = height/9;
    huerta = new FBox(tamX, tamY);
    huerta.setStatic(true);
    huerta.setGrabbable(false);
    huerta.setPosition(tamX/2, height-tamY/2);
    mundo.add(huerta);
  }
  void dibujar() {
  }
}
