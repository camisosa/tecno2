FCircle [] calabazas;
int tamCalabaza;
int contador = 4;
boolean puedenAparecerCalabazas = false;
int empiezaElTiempo;
PImage ImgCalabaza;

void dibujarCalabazas() {
  ImgCalabaza = loadImage ("calabaza.png");
  int tiempoTranscurrido  = (millis() - empiezaElTiempo) / 1000; //Se pasan milesimas a segundos
  int tiempoRestante = max(0, contador - tiempoTranscurrido); //Calcula el tiempo que restante para que llegue a 0
  tamCalabaza = width/15;

  // Determina si se pueden generar calabazas
  if (tiempoRestante == 0) {
    empiezaElTiempo = millis();// Reinicia el tiempo
    puedenAparecerCalabazas = true;
  } else {
    puedenAparecerCalabazas = false;
  }

  // Genera calabazas si está permitido
  for (int i = 0; i < calabazas.length; i++) {
    //calabazas[i].setRestitution(1);
    if (puedenAparecerCalabazas && calabazas[i] == null && cambioDeDireccion) { //Si pueden aparecer calabazas es verdadero, hay espacio vacion en el arreglo y cambio de direccion es true
      calabazas[i] = new FCircle(tamCalabaza); // Crea una nueva calabaza en el espacio vacio
      calabazas[i].setGrabbable(false); //Evita que se pueda mover con el mouse
      calabazas[i].setPosition(posXBruja - tamCalabaza, posYBruja + tamCalabaza);
      calabazas[i].attachImage(ImgCalabaza); //Se le carga la imagen de la calabaza
      mundo.add(calabazas[i]);// Agrega la calabaza al mundo
      break;  // Sale del bucle una vez que se agrega una calabaza
    }
    if (puedenAparecerCalabazas && calabazas[i] == null && cambioDeDireccion == false) { //Si pueden aparecer calabazas es verdadero, hay espacio vacion en el arreglo y cambio de direccion es false
      calabazas[i] = new FCircle(tamCalabaza); // Crea una nueva calabaza en el espacio vacio
      calabazas[i].setGrabbable(false); //Evita que se pueda mover con el mouse
      calabazas[i].setPosition(posXBruja + tamCalabaza, posYBruja + tamCalabaza);
      calabazas[i].attachImage(ImgCalabaza); //Se le carga la imagen de la calabaza
      mundo.add(calabazas[i]);// Agrega la calabaza al mundo
      break;  // Sale del bucle una vez que se agrega una calabaza
    }
  }
}
