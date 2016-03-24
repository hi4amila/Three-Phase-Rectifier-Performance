int output;
float voltage;
float current;
float power;
float timer;

int Switch1=2;
int Switch2=3;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  timer=0;

  pinMode(Switch1,OUTPUT);
  pinMode(Switch2,OUTPUT);

  digitalWrite(Switch1, HIGH);
  digitalWrite(Switch2, HIGH);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  delay(5);
  timer= timer+ 0.005;
  output= analogRead(A0); 
  voltage= output*3.4/1023*2;
  current= voltage*1000/5;
  power= voltage*voltage/5;
  
  Serial.print(timer);
  Serial.print(" ");
  Serial.print(voltage);
  Serial.print(" ");
  Serial.print(current);
  Serial.print(" ");
  Serial.println(power);
  
}
