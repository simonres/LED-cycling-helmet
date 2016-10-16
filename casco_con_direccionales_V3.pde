const int buttonPin = 2;// the number of the pushbutton pin
const int butpin = 3;
const int ledpin2 = 9;
const int ledPin = 8;// the number of the LED pin
const int fadingDelay = 25;  // the speed of LED fading (higher value = slower)

// variables will change:
int butState = 0;
int buttonState = 0; // variable for reading the pushbutton status
boolean fadingState = false; // determines whether the LED needs to be turned on or off

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  pinMode(ledpin2, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);
  pinMode(butpin, INPUT);
}

void loop() {
  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);
  butState = digitalRead(butpin);
  // check whether the button was pressed
  if (buttonState == HIGH) {
    // check the current LED status (on/off)
    if (fadingState == false) {
      // turn on the LED
      for (int j =1; j<=10; j+=1){
        for (int i = 0; i <= 255; i += 10) {
          analogWrite(ledPin, i);
          delay(fadingDelay);
        }
        for (int i = 255; i >= 0; i -= 10) {
          analogWrite(ledPin, i);
          delay(fadingDelay);
        }
      }
      for (int i = 0; i <= 255; i += 5) {
        analogWrite(ledPin, i);
        delay(fadingDelay);
      }
      
    } else {
      // turn off the LED
      for (int i = 255; i >= 0; i -= 5) {
        analogWrite(ledPin, i);
        delay(fadingDelay);
      }      
    }
    fadingState = !fadingState;  // save the current LED state (on/off)
  }

  if (butState == HIGH) {
    // check the current LED status (on/off)
    if (fadingState == false) {
      // turn on the LED
      for (int j =1; j<=10; j+=1){
        for (int i = 0; i <= 255; i += 10) {
          analogWrite(ledpin2, i);
          delay(fadingDelay);
        }
        for (int i = 255; i >= 0; i -= 10) {
          analogWrite(ledpin2, i);
          delay(fadingDelay);
        }
      }

      for (int i = 0; i <= 255; i += 5) {
        analogWrite(ledpin2, i);
        delay(fadingDelay);
      }
    } else {
      // turn off the LED
      for (int i = 255; i >= 0; i -= 5) {
        analogWrite(ledpin2, i);
        delay(fadingDelay);
      }      
    }
    fadingState = !fadingState;  // save the current LED state (on/off)
  }
}
