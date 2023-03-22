#include <DHT.h>

#define DHTPIN 2     // el pin del sensor DHT11 se conecta al pin digital 2
#define DHTTYPE DHT11   // el tipo de sensor DHT que estás utilizando

DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600);
  dht.begin();
}

void loop() {
  delay(2000);  // espera 2 segundos entre mediciones

  float temperatura = dht.readTemperature();  // lee la temperatura en grados Celsius
  float humedad = dht.readHumidity();  // lee la humedad relativa en porcentaje

  Serial.print("Temperatura: ");
  Serial.print(temperatura);
  Serial.print(" °C, Humedad: ");
  Serial.print(humedad);
  Serial.println(" %");
}

