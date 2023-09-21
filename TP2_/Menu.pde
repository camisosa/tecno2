int pantalla;
boolean jugando, perdio, gano;
PImage fondoCreditos, fondoInstrucciones, fondoInicio;

void menu(){
  fondoCreditos = loadImage ("fondoCreditos.jpg");
  fondoCreditos.resize(width, height);
    
  fondoInstrucciones = loadImage ("fondoInstrucciones.jpg");
  fondoInstrucciones.resize(width, height);
  
  fondoInicio = loadImage ("fondoInicio.jpg");
  fondoInicio.resize(width, height);
}
void dibujarMenu () {
    
  if (pantalla == 0) {
    dibujarPantallaInicio();
    dibujarBoton(width/3, height/10, width/2, height/2 - width/10, width/30, "Play", 0);
    dibujarBoton(width/3, height/10, width/2, height/2, width/30, "Instrucciones", 1);
    dibujarBoton(width/3, height/10, width/2, height /2 + width/10, width/30, "Creditos", 2);
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
    dibujarBoton(width/6, height/15, width/12, height/18, width/60, "Volver a Menu", 3);
  }
  if (pantalla ==2) {
    dibujarPantallaInstrucciones();
    pantallaDibujar(#ffffff, width/22, "INSTRUCCIONES", "Con la pala defiende la huerta de las calabazas \nque te esta lanzando la bruja, intenta derribarla \ndevolviendole las calabazas." );
    dibujarBoton(width/6, height/15, width/12, height/18, width/60, "Volver a Menu", 3);
  }
  if (pantalla == 3) {
    dibujarPantallaCreditos();
    pantallaDibujar(#ffffff, width/22, "Creditos", "Sosa Camila - Programación\nCorbalan Agostina - Programación\nAlonso Mayra - Sonido\nRodas Juan - Ilustración" );
    dibujarBoton(width/6, height/15, width/12, height/18, width/60, "Volver a Menu", 3);
  }
}


void dibujarPantallaCreditos() {
  image(fondoCreditos, 0, 0);
}

void dibujarPantallaInstrucciones() {
  image(fondoInstrucciones, 0, 0);
}

void dibujarPantallaInicio() {
  image(fondoInicio, 0, 0);
}
