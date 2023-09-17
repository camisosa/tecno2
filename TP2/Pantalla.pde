void pantalla(color colorDeLetra, int tamFuente1, String texto1, String texto2 ) {
  pushMatrix();  
  textAlign(CENTER, CENTER);
  fill(colorDeLetra);
  textSize(tamFuente1);
  text(texto1, width / 2, height / 2 - 150);
  textSize(width/30);
  text(texto2, width / 2, height / 2);
  popMatrix();
}
