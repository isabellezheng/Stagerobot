#include <ros/ros.h>
#include <ros/time.h>
#include <std_msgs/Int16.h>
#include <std_msgs/Int16MultiArray.h>
#include <sensor_msgs/Range.h>
#include <geometry_msgs/PoseWithCovariance.h>
#include <geometry_msgs/TransformStamped.h>
#include <iostream>

class Transform{
public:
float x,y,z;

void callback(const geometry_msgs::TransformStamped& t);
float get_x(){
	return x;	
}
float get_y(){
	return y;	
}
float get_z(){
	return z;
}
};

using namespace std;

ros::Publisher pubgauche;
ros::Publisher pubdroite;
ros::Publisher lost_pub;
ros::Subscriber subaruco;

std_msgs::Int16 vit_g;
std_msgs::Int16 vit_d;
std_msgs::Int16 aruco_lost;


ros::Time lastCallback = ros::Time::now();

bool arucoSeen = false;

void loop(){
float x,y,z;
x = Transform::get_x();
y = Transform::transform.get_y();
z = Transform::transform.get_z();
	if(arucoSeen){
		if(z > 0.4){
		vit_g.data = 64;
		vit_d.data = 64;

	}	

	else if(z < 0.4 && z > 0.1){
		if(x < 0.02 && x > -0.02){
			vit_g.data = 32;
			vit_d.data = 32;
		}
		else if(x > 0.02){
			vit_g.data = 32;
			vit_d.data = 25;
		}		
		else if(x < -0.02){
			vit_g.data = 25;
			vit_d.data = 32;
		}
	}

	else{
		vit_g.data = 0;
		vit_d.data = 0;
	}
	ROS_INFO("z= %f , x = %f", z, x);
	ROS_INFO("advertise the info gauche %d, droite %d", vit_g.data,vit_d.data);

	}

}

void Transform::CallBack(const geometry_msgs::TransformStamped &t){
  	arucoSeen = true;
	lastCallback = ros::Time::now();
	this.x = t.transform.translation.x;
	this.y = t.transform.translation.y;
	this.z = t.transform.translation.z;

}


}

int main(int argc, char** argv){
	ros::init(argc, argv, "cam_moteurs_node");
	ros::NodeHandle nh;
	ros::Time dt;
	Transform transform;
	pubgauche = nh.advertise<std_msgs::Int16>("/moteurgauche",10);
	pubdroite = nh.advertise<std_msgs::Int16>("/moteurdroite",10);

	subaruco = nh.subscribe("/aruco_single/transform",10,&Transform::callback,&transform);

	while(ros::ok()){
		loop();
		pubgauche.publish(vit_g);
		pubdroite.publish(vit_d);
		ros::spin();
		dt = ros::Time::now() - lastCallback;
		if(dt > 50)
			arucoSeen = false;
	}
	
}


