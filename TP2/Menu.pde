int pantalla;
boolean jugando, perdio, gano;
void dibujarMenu () {
  if (pantalla == 0) {
    dibujarBoton(width/4, height/12, width/2, height/2 - width/10, width/30, "Play", 0);
    dibujarBoton(width/4, height/12, width/2, height/2, width/30, "Instrucciones", 1);
    dibujarBoton(width/4, height/12, width/2, height /2 + width/10, width/30, "Creditos", 2);
    textSize(width/12);
    text("GARDEN GUARDIAN", width / 2, height / 2 -  width /5);
    iniciar();
    durante.pause(); // SONIDO
  }
  if (pantalla == 1) {
    if (jugando) {
      dibujarGardenGuardian();
    }
    if (perdio) {
      perdio();
      dibujarBoton(width/5, height/12, width/2, height/2 + width/8, width/50, "Volver a jugar", 4);
      durante.pause();
    }
    if (gano) {
      gano();
      dibujarBoton(width/5, height/12, width/2, height/2 + width/8, width/50, "Volver a jugar", 4);
      durante.pause();
    }
    dibujarBoton(width/8, height/18, width/12, height/18, width/60, "Volver a Menu", 3);
  }
  if (pantalla ==2) {
    pantalla(#64c3de, width/20, "INSTRUCCIONES", "Con la pala defiende la huerta de las calbazas que\nte esta lanzando la bruja, intenta derribarla devolviendole\nlas calabazas " );
    dibujarBoton(width/8, height/18, width/12, height/18, width/60, "Volver a Menu", 3);
  }
  if (pantalla == 3) {
    pantalla(#64c3de, width/20, "Creditos", "Sosa Camila Programacion\nCorbalan Agostina Programacion\nAlonso Mayra Sonido\nRodas Juan Ilustraciones" );
    dibujarBoton(width/8, height/18, width/12, height/18, width/60, "Volver a Menu", 3);
  }
}
