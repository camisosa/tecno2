import fisica.*;
FWorld mundo;
FMouseJoint cadena;
FCircle calabaza;
FCircle bruja;
FCircle pala;
boolean puedenAparecerUnaCalabaza = false;
int empiezaElTiempo;
int contador = 3;
PImage imagenCalabaza, imagenPala,imagenBruja;

void setup() {
  size(800, 600);

  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  
  imagenCalabaza = loadImage ("calabaza.png");
  imagenPala = loadImage ("pala.png");
  imagenBruja = loadImage ("bruja.png");
  empiezaElTiempo = millis();

  pala = new FCircle(50);
  pala.setPosition(width/2, height/2);
  pala.attachImage(imagenPala);
  mundo.add(pala);

  cadena = new FMouseJoint(pala, width/2, height/2);
  mundo.add(cadena);
  
  bruja = new FCircle(90);
  bruja.setPosition(100,100);
  bruja.setStatic(true);
  bruja.attachImage(imagenBruja);
  mundo.add(bruja);
}

void draw() {
  background(255);
  mundo.step();
  mundo.draw();
  // Calcula el tiempo transcurrido en segundos (ecuacion para pasar de milisegundos a segundos)
  int elapsedTime = (millis() - empiezaElTiempo) / 1000;
  // Calcula el tiempo restante
  int timeLeft = max(0, contador - elapsedTime);
  /*// Muestra el tiempo restante en la pantalla
   textAlign(CENTER, CENTER);
   textSize(48);
   fill(0);
   text(timeLeft, width / 2, height / 2);
   //si el contador es ingual a 0, el contador se reinicia y se agrega un circulo*/
  if (timeLeft == 0) {
    empiezaElTiempo = millis();
    puedenAparecerUnaCalabaza = true;
  } else { // De lo contrario no se agrega ningun circulo
    puedenAparecerUnaCalabaza = false;
  }
  if (puedenAparecerUnaCalabaza) {
    calabaza = new FCircle(70);
    calabaza.setPosition(random(200, width - 100), -15);
    calabaza.attachImage(imagenCalabaza);
    //calabaza.setRestitution(1);
    mundo.add(calabaza);
  }
  cadena.setTarget(mouseX, mouseY);
}
