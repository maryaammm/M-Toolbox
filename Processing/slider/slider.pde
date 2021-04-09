/*
 * Slider that changes with data recieved from serial port
 * Credit: M-Toolbox - https://github.com/maryaammm
 */

import processing.serial.*;

Serial port;  // Create object from Serial class
float val;
float transparency;
int sliderWidth = 220;

void setup()
{
  size(480, 480);
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  port = new Serial(this, portName, 9600);
}

void draw()
{
  if ( port.available() > 0) 
  {  // If data is available,
    val = port.read();         // read it and store it in val
    val = map(val, 0, 255, 0, sliderWidth); // Convert the value
    println(val); //print it out in the console
  }
  // background of slider
  strokeWeight(2);
  fill(255,255,255);
  rect(120, 200, sliderWidth, 40);
  // bar that changes based on data
  transparency = int(val);
  fill(247,220,5,transparency+10);
  rect(120, 200, val, 40);
}
