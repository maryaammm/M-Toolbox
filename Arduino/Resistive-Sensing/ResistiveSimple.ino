// reading analog sensor value, e.g. simple resistive sensing

const int sensorPin = A1;    // input pin for the sensor
int sensorValue = 0;  // variable to store the value coming from the sensor

void setup() {
  Serial.begin(9600);
  pinMode(sensorPin, INPUT);
}

void loop() {
  // read the value from the sensor
  sensorValue = analogRead(sensorPin);
  // print the reading value with max and min for better visualization
  Serial.print(0);
  Serial.print(",");
  Serial.print(1023);
  Serial.print(",   ");
  Serial.println(sensorValue);
  delay(100);
}
