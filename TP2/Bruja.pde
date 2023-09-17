FCircle bruja;
int vidaBruja = 100;
int posXBruja, posYBruja, tamBruja;
int velocidad = 1;
boolean cambioDeDireccion = true;
int empiezaEltiempoBruja2;
int totalDeImagenesDeLaBruja = 7 ;
int imagenActualdelaBruja;
PImage [] brujaDerecha = new PImage [totalDeImagenesDeLaBruja] ;
PImage [] brujaIzquierda = new PImage [totalDeImagenesDeLaBruja];
boolean calabazaTocoALaBruja;
int tiempoBruja;
int pasadoASegundos;

void bruja() {
  posXBruja = width/2;
  posYBruja = height/6;
  tamBruja = width/8;
  for (int i = 0; i < totalDeImagenesDeLaBruja; i++ ) {
    brujaDerecha[i] = loadImage ("brujaDerecha ("+i+").png");
    brujaDerecha[i].resize(tamBruja+width/10, tamBruja+width/10);
    brujaIzquierda[i] = loadImage ("brujaIzquierda ("+i+").png");
    brujaIzquierda[i].resize(tamBruja+width/10, tamBruja+width/10);
  }
  bruja = new FCircle(tamBruja);
  bruja.setStatic(true);
  bruja.setGrabbable(false);
  mundo.add(bruja);
}
void dibujarBruja() {
  bruja.setPosition(posXBruja, posYBruja);
  rebote();
  unaCalabazaTocoALaBruja();
}
void rebote() {
  if (posXBruja + tamBruja / 2 > width || posXBruja - tamBruja / 2  < 0) {
    cambioDeDireccion = !cambioDeDireccion;
  }
  if (cambioDeDireccion) {
    posXBruja += velocidad;
    bruja.attachImage(brujaDerecha[imagenActualdelaBruja]);
  } else {
    posXBruja -= velocidad;
    bruja.attachImage(brujaIzquierda[imagenActualdelaBruja]);
  }
}
void unaCalabazaTocoALaBruja() {
  if (jugando) {
    imagenActualdelaBruja =  tiempoBruja /10;
    if (calabazaTocoALaBruja) {
      tiempoBruja++;
    } else {
      tiempoBruja = 0 ;
    }
    if (tiempoBruja > 60) {
      calabazaTocoALaBruja = false;
    }
  }
}
