class Menu {
  int pantalla;
  Pantalla[] pantallas;
  GardenGuardian juego;
  FWorld mundo; // Debes definir la variable mundo

  Menu() {
    pantallas = new Pantalla[4];
    for (int i = 0; i < pantallas.length; i++) {
      pantallas[i] = new Pantalla();
    }
  }

  void dibujar() {
    if (pantalla == 0) {
      pantallas[0].dibujar("Garden Guardian", "!No dejes que la bruja destruya tu huerta!");
    }
    if (pantalla == 1) {
      pantallas[1].dibujar("PERDISTE", "!La bruja ha destruido toda la huerta!");
    }
    if (pantalla == 2) {
      pantallas[2].dibujar("Ganaste", "!Has conseguido derribar a la bruja y salvar la huerta!");
    }
    if (pantalla == 3) {
      // Debes inicializar el juego aquí, una vez que pantalla sea 3
      if (juego == null) {
        juego = new GardenGuardian(mundo);
      }
      juego.iniciarJuego();
      juego.dibujar();
    }
  }

  void cambiarPantalla() {
    pantalla++;
    if (pantalla == 4) {
      pantalla = 0;
    }
  }
  void reiniciar() {
    if (pantalla == 3) {
      juego.reiniciar();
    }
  }
}
