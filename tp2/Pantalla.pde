void pantalla(color colorDeLetra, int tamFuente1, String texto1, String texto2 ) {
  fill(colorDeLetra);
  textSize(tamFuente1);
  textAlign(CENTER, CENTER);
  text(texto1, width / 2, height / 2 - 50);
  textSize(20);
  text(texto2, width / 2, height / 2 + 50);
}
