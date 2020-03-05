# Advanced Arduino
## Hello Processing
#### Included Files:
<a href="HelloProcessing/HelloProcessing.pde">HelloProcessing</a> <br/>
<br/>
In this assignment I learned the basics of Processing. I made a circle that bounced off the edges, and printed "Hello World". I proceeded to randomize color, direction, and size for a more engaging user experience.
<br/><br/>
<IMG SRC="Media/HelloProcessingGif.gif"  width="250" height="250">
  
## Arduino to Processing
#### Included Files:
<a href="ProcessingFromArduino/ProcessingFromArduino.pde">ProcessingFromArduino</a> <br/>
<a href="ArduinoToProcessing/ArduinoToProcessing.ino">ArduinoToProcessing</a> <br/>
In this assignment I used Processing and Arduino to display the input from a potentiometer using a dial. The Arduino side was easy, just serial printing the reading from a potentiometer. The Processing side was a little more complex. I read the value from the Arduino, and mapped it from -120° to 120°. I used that value and the sine and cosine function to calculate the x and y coordinates of the tip of the dial, and drew a dial with degrees marked behind the needle.

<IMG SRC="Media/ArduinoToProcessingGif.gif"  width="250" height="250">

## Processing to Arduino
#### Included Files:
<a href="ProcessingToArduino/ProcessingToArduino.pde">ProcessingToArduino</a> <br/>
<a href="ArduinoFromProcessing/ArduinoFromProcessing.ino">ArduinoFromProcessing</a> <br/>
