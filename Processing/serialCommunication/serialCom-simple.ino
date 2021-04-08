void setup() {
  
  //initialize serial communications at a 9600 baud rate
  Serial.begin(9600);

}

void loop() {
  //send data over the serial port
  Serial.write(1);
  delay(1000);
}
