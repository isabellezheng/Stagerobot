#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include <sensor_msgs/Range.h>
#include <iostream>

using namespace std;

ros::Publisher pub;
ros::Subscriber sub;

void rangeCallBack( const sensor_msgs::Range.h>
{
	std_msgs::Int16 vitessegauche;
	

	if(range_msg.range > 40){
		vitessegauche = 64;
			
	}
	else if(range_msg.range < 20){
		vitessegauche = 0;
			
	}
	else{
		vitessegauche = 32;
	}
	pub.publish(vitessegauche);
}

int main(int argc, char** argv){
	ros::init(argc, argv, "controlmoteurpardis");
	ros::NodeHandle n;
	pub = n.advertise<std_msgs::Int16>("/moteurgauche",1);
	sub = n.subscribe("range_msg",10,&rangeCallBack);
	ros::spin();
}
