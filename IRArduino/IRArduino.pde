/*
 * IRremote: IRrecvDemo - demonstrates receiving IR codes with IRrecv
 * An IR detector/demodulator must be connected to the input RECV_PIN.
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * http://arcfn.com
 */

#include <IRremote.h>

int RECV_PIN = 9;
int LED = 8;

IRrecv irrecv(RECV_PIN);

decode_results results;

void blink_led() {
  digitalWrite(LED, HIGH);
  delay(200);
  digitalWrite(LED, LOW);
}

void setup()
{
  Serial.begin(9600);
  irrecv.enableIRIn(); // Start the receiver
  pinMode(LED, OUTPUT);    
}

void loop() {
  if (irrecv.decode(&results)) {
    switch ( results.value ) {
      case 0x2fd58a7:
      case 0xFF50AF:
        Serial.println("n");
        blink_led();
        delay(500);
      break;
      
      case 0x2fd7887:
      case 0xFF10EF:
        Serial.println("p");
        blink_led();
        delay(500);
      break;
    }
    //Serial.println(results.value, HEX);
    irrecv.resume(); // Receive the next value
  }
}
