#include <SPI.h>
#include <SD.h>
#include<LiquidCrystal.h>
#include <TinyGPS++.h>
#include <SoftwareSerial.h>
#include <MPU6050.h>
 int val;
 int buz=8;
static const int RXPin = 11, TXPin = 12;
static const uint32_t GPSBaud = 9600;
LiquidCrystal lcd(7, 6, 5, 9, 3, 2);
File myFile;
int vib_pin=A1;
TinyGPSPlus gps;

// The serial connection to the GPS device
SoftwareSerial ss(RXPin, TXPin);
float sats;      //Variable to store no. of satellites response
String bearing;


void displayInfo()
{Serial.println("hiii");
  Serial.print(F("Location: ")); 
  myFile.print("Location: ");
  if (gps.location.isValid())
  {
    Serial.print(gps.location.lat(), 6);
    myFile.print(gps.location.lat(), 6);
    Serial.print(F(","));
    myFile.print(",");
    myFile.print(gps.location.lng(), 6);
    Serial.print(gps.location.lng(), 6);
    sats = gps.satellites.value();    //get number of satellites
    Serial.print("sats:");
    myFile.print("sats:");
    myFile.print(sats);
    Serial.print(sats);
    bearing = TinyGPSPlus::cardinal(gps.course.value()); // get the direction
    Serial.print("Direction:");
    Serial.print(bearing);  
      
  }
  else
  {
    Serial.print(F("INVALID"));
  }

  Serial.print(F(" Speed in kmph: "));
  myFile.print("speed in kmph: ");
  if(gps.speed.isValid()){
    lcd.setCursor(0,1);
    lcd.print("speed:");
    lcd.print(gps.speed.kmph());
    Serial.println(gps.speed.kmph());
    myFile.print(gps.speed.kmph());
    Serial.print(F("\n"));
  }else{
    Serial.print(F("INVALID"));
  }
  Serial.print(F("  Date/Time: "));
  myFile.println("Date/Time: ");
  
  if (gps.date.isValid())
  {
    Serial.print(gps.date.month());
    myFile.print(gps.date.month());
    myFile.print("/");
    Serial.print(F("/"));
    Serial.print(gps.date.day());
        myFile.print(gps.date.day());
    myFile.print("/");
    Serial.print(F("/"));
    Serial.print(gps.date.year());
        myFile.print(gps.date.year());

  }
  else
  {
    Serial.print(F("INVALID"));
  }

  Serial.print(F(" "));
  if (gps.time.isValid())
  {
    if (gps.time.hour() < 10) Serial.print(F("0"));
    Serial.print(gps.time.hour());
    Serial.print(F(":"));
    if (gps.time.minute() < 10) Serial.print(F("0"));
    Serial.print(gps.time.minute());
    Serial.print(F(":"));
    if (gps.time.second() < 10) Serial.print(F("0"));
    Serial.print(gps.time.second());
    Serial.print(F("."));
    if (gps.time.centisecond() < 10) Serial.print(F("0"));
    Serial.print(gps.time.centisecond());
  }
  else
  {
    Serial.print(F("INVALID"));
  }

  Serial.println();
}


void setup() {
// Open serial communications and wait for port to open:
Serial.begin(9600);
lcd.begin(16, 2);
lcd.clear();
pinMode(8,OUTPUT);
  pinMode(vib_pin,INPUT);
  pinMode(A0,INPUT);
    ss.begin(GPSBaud);
   Serial.println(TinyGPSPlus::libraryVersion());
  //Serial.println(temp);
while (!Serial) {
; // wait for serial port to connect. Needed for native USB port only
}
Serial.print("Initializing SD card...");
if (!SD.begin(53)) {
Serial.println("initialization failed!");
while (1);
}
Serial.println("initialization done.");
double k1=longi();
double k2=lati();
// open the file. note that only one file can be open at a time,
// so you have to close this one before opening another.
for(int i=0;i<6;i++){double k1=longi();
double k2=lati();
   float k=analogRead(A0);
  float temp=k*500.0/1024;
  if(temp>40){
    tone(buz,150);
    
  }else{
    noTone(buz);
  }
  val=analogRead(A1);
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("t:");
  lcd.print(temp);
  lcd.print(",V:");
  lcd.print(val);
  Serial.println(temp);
   
    
 
myFile = SD.open("test.txt", FILE_WRITE);
// if the file opened okay, write to it:
if (myFile) {
Serial.print("Writing to test.txt...");
myFile.println("This is a test file :)");
lcd.setCursor(0,0);
 while (ss.available() > 0)
    if (gps.encode(ss.read()))
      displayInfo();

  if (millis() > 5000 && gps.charsProcessed() < 10)
  {
    Serial.println(F("No GPS detected: check wiring."));
    while(true);
  }
myFile.print("temperature is :");
Serial.print("temperature is:");
Serial.println(temp);
myFile.println(temp);
myFile.print("The magnitude of vibrations are: ");
myFile.println(val);



Serial.println("ATD+916302939993;");
delay(1000);
  Serial.println("AT+CMGF=1");    //To send SMS in Text Mode
  delay(1000);
  Serial.println("AT+CMGS=\"+916302939993\"\r"); //Change to destination phone number 
  delay(1000);
  Serial.println("the long and lat is:");//the content of the message
  delay(1000);
  Serial.print(k1);
  delay(1000);
  Serial.print(k2);
  delay(1000);
  Serial.println((char)26); //the stopping character Ctrl+Z
  delay(1000);


Serial.print("The magnitude of vibrations are: ");
Serial.println(val);

// close the file:
myFile.close();
Serial.println("done.");
} else {
// if the file didn't open, print an error:
Serial.println("error opening test.txt");
}}
delay(10000);}

  /*Serial.println("Removing test.txt...");
 int l= SD.remove("test.txt");
 Serial.println(l);// remove is a function in SD library to delete a file
  if (SD.exists("test.txt")) { //If the file still exist display message exist
    Serial.println("The test.txt exists.");
  } else { //If the file was successfully deleted display message that the file was already deleted.
    Serial.println("The test.txt doesn't exist.");
  }*/

void loop() {
// nothing happens after setup
}
double lati(){
 if (gps.location.isValid()){
  double k=gps.location.lat();
  return k;
 }else{
  return 0;
 }
}
double longi(){
   if (gps.location.isValid()){
  double k=gps.location.lng();
  return k;
 }else{
  return 0;
 }
}
