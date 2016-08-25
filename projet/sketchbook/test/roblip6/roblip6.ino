/* the file control the R/C servos moteurs using ROS and the arduino
* for the project roblip6
*/



#include <Servo.h>
#include <ros.h>
#include <std_msgs/Int16.h>
#include <ros/time.h>

#include <std_msgs/Int16MultiArray.h>

#include <SharpIR.h>
#define model 1080

#include <Sabertooth.h>

Sabertooth ST(128);

ros::NodeHandle nh;

Servo servocambase;
Servo servocamhaut;

std_msgs::Int16MultiArray range_msg;

ros::Publisher pub_range("range_data",&range_msg);

const int analog_pindroite = 0;
const int analog_pincentre = 1;
const int analog_pingauche = 2;

char frameid[] = "/ir_ranger";

float getRange(int pin_num){
  SharpIR sharp(pin_num, 25, 93, model);
  float sample = sharp.distance();
  return sample;
}


void servocambase_cb(const std_msgs::Int16& cmd_msg){
  servocambase.write(cmd_msg.data);
  delay(2000);
}
void servocamhaut_cb(const std_msgs::Int16& cmd_msg){
  servocamhaut.write(cmd_msg.data);
  delay(2000);
}

void moteur_cb_gauche( const std_msgs::Int16& cmd_msg){

  int power_gauche = (int)cmd_msg.data;
  ST.motor(2, power_gauche);
}

void moteur_cb_droite( const std_msgs::Int16& cmd_msg){

  int power_droite = (int)cmd_msg.data;
  ST.motor(1, power_droite);
}



ros::Subscriber<std_msgs::Int16> sub_gauche("moteurgauche", moteur_cb_gauche);
ros::Subscriber<std_msgs::Int16> sub_droite("moteurdroite", moteur_cb_droite);
ros::Subscriber<std_msgs::Int16> subcambase("servocambase", servocambase_cb);
ros::Subscriber<std_msgs::Int16> subcamhaut("servocamhaut", servocamhaut_cb);

void setup(){
  
  nh.initNode();
  range_msg.layout.dim = (std_msgs::MultiArrayDimension *)malloc(sizeof(std_msgs::MultiArrayDimension)*2);
  range_msg.layout.dim[0].label = frameid;
  range_msg.layout.dim[0].size = 3;
  range_msg.layout.dim[0].stride = 1*3;
  range_msg.layout.data_offset = 0;
  //range_msg.layout.dim_length = 1;
  range_msg.data = (int *)malloc(sizeof(int)*3);
  range_msg.data_length = 3;
  
  nh.advertise(pub_range);
  nh.subscribe(sub_gauche);
  nh.subscribe(sub_droite);
  nh.subscribe(subcambase);
  nh.subscribe(subcamhaut);
  
  servocambase.attach(9);
  servocamhaut.attach(10);
  
  SabertoothTXPinSerial.begin(9600);
  ST.autobaud();
  //ST.setTimeout(2000);

}


void loop(){

  delay(2000);
 /* 
  for(int i= 0; i < 3; i++){
    range_msg.data[i]  = getRange(i);
    
  }
  pub_range.publish(&range_msg);
  */
  nh.spinOnce();
  delay(1);
}
