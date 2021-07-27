/*
 * plot data from serial port
 */
 
import processing.serial.*;
Serial port;  // Create object from Serial class

float val;
float valMap;
// set the sensor range
// ToDo: read it as input from user as a calibration step
int sensorMin = 0;
int sensorMax = 225;
// canvas size
int canvasX = 480;
int canvasY = 680;
// graph varaibles
int offset = 40;
int xPosG = offset; 
int yPosG = canvasY - offset;
int lengthG = 400;
int heightG = 300;
// variables to draw a continuous line
int currentXpose = offset;
int lastxPos = offset;
int lastheight = canvasY-offset;

void setup()
{
  size(480, 680);
  // set background
  background(200);
  // set the serial communication
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  port = new Serial(this, portName, 9600);
}

void draw()
{
  if ( port.available() > 0) 
  { // if data is available
    // read it and store it in val
    val = port.read();      
    println((int)val); //print it out in the console   
    // call the function to draw graph
    drawGraph(val);
  }
  
  // draw axis
  strokeWeight(2);
  stroke(0);
  line(xPosG, yPosG, xPosG, yPosG-heightG);
  line(xPosG, yPosG, xPosG+lengthG, yPosG);
  // draw text box
  textSize(12);
  fill(0);
  text("225", offset/3, yPosG-heightG);
  text("0", offset/2, yPosG);
  text("t", xPosG+lengthG, yPosG+offset/2);
}

void drawGraph(float sensorVal)
{

    // draw a line from Last inByte to the new one
    stroke(127,34,255);     //stroke color
    strokeWeight(1);        //stroke wider
    line(lastxPos, lastheight, currentXpose, canvasY-offset-sensorVal); 
    lastxPos = currentXpose;
    lastheight = int(canvasY-offset-sensorVal);

    // at the edge of the graph window, go back to the beginning:
    if (currentXpose >= offset+lengthG) {
      currentXpose = offset;
      lastxPos= offset;
      background(200);  //Clear the screen.
    } 
    else {
      // increment the horizontal position:
      currentXpose++;
    }
}
 
