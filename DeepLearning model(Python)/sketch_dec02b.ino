#include <ESP8266WiFi.h>
#include <SoftwareSerial.h>
#include <FirebaseArduino.h>
#include <ArduinoJson.h>
#include <ESP8266HTTPClient.h>
 
// Set these to run example.
#define FIREBASE_HOST "realtimedatabase-d0526-default-rtdb.asia-southeast1.firebasedatabase.app"
#define FIREBASE_AUTH "SpqXZPZBT7aorQYClyai9CPjQ6rVmctOpp6y1YVJ"
#define WIFI_SSID "iphone_nti"                                  
#define WIFI_PASSWORD "Isuranga77"   

void setup()
{ 
 
 // Debug console
 Serial.begin(9600);
// connect to wifi.
 WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
 Serial.print("connecting");
 while (WiFi.status() != WL_CONNECTED)
 {
 Serial.print(".");
 delay(500);
 }
 Serial.println();
 Serial.print("connected: ");
 Serial.println(WiFi.localIP());
 
 Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
if(Firebase.failed())
 {
 Serial.print(Firebase.error());
 }
 else{
 
 Serial.print("Firebase Connected");
 Firebase.setString("/CardioX/Value","0");
 }
}
 
void loop()
{
for(int i = 0; i <= 100; i++)
 { 
    Firebase.setInt("/CardioX/Value",i);
    delay(1000);
 }
 
}
