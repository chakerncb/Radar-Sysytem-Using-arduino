# Arduino Radar

+ This project consists of an Arduino-based radar system that uses a servo motor and an ultrasonic sensor to measure distances at various angles. The data is sent to a Processing sketch via USB serial communication and displayed on a graphical interface.

## Project Structure


## Components

- Arduino board
- Ultrasonic sensor (HC-SR04)
- Servo motor
- USB cable

## Setup

### Arduino

1. Connect the ultrasonic sensor to the Arduino:
   - `Trig` pin to Arduino pin `10`
   - `Echo` pin to Arduino pin `11`
2. Connect the servo motor to Arduino pin `12`.
3. Upload the `arduino_ide_code.ino` sketch to the Arduino.

### Processing

1. Install Processing from [processing.org](https://processing.org/).
2. Open the `processing_code.pde` file in Processing.
3. Ensure the correct serial port is selected in the `setup()` function:
   ```java
   myPort = new Serial(this, "COM6", 9600); // Change "COM6" to the correct port
   ```

## Usage

1. Run the Processing sketch.
2. Power the Arduino board via USB.
3. Open the serial monitor in the Arduino IDE to view the data being sent to Processing.
4. The radar system will start rotating and measuring distances.

## Code Overview

### Arduino

- The `arduino_ide_code.ino` sketch initializes the servo motor and ultrasonic sensor.
- The servo motor rotates from 0 to 180 degrees and back.
- The ultrasonic sensor measures the distance to an object in front of it.
- The data is sent to the serial port in the format `angle:distance`.


### Processing

- The `processing_code.pde` sketch reads the data from the serial port.
- The data is split into angle and distance values.
- The angle is used to draw a line on the screen.
- The distance is used to calculate the line length.
- The lines are drawn in a circular pattern to create a radar effect.

## Owner

 - Name: Chaker Necibi
    - Email: chakerncb@outlook.com
