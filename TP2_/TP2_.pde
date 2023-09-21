import fisica.*;
import ddf.minim.*;

int PUERTO_OSC = 12345;

Receptor receptor;

Minim minim;
AudioPlayer durante, comer, roto, ganador, perdedor, inicio, risa, golpe;
FWorld mundo;

void setup() {
  size(1000, 700);
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  minim = new Minim (this);

  setupOSC(PUERTO_OSC);
  receptor = new Receptor();

  comer = minim.loadFile ("calabaza_come.mp3");
  roto = minim.loadFile ("calabaza_rota.mp3");
  ganador = minim.loadFile ("ganar.mp3");
  perdedor = minim.loadFile ("perder.mp3");
  durante = minim.loadFile ("Durante.mp3");
  inicio = minim.loadFile ("inicio.mp3");
  golpe = minim.loadFile ("golpe pala.mp3");
  GardenGuardian();
  menu();
}

void draw() {
  background(0);
  dibujarMenu();
  receptor.actualizar(mensajes); //
  receptor.dibujarBlobs(width, height);


  // Eventos de entrada y salida
  for (Blob b : receptor.blobs) {

    if (b.entro) {
      println("--> entro blob: " + b.id);
    }
    if (b.salio) {
      println("<-- salio blob: " + b.id);
    }
  }

  //println("cantidad de blobs: " + receptor.blobs.size());
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
