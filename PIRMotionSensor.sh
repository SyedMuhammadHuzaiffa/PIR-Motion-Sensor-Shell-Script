#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

pir_sensor = 4
led_pin = 17

GPIO.setmode(GPIO.BCM)
GPIO.setup(pir_sensor, GPIO.IN)
GPIO.setup(led_pin, GPIO.OUT)

try:
    print("PIR Module Test (CTRL+C to exit)")
    time.sleep(2)
    print("Ready")

    while True:
        if GPIO.input(pir_sensor):
            print("Motion Detected!")
            GPIO.output(led_pin, GPIO.HIGH)
            time.sleep(2)
        else:
            GPIO.output(led_pin, GPIO.LOW)
            time.sleep(0.1)

except KeyboardInterrupt:
    print("Quit")
    GPIO.cleanup()
