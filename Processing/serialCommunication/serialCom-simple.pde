import processing.serial.*;

Serial port;  // Create object from Serial class

void setup()
{
  // find the port that you're using
  printArray(Serial.list());
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  port = new Serial(this, portName, 9600);
}

void draw()
{
  if ( port.available() > 0) 
  {  // If data is available,
    int val = port.read();         // read it and store it in val
    println(val); //print it out in the console
  } 
}

