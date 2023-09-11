import fisica.*;
class Bruja {
  FMouseJoint cadena;
  FCircle bruja;
  int vida;
  PImage imagenBruja;
  int tam = width/10;
  FWorld mundo; 
  Bruja(FWorld mundo) {
    this.mundo = mundo;
    vida = 100;
    imagenBruja = loadImage("bruja.png");
    bruja = new FCircle(tam);
    bruja.setStatic(true);
    bruja.setGrabbable(false);
  }
  
  void dibujar(int posX, int posY) {
    bruja.setPosition(posX, posY);
  }
   
  void agregarAlMundo() {  
    mundo.add(bruja);
  }
  
  void quitarDelMundo() {    
    mundo.remove(bruja);
  }
}
