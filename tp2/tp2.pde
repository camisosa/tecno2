import fisica.*;

FWorld mundo;// Instancia del mundo físico
FMouseJoint cadena;// Cadena para conectar la pala al mouse
FCircle[] calabazas;// Arreglo para almacenar las calabazas
FCircle bruja;// Bruja
FCircle pala; // Pala
FBox huerta; // huerta

int contador = 3;// Establece el tiempo total en segundos
boolean puedenAparecerCalabazas = false; // Controla si se pueden generar calabazas
int empiezaElTiempo;// Tiempo de inicio

PImage imagenCalabaza, imagenPala, imagenBruja;// Imágenes para elementos

float vidaDeLaHuerta = 100;
float vidaDeLaBruja = 100;

boolean estaJugando = true;

int cuantasCalabazasGolpeanAlabruja;


void setup() {
  size(900, 600);

  Fisica.init(this);
  mundo = new FWorld();// Crea el mundo físico
  mundo.setEdges();// Configura los bordes del mundo físico

  // Carga las imágenes
  imagenCalabaza = loadImage("calabaza.png");
  imagenPala = loadImage("pala.png");
  imagenBruja = loadImage("bruja.png");

  empiezaElTiempo = millis();// Toma el tiempo de inicio

  dibujarPala();
  dibujarBruja();
  dibujarHuerta();

  calabazas = new FCircle[100]; // Inicializa el arreglo de calabazas
}


void draw() {
  background(255);
  mundo.step(); // Actualiza la simulación física
  mundo.draw(); // Dibuja el mundo físico;
  juego();
}


void contactStarted(FContact contact) {
  FBody body1 = contact.getBody1();//Cuerpo 1 dentro del mundo de fisica (puede ser la huerta, la calabaza o la bruja)
  FBody body2 = contact.getBody2();//Cuerpo 2 dentro del mundo de fisica (puede ser la huerta, la calabaza o la bruja)

  // Verifica colisiones entre la bruja y las calabazas
  for (int i = 0; i < calabazas.length; i++) { //El maximo de i es el maximo de calabazas
    if ((body1 == bruja && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == bruja)) {
      // Si hay colisión entre la bruja y una calabaza
      //println("¡Una calabaza tocó a la bruja! Le queda " + vidaDeLaBruja + " de vida");
      vidaDeLaBruja = vidaDeLaBruja - 50;
      mundo.remove(calabazas[i]);  // Elimina la calabaza que tocó a la bruja
      calabazas[i] = null;  // Marca el espacio en el arreglo como disponible
      break;  // Sale del bucle una vez que se finaliza la colisión
    }
    if ((body1 == huerta && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == huerta)) {
      // Si hay colisión entre la bruja y una calabaza
      //println("¡Una calabaza rompio la huerta! Queda el %" + vidaDeLaHuerta + " de la huerta sana.");
      vidaDeLaHuerta = vidaDeLaHuerta - 1;
      break;  // Sale del bucle una vez que se finaliza la colisión
    }
  }
}

void barraDeVida(float vida, float posX, float posY) {
  float tamX = 210;
  float tamY = 20;
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

void dibujarBruja() {
  // Configura la bruja
  bruja = new FCircle(90);
  bruja.setPosition(100, 100);
  bruja.setStatic(true);
  //bruja.attachImage(imagenBruja);
  bruja.setGrabbable(false);
  mundo.add(bruja);
}

void dibujarPala() {
  // Configura la pala
  pala = new FCircle(30);
  pala.setPosition(width / 2, height / 2);
  //pala.attachImage(imagenPala);
  mundo.add(pala);
  cadena = new FMouseJoint(pala, width / 2, height / 2);// Crea una cadena para la pala
  mundo.add(cadena);
}

void dibujarHuerta() {
  // Configura la huerta
  huerta = new FBox(width, 100);
  huerta.setPosition(width / 2, height - 50); // Coloca la huerta en la parte inferior de la ventana
  huerta.setStatic(true);
  huerta.setGrabbable(false);
  mundo.add(huerta);
}

void dibujarCalabazas() {
  int tiempoTranscurrido  = (millis() - empiezaElTiempo) / 1000; //Se pasan milesimas a segundos
  int tiempoRestante = max(0, contador - tiempoTranscurrido); //Calcula el tiempo que restante para que llegue a 0
  if (estaJugando) {
    // Determina si se pueden generar calabazas
    if (tiempoRestante == 0) {
      empiezaElTiempo = millis();// Reinicia el tiempo
      puedenAparecerCalabazas = true;
    } else {
      puedenAparecerCalabazas = false;
    }

    // Genera calabazas si está permitido
    if (puedenAparecerCalabazas) {
      for (int i = 0; i < calabazas.length; i++) {
        if (calabazas[i] == null) { //Busca un espacio vacion en el arreglo
          calabazas[i] = new FCircle(50); // Crea una nueva calabaza en el espacio vacio
          calabazas[i].setPosition(random(200, width - 100), -15); //Aparece en una posicion random fuera de la pantalla
          //calabazas[i].setRestitution(1);
          //calabazas[i].attachImage(imagenCalabaza); //Se le carga la imagen de la calabaza
          calabazas[i].setGrabbable(false); //Evita que se pueda mover con el mouse
          mundo.add(calabazas[i]);// Agrega la calabaza al mundo
          break;  // Sale del bucle una vez que se agrega una calabaza
        }
      }
    }
  } else {
    for (int i = 0; i < calabazas.length; i++) {
      mundo.remove(calabazas[i]);  // No se dibujan las calabzas
    }
  }
}

void aumentaDificultad() {
  if (vidaDeLaBruja <= 100 && vidaDeLaBruja >= 60 ) {
    contador = 3;
  }
  if (vidaDeLaBruja <= 50 && vidaDeLaBruja >= 30) {
    contador = 2;
  }
  if (vidaDeLaBruja < 30) {
    contador = 1;
  }
}
void gardenGuardian() {
  dibujarCalabazas();
  cadena.setTarget (mouseX, mouseY); // Actualiza el objetivo de la cadena (pala sigue al mouse)
  barraDeVida(vidaDeLaBruja, 150, 20);
  barraDeVida(vidaDeLaHuerta, width / 2, height - 30);
  aumentaDificultad();
}

void juego() {
  if (estaJugando) {
    gardenGuardian();
  }
  if (vidaDeLaBruja <= 0) {
    gano();
    estaJugando = false;
  }
  if ( vidaDeLaHuerta <= 0) {
    perdio();
    estaJugando = false;
  }
}


void gano() {
  text("Ganaste", width/2, height/2);
}

void perdio() {
  text("Perdiste", width/2, height/2);
}

void seReiniciaElJuego() {
}
