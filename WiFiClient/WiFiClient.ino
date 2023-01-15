/*
    This sketch establishes a TCP connection to a "quote of the day" service.
    It sends a "hello" message, and then prints received data.
*/

#include <ESP8266WiFi.h>
#include <ArduinoJson.h>
#include <Bridge.h>
#include <ESP8266HTTPClient.h>


#ifndef STASSID
#define STASSID "FRITZ!Box 7412 Wifi"
#define STAPSK "86431650382204543153"
#endif

const char* ssid = STASSID;
const char* password = STAPSK;

const char* host = "http://httpbin.org/post";
const uint16_t port = 443;

void setup() {
  Serial.begin(9600);
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  static bool wait = false;

  Serial.print("connecting to ");
  Serial.println(host);


  if (wait) {
    delay(300000);  // execute once every 5 minutes, don't flood remote service
  }
  wait = true;

  sendJSON("hello", "world", host);

}

void sendJSON(String param, String value, String host){
  // Prepare JSON document
DynamicJsonDocument doc(2048);
doc[param] = value;

// Serialize JSON document
String json;
serializeJson(doc, json);

WiFiClient client;  // or WiFiClientSecure for HTTPS
HTTPClient http;

// Send request
http.begin(client, host);
http.POST(json);

// Read response
Serial.print(http.getString());

// Disconnect
http.end();
}
