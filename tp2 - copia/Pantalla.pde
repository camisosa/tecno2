class Pantalla {
  int posX1;
  int posY1;
  int posX2;
  int posY2;
  color colorDeLetra1;
  color colorDeLetra2;
  int tamFuenteTitulos;
  int tamFuenteSubitulos;
  Pantalla() {
    posX1 = width/2;
    posY1 = height/3;
    posX2 = width/2;
    posY2 = height/2;
    colorDeLetra1 = #dedcdc;
    colorDeLetra2 = #db3232;
    tamFuenteTitulos = width/20;
    tamFuenteSubitulos = width/50;
  }
  void dibujar( String texto1, String texto2) {
    fill(colorDeLetra1);
    textAlign(CENTER, CENTER);
    textSize(tamFuenteTitulos);
    text(texto1, posX1, posY1);
    fill(colorDeLetra2);
    textSize(tamFuenteSubitulos);
    text(texto2, posX2, posY2);
  }
}
