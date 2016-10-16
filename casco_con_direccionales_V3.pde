const int buttonPin = 2;// the number of the pushbutton pin
const int butpin = 3;
const int ledpin2 = 9;
const int ledPin = 8;// the number of the LED pin
const int fadingDelay = 25;  // the speed of LED fading (higher value = slower)

// variables will change:
int counter = 0;
int butState = 0;
int buttonState = 0; // variable for reading the pushbutton status
boolean fadingState = false; // determines whether the LED needs to be turned on or off
boolean activateL = false;

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  pinMode(ledpin2, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);
  pinMode(butpin, INPUT);
}
 
 

// Variables will change :
int ledState = LOW;             // ledState used to set the LED

// Generally, you should use "unsigned long" for variables that hold time
// The value will quickly become too large for an int to store
unsigned long previousMillis = 0;        // will store last time LED was updated
unsigned long previousbutton = 0;
unsigned long currentbutton = 0;

// constants won't change :
const long interval = 300;           // interval at which to blink (milliseconds)

 
void loop() {
  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);
  butState = digitalRead(butpin);
  if (butState == HIGH ){
   activateL = true;  
  }
  if (buttonState == HIGH ){
   activateL = false;  
  }
  

  if (activateL == false){
    digitalWrite(ledpin2, LOW);
  }
  
  
  // here is where you'd put code that needs to be running all the time.

  // check to see if it's time to blink the LED; that is, if the
  // difference between the current time and last time you blinked
  // the LED is bigger than the interval at which you want to
  // blink the LED.
  unsigned long currentMillis = millis();

  if ( currentMillis - previousMillis >= interval  && activateL ) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;
    // if the LED is off turn it on and vice-versa:
    if ( ledState == LOW  ) {
      ledState = HIGH;
    } else {
      ledState = LOW;
    }

    // set the LED with the ledState of the variable:
    digitalWrite(ledpin2, ledState);
  }
}
