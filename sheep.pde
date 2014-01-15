#include <SoftwareSerial.h>

SoftwareSerial mySerial(2, 0); // RX, TX
String command = ""; // Stores response of bluetooth device
                         
void setup() 
{
  // Open serial communications and wait for port to open:
  Serial.begin(38400);
  Serial.println("Type Keyboard commands!");
  // SoftwareSerial "com port" data rate. JY-MCU v1.05 defaults to 9600.
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
          
           if(command == "1"){
              #define PAYLOAD "You have just been sheeped by the PownerSheep!!!"
              delay(2500);
              SheepMail(PAYLOAD);
           }
          
    command = ""; // No repeats
  }
 
  // Read user input if available.
  if (Serial.available()){
      delay(10); // The DELAY!
      mySerial.write(Serial.read());
  }
}// END loop()

//Functions for keyboard combinations
void CommandAtRunBarOSX(char *SomeCommand){
  Keyboard.set_modifier(MODIFIERKEY_GUI);
  Keyboard.set_key1(KEY_SPACE); // use Space key
  Keyboard.send_now(); // send strokes
  delay(1500);  // Weird timing for slow systems
  Keyboard.set_modifier(0); //prep release of  control keys
  Keyboard.set_key1(0); //have to do this to keep it from hitting key multiple times.
  Keyboard.send_now(); //Send the key changes
  delay(1000);
  Keyboard.print(SomeCommand);
  delay(1000);
  Keyboard.set_key1(KEY_ENTER);
  Keyboard.send_now();  
  Keyboard.set_key1(0);
  Keyboard.send_now();
}

void CommandAtNewTerminal(char *SomeCommand){
  CommandAtRunBarOSX("Terminal");
  // Open a new terminal in case another one was open
  delay(1000);
  Keyboard.set_modifier(MODIFIERKEY_GUI);
  Keyboard.set_key1(KEY_N);
  Keyboard.send_now(); // send strokes
  Keyboard.set_modifier(0); //prep release of  control keys
  Keyboard.set_key1(0); //have to do this to keep it from hitting key multiple times.
  Keyboard.send_now(); //Send the key changes
  delay(1500);
  Keyboard.print(SomeCommand);
  Keyboard.set_key1(KEY_ENTER);
  Keyboard.send_now();  
  Keyboard.set_key1(0);
}

void SheepMail(char *SomeCommand){
  Keyboard.print(SomeCommand);
  delay(1500);
  Keyboard.set_modifier(MODIFIERKEY_ALT);
  Keyboard.set_key1(KEY_S);
  Keyboard.send_now();

  // Reset key
  Keyboard.set_key1(0);
  Keyboard.send_now();
}

void exec_gnome(char *SomeCommand){
  // Press ALT-F2 ( Gnome - "run an application" window )
  Keyboard.set_modifier(MODIFIERKEY_ALT);
  Keyboard.set_key1(KEY_F2);
  Keyboard.send_now();

  // Set blank key
  Keyboard.set_modifier(0);
  Keyboard.set_key1(0);
  Keyboard.send_now();

  delay(1500);
 
  // Send the command
  Keyboard.print(SomeCommand);
  Keyboard.set_key1(KEY_ENTER);
  Keyboard.send_now();

  // Reset key
  Keyboard.set_key1(0);
  Keyboard.send_now();
}
