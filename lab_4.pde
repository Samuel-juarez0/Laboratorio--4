import processing.serial.*;

Serial puerto;
float temperatura = 0;
float humedad = 0;

void setup() {
  size(600, 400);
  puerto = new Serial(this, Serial.list()[0], 9600);
  background(255);
}

void draw() {
  if (puerto.available() > 0) {
    String lectura = puerto.readStringUntil('\n');
    if (lectura != null) {
      String[] datos = split(lectura.trim(), ' ');
      temperatura = float(datos[0]);
      humedad = float(datos[1]);
    }
  }

  // Limpiar pantalla
  background(255);
  
  // Texto de temperatura
  fill(255, 0, 0);
  textSize(20);
  textAlign(LEFT, CENTER);
  text("Temperatura: " + temperatura + " C", 50, height/2 - 20);

  // Barra de temperatura
  fill(255, 0, 0);
  rectMode(CORNER);
  float tempWidth = map(temperatura, 0, 50, 0, width/2 - 100);
  rect(width/2 + 50, height/2 - 10, tempWidth, 20);

  // Texto de humedad
  fill(0, 255, 255);
  textSize(20);
  textAlign(LEFT, CENTER);
  text("Humedad: " + humedad + " %", 50, height/2 + 20);

  // Barra de humedad
  fill(0, 255, 255);
  rectMode(CORNER);
  float humWidth = map(humedad, 0, 100, 0, width/2 - 100);
  rect(width/2 + 50, height/2 + 10, humWidth, 20);
}
