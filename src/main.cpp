#include <Arduino.h>

void setup() {
    Serial.begin(115200);
    Serial.println("#hello, world");  // заголовок
    Serial.println("sinus;random");   // названия осей
    // заголовок и подписи можно отправить в любой момент
}

void loop() {
    static int i = 0;
    Serial.print(sin(++i / 10.0) * 20);
    Serial.print(';');
    Serial.println(random(-20, 20));
    delay(50);
}