FCircle [] calabazas;
int tamCalabaza;
int contador;
boolean puedenAparecerCalabazas = false;
int totalDeImagenesDeLaCalabaza = 11;
PImage [] ImgCalabaza = new PImage [totalDeImagenesDeLaCalabaza] ;
int ImagenActualDeLaCalabaza;
int tiempolimite;
int tiempoTranscurrido;
int tiempoCalabaza;
int cantCalabazas = 100;
void calabaza() {
  tamCalabaza = width/15;
  for (int i = 0; i < totalDeImagenesDeLaCalabaza; i++ ) {
    ImgCalabaza[i] = loadImage ("calabaza ("+ i +").png");
    ImgCalabaza[i].resize(tamCalabaza, tamCalabaza);
  }
}
void dibujarCalabazas() {
  if (jugando) {
    tiempoTranscurrido = contador/60;
    if (tiempoTranscurrido >= tiempolimite) {
      puedenAparecerCalabazas = true;
      contador = 0;
    } else {
      contador++;
      puedenAparecerCalabazas = false;
    }
  }

  // Genera calabazas si está permitido
  for (int i = 0; i <cantCalabazas; i++) {
    if (jugando && puedenAparecerCalabazas && calabazas[i] == null) { //Si pueden aparecer calabazas es verdadero, hay espacio vacion en el arreglo y cambio de direccion es true
      calabazas[i] = new FCircle(tamCalabaza); // Crea una nueva calabaza en el espacio vacio
      calabazas[i].setGrabbable(false); //Evita que se pueda mover con el mouse
      calabazas[i].attachImage(ImgCalabaza[ImagenActualDeLaCalabaza]);
      mundo.add(calabazas[i]);// Agrega la calabaza al mundo
      calabazas[i].setRestitution(0.5);
      if (cambioDeDireccion) {
        calabazas[i].setPosition(posXBruja - tamCalabaza*2, posYBruja + tamCalabaza);
      } else {
        calabazas[i].setPosition(posXBruja + tamCalabaza, posYBruja + tamCalabaza);
      }
      break;  // Sale del bucle una vez que se agrega una calabaza
    }
  }
}
