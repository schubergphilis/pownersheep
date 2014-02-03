#include <SoftwareSerial.h>

SoftwareSerial mySerial(2, 0); // RX, TX
String command = ""; // Stores response of bluetooth device
                     // which simply allows \n between each
                     // response.
void setup() 
{ 
   // Open serial communications and wait for port to open:
   Serial.begin(9600);
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
     Serial.println(command);
     
       if (command.substring(0,5) == "sheep win") {
                  #define MSG "Beeeeh, PownerSheep"
                  delay(2500);
                  taartMailWin(MSG);
        }else if(command.substring(0,9) == "sheep mac"){
                  #define MSG "Beeeeh, PownerSheep"
                  delay(2500);
                  taartMailMac(MSG); 
        }else{
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

void taartMailWin(char *SomeCommand){
  Keyboard.print(SomeCommand);
  delay(1500);
  Keyboard.set_modifier(MODIFIERKEY_ALT);
  Keyboard.set_key1(KEY_S);
  Keyboard.send_now();

  // Reset key
  Keyboard.set_key1(0);
  Keyboard.send_now();
}

void taartMailMac(char *SomeCommand){
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
