PImage fondo;
void GardenGuardian() {
  fondo = loadImage("fondo cielo.jpg");  
  calabazas = new FCircle [100];
  bruja();
  huerta();
  pala();
}

void dibujarGardenGuardian() {
  mundo.step();
  mundo.draw();
  dibujarBruja();
  dibujarCalabazas();
  huertaDibujar();
  image(ImgHuerta, 1/40, 2/45, tamXHuerta, tamYHuerta*8);
  dibujarPala();
  barraDeVida(vidaHuerta, tamXHuerta/2, height - tamYHuerta/3, tamXHuerta/2, tamYHuerta/4);
  barraDeVida(vidaBruja, posXBruja, posYBruja - tamBruja/2 - 10, tamBruja, tamBruja/6);
  aumentarDificultad();
  if (vidaHuerta <= 0) {
    perdio = true ;
  }
  if (vidaBruja <= 0) {
    gano = true;
  }
}

void contactStarted(FContact contact) {
  FBody body1 = contact.getBody1();//Cuerpo 1 dentro del mundo de fisica (puede ser la huerta, la calabaza o la bruja)
  FBody body2 = contact.getBody2();//Cuerpo 2 dentro del mundo de fisica (puede ser la huerta, la calabaza o la bruja)

  for (int i = 0; i < calabazas.length; i++) { //El maximo de i es el maximo de calabazas
    if ((body1 == bruja && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == bruja)) {
      // Si hay colisión entre la bruja y una calabaza
      vidaBruja = vidaBruja - 10;
      mundo.remove(calabazas[i]);  // Elimina la calabaza que tocó a la bruja
      calabazas[i] = null;  // Marca el espacio en el arreglo como disponible
      break;  // Sale del bucle una vez que se finaliza la colisión
    }
    // Verifica colisiones entre la huerta y las calabazas
    if ((body1 == huerta && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == huerta)) {
      // Si hay colisión entre la huerta y una calabaza
      vidaHuerta = vidaHuerta - 1;
      break;  // Sale del bucle una vez que se finaliza la colisión
    }
  }
}

void aumentarDificultad() {
  if (vidaBruja == 70) {
    velocidad = 2;
    contador = 3;
  }
  if (vidaBruja  == 50) {
    velocidad = 2;
    contador = 2;
  }
  if (vidaBruja  == 20) {
    velocidad = 3;
    contador = 1;
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
}

void perdio() {
  pantalla(#d10f15, width/20, "PERDISTE", "La loca de la escoba rompio toda la huertita :(" );
}

void gano() {
  pantalla(#320fd1, width/20, "GANASTE", "Mataste a la loca de la escoba" );
}

void iniciar() {
  vidaHuerta = 100;
  vidaBruja = 100;
  contador = 4;
  velocidad =1;
  dibujarBruja();
  dibujarCalabazas();
  huertaDibujar();
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
