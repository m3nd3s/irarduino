/*
 * IRremote: IRrecvDemo - demonstrates receiving IR codes with IRrecv
 * An IR detector/demodulator must be connected to the input RECV_PIN.
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * http://arcfn.com
 */

#include <IRremote.h>

int RECV_PIN = 9;

IRrecv irrecv(RECV_PIN);

decode_results results;

void setup()
{
  Serial.begin(9600);
  irrecv.enableIRIn(); // Start the receiver
}

void loop() {
  if (irrecv.decode(&results)) {
    switch ( results.value ) {
      case 0x2fd58a7:
        Serial.println("next");
      break;
      
      case 0x2fd7887:
        Serial.println("back");
      break;
      
      default:
        Serial.print("");
    }
    //Serial.println(results.value, HEX);
    irrecv.resume(); // Receive the next value
  }
}
