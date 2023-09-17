//https://youtu.be/W5cK4gVgBrI
import fisica.*;
import ddf.minim.*;
//import oscP5.*;
Minim minim;
AudioPlayer durante, comer, roto, ganador, perdedor, inicio, risa;
//OscP5 oscP5;
FWorld mundo;

void setup() {
  //fullScreen();
  size(1000, 700);
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  minim = new Minim (this);
  /*
   risa = minim.loadFile ("risa_bruja.mp3");
   */
  comer = minim.loadFile ("calabaza_come.mp3");
  roto = minim.loadFile ("calabaza_rota.mp3");
  ganador = minim.loadFile ("ganar.mp3");
  perdedor = minim.loadFile ("perder.mp3");
  durante = minim.loadFile ("durante.mp3");
  inicio = minim.loadFile ("inicio.mp3");
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
  if ( pantalla == 1 && estaDentro [4] && jugando == false) {
    jugando = true;
    iniciar();
  }
}
