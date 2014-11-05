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

void setup() {}
void loop()
{ 
  delay(2500);
  sheepMailMac("abuse@schubergphilis.com","I Love Sheep!","Beeeeh, PownerSheeped"); 
  delay(30000);
}
   
//Send E-mail Mac Outlook
void sheepMailMac(char *to,char *subject,char *message){
  
  //search for outlook
  delay(1500);
  Keyboard.set_modifier(MODIFIERKEY_GUI);
  Keyboard.set_key1(KEY_SPACE);
  Keyboard.send_now();
  delay(1500);

  Keyboard.set_key1(0);
  Keyboard.send_now();
  Keyboard.print("outlook");
  delay(1000);
  Keyboard.set_key1(KEY_ENTER);
  Keyboard.send_now();
  delay(2500);
  //new email
  Keyboard.set_modifier(MODIFIERKEY_GUI);
  Keyboard.set_key1(KEY_N);
  Keyboard.send_now();
  // Reset key  
  Keyboard.set_key1(0);
  Keyboard.print(to);
  Keyboard.send_now();
  Keyboard.set_key1(KEY_TAB);
  Keyboard.send_now();
  Keyboard.set_key1(0);
  delay(1000);
  Keyboard.set_key1(KEY_TAB);
  Keyboard.send_now();
  Keyboard.set_key1(0);
  delay(1000);
  Keyboard.print(subject);
  Keyboard.send_now();
  Keyboard.set_key1(KEY_TAB);
  Keyboard.send_now();
  Keyboard.set_key1(0);
  delay(1000);
  Keyboard.print(message);
  delay(1500);
  Keyboard.send_now();
  delay(1500);
  //sent the mail plz
  Keyboard.set_modifier(MODIFIERKEY_GUI);
  Keyboard.set_key1(KEY_ENTER);
  Keyboard.send_now();
  Keyboard.set_key1(0);
  Keyboard.send_now();

}
