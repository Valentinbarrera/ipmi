PImage[] imagenes = new PImage[9];
String[] textos = {
  "Un conejo muy veloz corría por el bosque mientras la tortuga caminaba despacio pero segura. El conejo se reía porque la tortuga era lenta.",
  "La tortuga, cansada de que el conejo se riera, le propuso una carrera. El conejo, confiado, aceptó el desafío.",
  "Al comenzar la carrera, el conejo salió disparado a toda velocidad, dejando atrás a la tortuga.",
  "Pero viendo que la tortuga iba muy despacio, el conejo decidió descansar un rato bajo la sombra de un árbol.",
  "Mientras el conejo dormía, la tortuga siguió avanzando despacio pero sin parar.",
  "Cuando el conejo despertó, vio que la tortuga estaba por llegar a la meta.",
  "Y así aprendieron que avanzar siempre con paciencia y constancia es más importante que ser rápido y confiarse.",
  "Y así terminó la carrera, dejando una gran lección: la perseverancia vence a la arrogancia.",
  "fin de la historia"
};

PImage botonReiniciar;
int pasoActual = 0;
int tiempoCambio = 4000; // 4 segundos por imagen
int tiempoAnterior;
int opacidadTexto = 0;
int velocidadFade = 5;

void setup() {
  size(640, 480);
  imagenes[0] = loadImage("imagen1.jpg");
  imagenes[1] = loadImage("imagen2.png");
  imagenes[2] = loadImage("imagen3.png");
  imagenes[3] = loadImage("imagen4.png");
  imagenes[4] = loadImage("imagen5.png");
  imagenes[5] = loadImage("imagen6.png");
  imagenes[6] = loadImage("imagen7.png");
  imagenes[7] = loadImage("imagen8.png");
  imagenes[8] = loadImage("imagen9.png");
  botonReiniciar = loadImage("Botton.png");
  tiempoAnterior = millis();
  textSize(26);
}

void draw() {
  background(0);
  imageMode(CORNER);
  image(imagenes[pasoActual], 0, 0, width, height);

  if (opacidadTexto < 255) {
    opacidadTexto += velocidadFade;
    if (opacidadTexto > 255) {
      opacidadTexto = 255;
    }
  }

  // RECTÁNGULO SEMI-TRANSPARENTE DETRÁS DEL TEXTO
  noStroke();
  fill(0, 0, 0, 150); // 
  rect(30, 160, width - 60, 220);

  // TEXTO
  fill(255, opacidadTexto);
  textAlign(LEFT, TOP);
  text(textos[pasoActual], 40, 170, width - 80, 200);

  if (millis() - tiempoAnterior > tiempoCambio && pasoActual < imagenes.length - 1) {
    pasoActual++;
    tiempoAnterior = millis();
    opacidadTexto = 0;
  }

  if (pasoActual == imagenes.length - 1) {
    mostrarBoton();
  }
}

void mostrarBoton() {
  imageMode(CENTER);
  image(botonReiniciar, width / 2, height - 40, 80, 80);
}

void mousePressed() {
  float botonX = width / 2;
  float botonY = height - 40;
  float botonAncho = 80;
  float botonAlto = 80;

  if (mouseX > botonX - botonAncho / 2 && mouseX < botonX + botonAncho / 2 &&
      mouseY > botonY - botonAlto / 2 && mouseY < botonY + botonAlto / 2) {
    pasoActual = 0;
    tiempoAnterior = millis();
    opacidadTexto = 0;
  }
}
