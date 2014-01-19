#include <SoftwareSerial.h>

SoftwareSerial mySerial(2, 0); // RX, TX

void setup()  
{
  // Open serial communications and wait for port to open:
  Serial.begin(57600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for Leonardo only
  }

  Serial.println("Ready to forward AT commands to JY-MCU: ");

  // set the data rate for the SoftwareSerial port
  mySerial.begin(38400); // Or 9600, depending on your firmware version
}

void loop() // run over and over
{
  if (mySerial.available())
    Serial.write(mySerial.read());
  if (Serial.available())
    mySerial.write(Serial.read());
}
