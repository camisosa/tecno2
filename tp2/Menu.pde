int pantalla;
boolean jugando, perdio, gano;
void dibujarMenu () {
  if (pantalla == 0) {
    dibujarBoton(width/4, height/12, width/2, height/5, "Juego", 0);
    dibujarBoton(width/4, height/12, width/3, height/2, "Instrucciones", 1);
    dibujarBoton(width/4, height/12, width/2 + width/4, height/2, "Creditos", 2);
    pantalla(#e0e0e0, width/20, "GARDEN GUARDIAN", "" );
    iniciar();
  }
  if (pantalla == 1) {
    if (jugando) {
      image(fondo, 0, 0, width, height);
      dibujarGardenGuardian();
    } else {
      dibujarBoton(width/4, height/12, width/7, height/15, "Volver a Menu", 3);
      dibujarBoton(width/4, height/12, width/2, height/2, "Volver a jugar", 4);
    }
    if (perdio) {
      perdio();
      jugando = false;
    }
    if (gano) {
      gano();
      jugando = false;
    }
  }
  if (pantalla == 2) {
    pantalla(#64c3de, width/20, "INSTRUCCIONES", "Con la pala defiende la huerta de las calbazas que\nte esta lanzando la bruja, intenta derribarla devolviendole\nlas calabazas " );
    dibujarBoton(width/4, height/12, width/7, height/15, "Volver a Menu", 3);
  }
  if (pantalla == 3) {
    pantalla(#64c3de, width/20, "Creditos", "Con la pala defiende la huerta de las calbazas que\nte esta lanzando la bruja, intenta derribarla devolviendole\nlas calabazas " );
    dibujarBoton(width/4, height/12, width/7, height/15, "Volver a Menu", 3);
  }
}
