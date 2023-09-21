PImage fondoGanar, fondoPerder, barraBruja, barraHuerta;

void GardenGuardian() {
  calabazas = new FCircle [cantCalabazas];
  fondo();
  calabaza();
  bruja();
  huerta();
  pala();
  fondoGanar = loadImage ("fondoGanar.jpg");
  fondoGanar.resize(width, height);

  fondoPerder = loadImage ("fondoPerder.jpg");
  fondoPerder.resize(width, height);

  barraBruja = loadImage ("barraBruja-1.png");
  barraHuerta = loadImage ("barraHuerta-1.png");
}

void dibujarPantallaGanar() {
  image(fondoGanar, 0, 0);
}

void dibujarPantallaPerder() {
  image(fondoPerder, 0, 0);
}

void dibujarGardenGuardian() {
  mundo.step();
  mundo.draw();
  fondoDibujar();
  dibujarBruja();
  huertaDibujar();
  dibujarCalabazas();
  dibujarPala();
  barraDeVida(vidaHuerta, tamXHuerta/2, height - tamYHuerta/3, tamXHuerta/4, tamYHuerta/4);
  barraDeVida(vidaBruja, posXBruja, posYBruja - tamBruja/2 - 30, tamBruja, tamBruja/6);
  aumentarDificultad();
  durante.play();// SONIDO
  inicio.pause();
  perdedor.pause();
  ganador.pause();
  
  if (vidaHuerta <= 0) {
    perdio = true ;
    jugando = false;
    perdedor.play();
  }
  if (vidaBruja <= 0) {
    gano = true;
    jugando = false;
    ganador.play();
  }
  
}

void contactStarted(FContact contact) {
  FBody body1 = contact.getBody1();//Cuerpo 1 dentro del mundo de fisica (puede ser la huerta, la calabaza o la bruja)
  FBody body2 = contact.getBody2();//Cuerpo 2 dentro del mundo de fisica (puede ser la huerta, la calabaza o la bruja)

  for (int i = 0; i < cantCalabazas; i++) { //El maximo de i es el maximo de calabazas
    if ((body1 == bruja && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == bruja)) {
      // Si hay colisión entre la bruja y una calabaza
      vidaBruja-=10;
      mundo.remove(calabazas[i]);  // Elimina la calabaza que tocó a la bruja
      calabazas[i] = null;  // Marca el espacio en el arreglo como disponible
      calabazaTocoALaBruja = true;
      if (!roto.isPlaying()) { // Reproduce el sonido solo si no se está reproduciendo
        roto.rewind(); // Reinicia el sonido para reproducir desde el principio
        roto.play();
      }
      break;  // Sale del bucle una vez que se finaliza la colisión
    }
    // Verifica colisiones entre la huerta y las calabazas
    if ((body1 == huerta && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == huerta)) {
      // Si hay colisión entre la huerta y una calabaza
      vidaHuerta-=2;
      if (!comer.isPlaying()) { // Reproduce el sonido solo si no se está reproduciendo
        comer.rewind(); // Reinicia el sonido para reproducir desde el principio
        comer.play();
      }
      break;  // Sale del bucle una vez que se finaliza la colisión
    }
  }
}

void aumentarDificultad() {
  if (vidaBruja == 70) {
    velocidad = 2;
    tiempolimite = 3;
  }
  if (vidaBruja  == 50) {
    velocidad = 2;
    tiempolimite = 3;
  }
  if (vidaBruja  == 20) {
    velocidad = 4;
    tiempolimite = 1;
  }
}
void barraDeVida(int vida, int posX, int posY, int tamX, int tamY) {
  int tamX_ = tamX;
  int tamY_ = tamY;
  int posX_ = posX - tamX_ / 2;
  int posY_ = posY - tamY_ / 2;

  // Dibuja el fondo de la barra de vida
  fill(200);
  rect(posX_, posY_, tamX, tamY);

  // Dibuja la barra de vida actual
  float porcentajeDeVida = map(vida, 0, 100, 0, tamX);
  fill(0, 255, 0);
  rect(posX_, posY_, porcentajeDeVida, tamY);

  // Dibuja la imagen de la barra de vida
  if (vida == vidaBruja) {
    image(barraBruja, posX_, posY_, tamX, tamY);
  } else if (vida == vidaHuerta) {
    image(barraHuerta, posX_, posY_, tamX, tamY);
  }
}

void perdio() {
  dibujarPantallaPerder();
  pantallaDibujar(#d10f15, width/10, "PERDISTE", "La loca de la escoba rompio toda la huertita :(" );
}

void gano() {
  dibujarPantallaGanar();
  pantallaDibujar(#320fd1, width/10, "GANASTE", "Mataste a la loca de la escoba" );
}

void iniciar() {
  inicio.play(); // SONIDO
  vidaHuerta = 100;
  vidaBruja = 100;
  tiempolimite = 4;
  posXBruja = width/2;
  calabazaTocoALaBruja = false;
  velocidad =1;
  dibujarBruja();
  dibujarCalabazas();
  dibujarPala();
  for (int i = 0; i < calabazas.length; i++) {
    if (calabazas[i] != null) {
      mundo.remove(calabazas[i]);
      calabazas[i] = null;
    }
  }
  perdio = false ;
  gano = false ;
}
