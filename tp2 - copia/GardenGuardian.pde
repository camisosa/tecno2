import fisica.*;
class GardenGuardian {
  Bruja bruja ;
  Calabaza [] calabazas;
  Huerta huerta;
  Pala pala;
  FWorld mundo;

  int contador = 4;// Establece el tiempo total en segundos
  boolean puedenAparecerCalabazas = false; // Controla si se pueden generar calabazas
  int empiezaElTiempo = millis();// Tiempo de inicio
  int velocidad = 2; //velocidad a ala que se mueve la bruja
  int posX; //posX de la bruja
  boolean cambioDeDireccion = true;

  GardenGuardian(FWorld mundo) {
    this.mundo = mundo;
    posX =  width/2 ;
    bruja = new Bruja (mundo);
    huerta = new Huerta (mundo);
    calabazas = new Calabaza [100]; // Inicializa el arreglo de calabazas
  }

  void dibujar() {
    barraDeVida(bruja.vida, posX, height/7 + bruja.tam/1.5);
    barraDeVida(huerta.vida, huerta.tamX/2, height - huerta.tamY/2);
    bruja.dibujar(posX, height/7);
    pala.dibujar(mouseX, mouseY);
    rebote();
    aparecenCalabazas();
    aumentaDificultad();
  }

  void rebote() {
    if (posX + bruja.tam / 2 > width || posX - bruja.tam / 2  < 0) {
      cambioDeDireccion = !cambioDeDireccion;
    }
    if (cambioDeDireccion) {
      posX += velocidad;
    } else {
      posX -= velocidad;
    }
  }

  void aparecenCalabazas() {
    int tiempoTranscurrido  = (millis() - empiezaElTiempo) / 1000; //Se pasan milesimas a segundos
    int tiempoRestante = max(0, contador - tiempoTranscurrido); //Calcula el tiempo que restante para que llegue a 0

    if (tiempoRestante == 0) {
      empiezaElTiempo = millis();// Reinicia el tiempo
      puedenAparecerCalabazas = true;
    } else {
      puedenAparecerCalabazas = false;
    }
    // Genera calabazas si está permitido

    for (int i = 0; i < calabazas.length; i++) {
      //calabazas[i].attachImage(imagenCalabaza); //Se le carga la imagen de la calabaza
      if (puedenAparecerCalabazas && calabazas[i] == null && cambioDeDireccion ) {
        //Busca un espacio vacion en el arreglo
        calabazas [i] = new Calabaza (mundo, posX - (width/13)); // Crea una nueva calabaza en el espacio vacio
        break;  // Sale del bucle una vez que se agrega una calabaza
      }
      if (puedenAparecerCalabazas && calabazas[i] == null && !cambioDeDireccion) { //Busca un espacio vacion en el arreglo
        calabazas [i] = new Calabaza (mundo, posX + (width/13)); // Crea una nueva calabaza en el espacio vacio
        break;  // Sale del bucle una vez que se agrega una calabaza
      }
      if (puedenAparecerCalabazas == false) {
        calabazas[i].quitarDelMundo();
      }
    }
  }

  void barraDeVida(float vida, float posX, float posY) {
    float tamX = width/10;
    float tamY = height/35;
    float posX_ = posX - tamX / 2;
    float posY_ = posY - tamY / 2;
    // Dibuja el fondo de la barra de vida
    fill(200);
    rect(posX_, posY_, tamX, tamY);
    // Dibuja la barra de vida actual
    float porcentajeDeVida = map(vida, 0, 100, 0, tamX);
    fill(0, 255, 0);
    rect(posX_, posY_, porcentajeDeVida, tamY);
  }

  void contactStarted(FContact contact) {
    FBody body1 = contact.getBody1();
    FBody body2 = contact.getBody2();
    // Verifica colisiones entre la bruja y las calabazas
    for (int i = 0; i < calabazas.length; i++) {
      if ((body1 == bruja.bruja && body2 ==  calabazas[i].calabaza) || (body1 ==  calabazas[i].calabaza && body2 ==  bruja.bruja)) {
        bruja.vida -= 10;
        calabazas[i] = null;
        println("calabaza toco a la  bruja");
        break;
      }
      if (body1 ==  huerta.huerta && body2 ==  calabazas[i].calabaza || body1 ==  calabazas[i].calabaza && body2 ==  huerta.huerta) {
        huerta.vida -= 1;
        println("calabaza toco a la  huerta");
        break;
      }
    }
  }

  void aumentaDificultad() {
    if (bruja.vida <= 100 && bruja.vida >= 70) {
      contador = 3;
      velocidad = 3;
    }
    if (bruja.vida <= 60 && bruja.vida >= 40) {
      contador = 2;
      velocidad = 4;
    }
    if (bruja.vida < 40) {
      contador = 1;
      velocidad = 5;
    }
  }

  void sacarVida() {
    bruja.vida -= 10;
  }

  void iniciarJuego() {
    huerta.agregarAlMundo();
    bruja.agregarAlMundo();
    for (int i = 0; i < calabazas.length; i++) {
      calabazas [i].agregarAlMundo();
    }
  }
  void reiniciar() {
    bruja.vida = 100;
    huerta.vida = 100;
    //estaJugando = false;
    //estadoJuego = Inicio;
    bruja.quitarDelMundo();
    huerta.quitarDelMundo();
    for (int i = 0; i < calabazas.length; i++) {
      if (calabazas[i] != null) {
        calabazas[i].quitarDelMundo();
      }
    }
    contador = 4;
    puedenAparecerCalabazas = false;
    velocidad = 2;
    cambioDeDireccion = true;
  }
}
