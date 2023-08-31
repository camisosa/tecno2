import fisica.*;

FWorld mundo;// Instancia del mundo físico
FMouseJoint cadena;// Cadena para conectar la pala al mouse
FCircle[] calabazas;// Arreglo para almacenar las calabazas
FCircle bruja;// Bruja
FCircle pala; // Pala

int contador = 3;// Establece el tiempo total en segundos
boolean puedenAparecerCalabazas = false; // Controla si se pueden generar calabazas
int empiezaElTiempo;// Tiempo de inicio

PImage imagenCalabaza, imagenPala, imagenBruja;// Imágenes para elementos


void setup() {
  size(800, 600);

  Fisica.init(this);
  mundo = new FWorld();// Crea el mundo físico
  mundo.setEdges();// Configura los bordes del mundo físico

  // Carga las imágenes
  imagenCalabaza = loadImage("calabaza.png");
  imagenPala = loadImage("pala.png");
  imagenBruja = loadImage("bruja.png");

  empiezaElTiempo = millis();// Toma el tiempo de inicio

  // Configura la pala
  pala = new FCircle(50);
  pala.setPosition(width / 2, height / 2);
  pala.attachImage(imagenPala);
  mundo.add(pala);

  cadena = new FMouseJoint(pala, width / 2, height / 2);// Crea una cadena para la pala
  mundo.add(cadena);

  // Configura la bruja
  bruja = new FCircle(90);
  bruja.setPosition(100, 100);
  bruja.setStatic(true);
  bruja.attachImage(imagenBruja);
  bruja.setGrabbable(false);
  mundo.add(bruja);

  calabazas = new FCircle[100]; // Inicializa el arreglo de calabazas
}

void draw() {
  background(255);
  mundo.step(); // Actualiza la simulación física
  mundo.draw(); // Dibuja el mundo físico

  int tiempoTranscurrido  = (millis() - empiezaElTiempo) / 1000; //Se pasan milesimas a segundos
  int tiempoRestane = max(0, contador - tiempoTranscurrido); //Calcula el tiempo que restante para que llegue a 0

  // Determina si se pueden generar calabazas
  if (tiempoRestane == 0) {
    empiezaElTiempo = millis();// Reinicia el tiempo
    puedenAparecerCalabazas = true;
  } else {
    puedenAparecerCalabazas = false;
  }

  // Genera calabazas si está permitido
  if (puedenAparecerCalabazas) {
    for (int i = 0; i < calabazas.length; i++) {
      if (calabazas[i] == null) { //Busca un espacio vacion en el arreglo
        calabazas[i] = new FCircle(70); // Crea una nueva calabaza en el espacio vacio
        calabazas[i].setPosition(random(200, width - 100), -15); //Aparece en una posicion random fuera de la pantalla
        calabazas[i].attachImage(imagenCalabaza); //Se le carga la imagen de la calabaza
        calabazas[i].setGrabbable(false); //Evita que se pueda mover con el mouse
        mundo.add(calabazas[i]);// Agrega la calabaza al mundo
        break;  // Sale del bucle una vez que se agrega una calabaza
      }
    }
  }

  cadena.setTarget(mouseX, mouseY); // Actualiza el objetivo de la cadena (pala sigue al mouse)
}

void contactStarted(FContact contact) {
  FBody body1 = contact.getBody1();//Cuerpo 1 dentro del mundo de fisica (puede ser calabaza o bruja)
  FBody body2 = contact.getBody2();//Cuerpo 2 dentro del mundo de fisica (puede ser calabaza o bruja)

  // Verifica colisiones entre la bruja y las calabazas
  for (int i = 0; i < calabazas.length; i++) { //El maximo de i es el maximo de calabazas
    if ((body1 == bruja && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == bruja)) {
      // Si hay colisión entre la bruja y una calabaza
      println("¡Una calabaza tocó a la bruja!");
      mundo.remove(calabazas[i]);  // Elimina la calabaza que tocó a la bruja
      calabazas[i] = null;  // Marca el espacio en el arreglo como disponible
      break;  // Sale del bucle una vez que se finaliza la colisión
    }
  }
}
