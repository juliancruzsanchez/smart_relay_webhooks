/*
 * Project smartRelay
 * Description:
 * Author: Juliann Sanchez
 * Date:
 */

#include "Particle.h"
#include "web_server.h"
int relay = D7;
int togglerSpeed = 90;
int light = 0;

void setup()
{
  System.set(SYSTEM_CONFIG_SOFTAP_PREFIX, "HackedNode");

  pinMode(relay, OUTPUT);
  Particle.function("toggle", toggle);
  Particle.function("setLight", setLight);
  Particle.function("flash", flash);
  Particle.variable("light", light);
  WiFi.setHostname("HackedNode Smart Light");
}

int setLight(String data)
{
  if (data == "on")
    light = 1;
  else
    light = 0;
  return light;
}

int flash(String data)
{
  light = !light;
  delay(togglerSpeed);
  light = !light;
  delay(togglerSpeed);
  light = !light;
  delay(togglerSpeed);
  light = !light;
  return 1;
}

int toggle(String data)
{
  light = !light;
  return light;
}

void loop()
{
  ATOMIC_BLOCK()
  { // only this code runs from here on - no other threads or interrupts
    digitalWrite(relay, !light);
  }
}