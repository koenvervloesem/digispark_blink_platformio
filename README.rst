######################################
Digispark Blink example for PlatformIO
######################################

.. image:: https://github.com/koenvervloesem/digispark_blink_platformio/workflows/Build/badge.svg
   :target: https://github.com/koenvervloesem/digispark_blink_platformio/actions
   :alt: Continuous integration

.. image:: https://img.shields.io/github/license/koenvervloesem/digispark_blink_platformio.svg
   :target: https://github.com/koenvervloesem/digispark_blink_platformio/blob/main/LICENSE
   :alt: License

This is an example project for `PlatformIO <https://platformio.org/>`_ to build the canonical blink code for the `Digispark USB development board <http://digistump.com/products/1>`_ with an Atmel AVR ATtiny85 microcontroller.

.. note::

  This doesn't use the Arduino framework, but directly uses the native AVR registers.

You can use this project as a template to build your own AVR code for the Digispark with PlatformIO.

************
Requirements
************

You need PlatformIO and the `Atmel AVR platform <https://docs.platformio.org/en/latest/platforms/atmelavr.html>`_ in PlatformIO. You can install both with:

.. code-block:: shell

  pip3 install platformio
  pio platform install atmelavr

The Digispark runs the `Micronucleus <https://github.com/micronucleus/micronucleus>`_ bootloader. If you've bought it recently, the bootloader has a recent version that isn't supported by PlatformIO's older ``micronucleus`` command. Therefore, you need to build the newer version of the command. On Ubuntu or Debian this goes like this:

.. code-block:: shell

  git clone https://github.com/micronucleus/micronucleus.git
  cd micronucleus/commandline
  sudo apt install libusb-dev
  make
  sudo make install

The `platformio.ini <https://github.com/koenvervloesem/digispark_blink_platformio/blob/main/platformio.ini>`_ file in this example project defines a custom command to refer to the ``micronucleus`` command you've built.

*****
Usage
*****

Build the code with:

.. code-block:: shell

  pio run

Upload the code to the Digispark with:

.. code-block:: shell

  pio run -t upload

Plug in the device into a USB port of your computer when asked.

If you want to use this project as a template for your own projects, have a look at the `GitHub Action <https://github.com/koenvervloesem/digispark_blink_platformio/blob/main/.github/workflows/build.yml>`_ file. It automatically builds the code on each push and pull request and checks for errors and warnings. There's also a `Makefile <https://github.com/koenvervloesem/digispark_blink_platformio/blob/main/Makefile>`_ to make checking and building code easier.

*******
License
*******

This project is provided by `Koen Vervloesem <http://koen.vervloesem.eu>`_ as open source software with the MIT license. See the `LICENSE file <LICENSE>`_ for more information.
