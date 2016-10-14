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
boolean activate = false;

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  pinMode(ledpin2, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);
  pinMode(butpin, INPUT);
}
 
 
 
void loop() {
  delay(200);
  digitalWrite(ledpin2, LOW);
  delay(200);
  // read the state of the pushbutton value:
  buttonState = digitalRead(buttonPin);
  butState = digitalRead(butpin);
  // check whether the button was pressed
  if (buttonState == HIGH) {
    // check the current LED status (on/off)
    if (fadingState == false) {
      // turn on the LED
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

  if (butState == HIGH ){
   activate = true; 
  }
  
  if (butState == HIGH && counter > 0 ){
   activate = false; 
   counter=0;
  }
  

  
  if (butState == LOW && activate) {
          digitalWrite(ledpin2, HIGH);   // turn the LED on
          //delay(200);
         counter++; 
          // wait for a second
  //        digitalWrite(ledpin2, LOW);   // turn the LED off
  //        delay(200);              // wait for a second
    } //else {
      // turn off the LED
            
    //}
    //fadingState = !fadingState;  // save the current LED state (on/off)
 // }
}
