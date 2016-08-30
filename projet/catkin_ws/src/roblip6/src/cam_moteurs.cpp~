#include <ros/ros.h>
#include <ros/time.h>
#include <std_msgs/Int16.h>
#include <std_msgs/Int16MultiArray.h>
#include <sensor_msgs/Range.h>
#include <std_msgs/Bool.h>
#include <geometry_msgs/PoseWithCovariance.h>
#include <geometry_msgs/TransformStamped.h>
#include <iostream>

#include <cmath>
#include <ros/exception.h>
#include <sys/time.h>



using namespace std;

ros::Publisher pubgauche;
ros::Publisher pubdroite;

ros::Subscriber subaruco;
ros::Time lastCallback;
std_msgs::Int16 vit_g;
std_msgs::Int16 vit_d;
std_msgs::Bool arucoROSSeen;

ros::Publisher lost_pub;

bool arucoSeen = false;



class Transform{
public:
Transform(){

subaruco = nh.subscribe("/aruco_single/transform",10,&Transform::callback,this);

}
void callback(const geometry_msgs::TransformStamped &t){
  	arucoSeen = true;
	lastCallback = ros::Time::now();

	this->x = t.transform.translation.x;
	this->y = t.transform.translation.y;
	this->z = t.transform.translation.z;
	

}

float get_x(){
	return x;	
}
float get_y(){
	return y;	
}
float get_z(){
	return z;
}
private :
float x,y,z;
ros::NodeHandle nh;
ros::Subscriber subaruco;
};


void loop(float x,float y, float z,bool arucoSeen){

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
	else if(!arucoSeen){
		ROS_INFO("aruco not seen for 5 secs, start to sweep to search it");
		vit_g.data = -32;
		vit_d.data = 32;
	ROS_INFO("advertise the info gauche %d, droite %d", vit_g.data,vit_d.data);
		
	}

}





int main(int argc, char** argv){
	ros::init(argc, argv, "cam_moteurs_node");
	ros::NodeHandle nh;
	ros::Duration dt;
	Transform transform;
	
	lost_pub = nh.advertise<std_msgs::Bool>("/arucoSeen",10);
	pubgauche = nh.advertise<std_msgs::Int16>("/moteurgauche",10);
	pubdroite = nh.advertise<std_msgs::Int16>("/moteurdroite",10);
	lastCallback = ros::Time::now();
	
	ros::Rate loop_rate(10);
	

	while(ros::ok()){
		dt = ros::Time::now() - lastCallback;
		
		
		if(dt.toSec() > 5)
			arucoSeen = false;
		
		ROS_INFO("right now the duration is %.f",dt.toSec());

		arucoROSSeen.data = arucoSeen;
		lost_pub.publish(arucoROSSeen);
		

		float x,y,z;
		x = transform.get_x();
		y = transform.get_y();
		z = transform.get_z();
		

		loop(x,y,z,arucoSeen);

		pubgauche.publish(vit_g);
		pubdroite.publish(vit_d);
		ros::spinOnce();
		loop_rate.sleep();
		
		
	}
	
}


