import fisica.*;
FWorld mundo;
Menu menu;
GardenGuardian juego;

void setup() {
  size(1000, 500);
  Fisica.init(this);
  mundo = new FWorld ();
  mundo.setEdges();
  //juego = new GardenGuardian (mundo);
  menu = new Menu ();
}

void draw() {
  background(0);
  //
  mundo.step();
  mundo.draw();
  menu.dibujar();
}



void mouseClicked() {
  menu.cambiarPantalla();
  //juego.sacarVida();println("Aumento" + juego.contador);println("Vida" + juego.bruja.vida);
  println("Pantalla" + menu.pantalla);
}

void keyPressed() {
  menu.reiniciar();
  println("presiono una tecla");
}
