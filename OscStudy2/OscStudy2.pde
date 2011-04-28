import oscP5.*;
import netP5.*;

OscP5 oscP5;

NetAddress myRemoteLocation; 

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
}

void draw() {
  background(0);
}

void mousePressed() {
  OscMessage myOscMessage = new OscMessage("/test");
  myOscMessage.add(mouseX);
  oscP5.send(myOscMessage, myRemoteLocation);
}


// incoming osc message are forwarded to the oscEvent method.
void oscEvent(OscMessage theOscMessage) {
  theOscMessage.print();
}

/* 
// supercollider code.
// create an OSC listener
(
o = OSCresponder(nil,'/test', {arg time, responder, msg, addr;
[addr.addr, addr.port].postln;
msg.postln;
x.set(\freq,msg[1]);
}).add;
)

// start the local server
Server.local.boot;


// create a synthDef that plays a pure sine wave.
x = SynthDef(\sine, {arg freq=400; Out.ar(1,SinOsc.ar(freq))}).play;

 
*/
