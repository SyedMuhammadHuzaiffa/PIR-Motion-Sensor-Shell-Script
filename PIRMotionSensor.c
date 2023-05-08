#include <iostream>
#include <pigpio.h>

#define LED_PIN 17

int main()
{
    if (gpioInitialise() < 0) {
        std::cerr << "Failed to initialize pigpio library." << std::endl;
        return 1;
    }

    gpioSetMode(LED_PIN, PI_OUTPUT);

    for (int i = 0; i < 10; i++) {
        gpioWrite(LED_PIN, 1);
        time_sleep(0.5);
        gpioWrite(LED_PIN, 0);
        time_sleep(0.5);
    }

    gpioTerminate();
    return 0;
}
