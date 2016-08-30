#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include <std_msgs/Int16MultiArray.h>
#include <sensor_msgs/Range.h>
#include <geometry_msgs/PoseWithCovariance.h>
#include <geometry_msgs/TransformStamped.h>
#include <iostream>
#include <ros/time.h>

using namespace std;

ros::Publisher pubgauche;
ros::Publisher pubdroite;
ros::Subscriber subaruco;
std_msgs::Int16 vit_g;
std_msgs::Int16 vit_d;
ros::Duration five_sec(5,0);

int CPT = 0;
int timer1 = 50;
int timer2 = 100;



void arucoCallBack(const geometry_msgs::TransformStamped &transformMsg){
	
	void observer(){
		ROS_INFO("the aruco is in the sight of camera,angle = %f",transformMsg.transform.translation.x/transformMsg.transform.translation.z);
		CPT = 1;

	}  
	
	void tourner(){
		vit_g.data = 32;
		vit_d.data = 0;
		
		ROS_INFO("z= %f , x = %f", transformMsg.transform.translation.z, transformMsg.transform.translation.x);
		ROS_INFO("advertise the info gauche %d, droite %d", vit_g.data,vit_d.data);
		
		while(timer1 ){
		pubgauche.publish(vit_g);
		pubdroite.publish(vit_d);
		timer1 --;
		}
		CPT = 2;
	}	

	void avancer(){
		vit_g.data = 32;
		vit_d.data = 32;

		ROS_INFO("z= %f , x = %f", transformMsg.transform.translation.z, transformMsg.transform.translation.x);
		ROS_INFO("advertise the info gauche %d, droite %d", vit_g.data,vit_d.data);
		
		while(timer2 ){
		pubgauche.publish(vit_g);
		pubdroite.publish(vit_d);
		timer2 --;
		}
	}



	switch(CPT){
		case 0:
			observer();
			break;
		case 1:	
			tourner();
			break;
		case 2:
			avancer();
			break;
		default:
			break;


	}

	ROS_INFO("z= %f , x = %f", transformMsg.transform.translation.z, transformMsg.transform.translation.x);
	ROS_INFO("advertise the info gauche %d, droite %d", vit_g.data,vit_d.data);

	ros::Rate loop_rate(10);
	
	while( ){
		pubgauche.publish(vit_g);
		pubdroite.publish(vit_d);
		ros::spin();
		loop_rate.sleep();
	}


}

int main(int argc, char** argv){

	ros::init(argc, argv, "cam_node");
	ros::NodeHandle nh;
	pubgauche = nh.advertise<std_msgs::Int16>("/moteurgauche",10);
	pubdroite = nh.advertise<std_msgs::Int16>("/moteurdroite",10);
	subaruco = nh.subscribe("/aruco_single/transform",10,&arucoCallBack);
	//lancer une fctr à implémenter qui 

	ros::spin();



	
}


