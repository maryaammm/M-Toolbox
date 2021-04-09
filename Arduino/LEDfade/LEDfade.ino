/*
 * Control LED brightness with a button
 * Credit: M-Toolbox - https://github.com/maryaammm
 */

const int ledPin = 9;           // LED pin (PWM)
const int buttonPin = 2;        // button pin
int brightness = 0;       // LED brightness, 0:On, 255:Off
int fadeAmount = 5;       // the change in brightness with each button press
int buttonState = 0;

// the setup routine runs once when you press reset:
void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  pinMode(buttonPin, INPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  // set the brightness of pin 9:
  analogWrite(ledPin, brightness);
  buttonState = digitalRead(buttonPin);
  if (buttonState){
    // change the brightness
    brightness = brightness + fadeAmount;
    // reverse the direction of change
    if (brightness <= 0 || brightness >= 255) {
      fadeAmount = -fadeAmount;
    }
    // send brightness to processing
    Serial.write(brightness);
    // wait for 30 milliseconds to see the dimming effect
    delay(30);
  }
  
}
