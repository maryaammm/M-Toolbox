/**
* 
* Recieve a text msg from a textbox with submit button
* 
**/


import controlP5.*;

ControlP5 cp5;

String textValue = "";
String msg = "";

void setup() {
  size(700,400);
  
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("input")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
       
  cp5.addBang("send")
     .setPosition(140,150)
     .setSize(80,40)
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;
     
  textFont(font);
}

void draw() {
  background(0);
  fill(255);
  //text(cp5.get(Textfield.class, "input").getText(), 360,130);
  text(msg, 20,220);
}

void controlEvent(ControlEvent theEvent) {
  
  if(theEvent.isController()) { 
    if(theEvent.getController().getName()=="send") {
      msg = cp5.get(Textfield.class,"input").getText();
    }  
  }
}

/**
* Source:
* ControlP5 Textfield
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*/
