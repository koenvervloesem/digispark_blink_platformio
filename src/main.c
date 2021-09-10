/* Atml AVR native blink example for the Digispark
 *
 * Copyright (C) 2021 Koen Vervloesem (koen@vervloesem.eu)
 *
 * SPDX-License-Identifier: MIT
 */
#include <avr/io.h>
#include <util/delay.h>

// Digispark built-in LED
// Note: on model A the LED is connected to PB1, on model B to PB0
#define PIN_LED PB1
#define DELAY_MS 1000

int main(void) {
  // Initalize LED pin as output
  DDRB |= (1 << PIN_LED);

  while (1) {
    PORTB ^= (1 << PIN_LED);
    _delay_ms(DELAY_MS);
  }

  return 0;
}
