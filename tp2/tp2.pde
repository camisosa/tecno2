import fisica.*;
import processing.sound.*;
SoundFile moveAliens, deaAliens, disparoSong, deadNave, winSong, songMenu;


FWorld mundo;

void setup() {
  //fullScreen();
  size(700, 500);
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  GardenGuardian();
}

void draw() {
  background(0);
  dibujarMenu();
}

void mouseClicked() {
  if (pantalla == 0) {
    if (estaDentro[0]) {
      pantalla = 1;
      jugando = true;
    }
    if (estaDentro[1]) {
      pantalla = 2;
    }
    if (estaDentro[2]) {
      pantalla = 3;
    }
  } else if (pantalla != 0 && estaDentro [1] || estaDentro [2] || estaDentro [3]) {
    pantalla = 0;
  }
  if ( pantalla == 1 && estaDentro [4]) {
    jugando = true;
    iniciar();
  }
}
