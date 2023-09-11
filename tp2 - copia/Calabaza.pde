class Calabaza {
  FCircle calabaza;
  PImage imagenCalabaza;
  int tam ;
  FWorld mundo; 
  Calabaza(FWorld mundo,int posX) {
    this.mundo = mundo;
    imagenCalabaza = loadImage("calabaza.png");
    tam = width/20;
    calabaza = new FCircle(tam);
    calabaza.setGrabbable(false);
    calabaza.setPosition(posX, height/7);
  }
  
   void agregarAlMundo(){  
    mundo.add(calabaza);
  }
  
  void quitarDelMundo(){    
    mundo.remove(calabaza);
  }
}
