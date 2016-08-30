/*
 * rosserial node that subscribes to aruco transform node and turns servo towards it, while
 * constantly broadcasting its tf (between servo_mount and camera on the servo).
 *
 * The setup:
 * A teensy is connected to a Linux-box running ROS over USB cable, and three wires going to a servo.
 * The servo is fixed to the robot, and a camera is mounted on the servo (the rotating part). The camera
 * sends camera data to the Linux-box, which uses ar_sys to detect aruco markers, and then it publishes
 * a transform message (indicating relative pose from camera to marker). This node uses that transform to
 * calculate how far off the marker is from the camera (yaw angle only), and decides to turn in the direction
 * of the marker. This teensy node is programmed in Arduino (for Teensy 3.1) and interfaces with ROS using
 * the rosserial_python serial_node.
 *
 * If this teensy node fails to see the marker for a short period (SWEEP_TIMER_LIMIT), it starts sweeping the servo
 * back and forth. If the marker is still not seen for a longer period (LOST_TIMER_LIMIT), the node declares itself
 * lost and publishes a true value on the lost topic once. Whenever the node sees a marker again, it resets both timers
 * and publishes a false value on the lost topic once. As long as the node is not sweeping or lost, it will turn towards
 * the aruco marker.
 *
 * Published Topics:
 * /tf (broadcasts tf from camera to servo_mount)
 * /servo_camera_state (boolean true if lost and false if not lost)
 * 
 *
 * Subscribed Topics:
 * /ar_single_board/transform (transform with pose of marker relative to camera)
 * 
 */
#include <ros.h>
#include <tf/tf.h>
#include <tf/transform_broadcaster.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Float32.h>
#include <ros/time.h>
#include <Servo.h>
#include <TimerObject.h>

Servo servo;            // create servo object to control a servo
float servo_position;     // variable to store the servo position

enum turn_direction{
  CLOCKWISE,
  COUNTER_CLOCKWISE,
  NONE
};
turn_direction turn = CLOCKWISE;  // direction to turn.
turn_direction last_turn = turn;

unsigned long previous_millis = 0;           // stores time when last loop() called
unsigned long time_seen_marker = millis();   // stores time since last seen marker
bool sweeping = true;                        // variable to store whether sweeping (start off sweeping)

// constants
const float ERROR_THRESHOLD = 10.0f;        // in degrees
const int SWEEPING_DELAY_INCREMENT = 1000;      // how long to wait before moving the servo one step (in milliseconds)
const float SWEEPING_SERVO_INCREMENT = 20.0f;             // step angle to rotate servo by every loop (in degrees-ish)
const int FOLLOWING_DELAY_INCREMENT = 500;
const float FOLLOWING_SERVO_INCREMENT = 5.0f;

const int LED_PIN = 13;                    // LED pin number
const unsigned long SWEEP_TIMER_LIMIT = 1000000;     // in microseconds (1 second)
const unsigned long LOST_TIMER_LIMIT = 10000000;   // in microseconds (10 seconds)
const unsigned int SERVO_PIN = 9;
// ROS node handle
ros::NodeHandle nh;

// ROS message types and objects
std_msgs::Bool aruco_lost;
geometry_msgs::TransformStamped transform_message;
tf::TransformBroadcaster broadcaster;

// publishers and subscribers
ros::Publisher lost_pub("servo_camera_state", &aruco_lost);
ros::Publisher transform_pub("teensy_value", &transform_message);

void transform_callback(const geometry_msgs::TransformStamped& t);  // need to define
ros::Subscriber<geometry_msgs::TransformStamped> transform_sub("/aruco_single/transform", transform_callback );

// timers for interrupts that trigger callbacks
//IntervalTimer lost_timer;
//IntervalTimer sweep_timer;
TimerObject *sweep_timer = new TimerObject(SWEEP_TIMER_LIMIT);
TimerObject *lost_timer = new TimerObject(LOST_TIMER_LIMIT);

// tf child and parent frames
const char parent[] = "/servo_mount";
const char child[] = "/camera";

// called when we receive a transform from ar_sys
// calculates the error_angle (yaw) from the aruco marker and decides if to turn in a certain direction.
// also resets lost and sweeping timers after publishing that we're not lost
void transform_callback(const geometry_msgs::TransformStamped& t) {
  
  // first, publish the /tf
  broadcast_tf();
//  publish_tf();
  
  // calculate how far the center of the board is in angle degrees
  float error_angle = atan(t.transform.translation.x / t.transform.translation.z)  * 180 / PI;  // in degrees

  last_turn = turn;

  if (error_angle > ERROR_THRESHOLD)
    turn = CLOCKWISE;
  else if (error_angle < - ERROR_THRESHOLD)
    turn = COUNTER_CLOCKWISE;
  else
    turn = NONE;
    


  // if we thought we were lost (just found a marker after we thought we were lost),
  if (aruco_lost.data) {
    // publish that we're not lost
    aruco_lost.data = false;
    lost_pub.publish(&aruco_lost);
  }

  // reset lost timer (we are not lost anymore)
  //sweeping = false;
  //sweep_timer.begin(sweep_callback, SWEEP_TIMER_LIMIT);
  //aruco_lost.data = false;
  //lost_timer.begin(lost_callback, LOST_TIMER_LIMIT);
  sweeping = false;
  sweep_timer->setOnTimer(&sweep_callback);
  sweep_timer->Start();
  aruco_lost.data = false;
  lost_timer->setOnTimer(&lost_callback);
  lost_timer->Start();
}

//// broadcasts the tf between camera and servo_mount to ROS
void broadcast_tf()
{
  // instead of 0 to 180, make the values from -90 to 90 (where 0 is in the middle pointing forward)
  double angle = map(servo_position, 0, 180, -90, 90);

  // broadcast tf
  transform_message.transform.rotation = tf::createQuaternionFromYaw(angle * PI / 180);  // update rotation quaternion based on position of servo
  transform_message.header.stamp = nh.now();
  broadcaster.sendTransform(transform_message);
}

//void publish_tf()
//{
//  // instead of 0 to 180, make the values from -90 to 90 (where 0 is in the middle pointing forward)
//  double angle = map(servo_position, 0, 180, -90, 90);
//
//  // broadcast tf
//  transform_message.transform.rotation = tf::createQuaternionFromYaw(angle * PI / 180);  // update rotation quaternion based on position of servo
//  transform_message.header.stamp = nh.now();
//  transform_pub.publish(&transform_message);
//}

// fires when it's been LOST_TIMER_LIMIT microseconds since we received an ar_sys transform (since we've seen a marker)
// publishes lost message the first time
void lost_callback(void)
{
  // if aruco_lost is false, set it to true
  if (!aruco_lost.data && sweeping) {
    aruco_lost.data = true;
    // publish that we're lost
    lost_pub.publish(&aruco_lost);
  }
}

// fires when it's been SWEEP_TIMER_LIMIT microseconds since we've seen an ar_sys marker
void sweep_callback(void)
{
  // if sweeping is false, set it to true
  if (!sweeping) {
    sweeping = true;
  }
}

// start up code
void setup()
{
  pinMode(LED_PIN, OUTPUT);
  servo.attach(SERVO_PIN);        // attaches the servo on pin 9 to the servo object
  nh.initNode();            // initializes ROS node
  nh.advertise(lost_pub);
  nh.advertise(transform_pub);
  nh.subscribe(transform_sub);
  broadcaster.init(nh);     // initializes tf broadcaster

  servo_position = 90.0f;                // reference configuration
  transform_message.header.frame_id = parent;
  transform_message.child_frame_id = child;

  // set aruco_lost to true (start off being lost)
  aruco_lost.data = true;

  // initialize lost and sweeping timer and callback
  sweeping = false;
  sweep_timer->setOnTimer(&sweep_callback);
  sweep_timer->Start();
  aruco_lost.data = false;
  lost_timer->setOnTimer(&lost_callback);
  lost_timer->Start();
}

// turn the servo the desired direction (if any) and broadcast our tf.
void loop()
{
  unsigned long current_millis = millis();
  // if sweeping (we're lost), turn servo
  if (sweeping) {
    // uses a no-delay timer
    if (current_millis - previous_millis > SWEEPING_DELAY_INCREMENT) {
      previous_millis = current_millis;


      // if we're not turning, have it turn in an arbitrarily chosen direction
      if (turn == NONE) turn = last_turn;

      // sweep pos of servo
      if (turn == COUNTER_CLOCKWISE) {
        servo_position += SWEEPING_SERVO_INCREMENT;
      } else {
        servo_position -= SWEEPING_SERVO_INCREMENT;
      }

      servo.write(servo_position);              // move servo to position

//      broadcast_tf();

      // switch direction if we reached the limit
      if (servo_position <= 0) {
        last_turn = turn;
        turn = COUNTER_CLOCKWISE;
      } else if (servo_position >= 180) {
        last_turn = turn;
        turn = CLOCKWISE;
      }

    }
    // we're not sweeping
  } else {
    if (current_millis - previous_millis > FOLLOWING_DELAY_INCREMENT) {
      previous_millis = current_millis;

      // turn towards the aruco board
      // counter-clockwise
      if (turn == COUNTER_CLOCKWISE && servo_position < 180) {
        servo_position += FOLLOWING_SERVO_INCREMENT;
        // clockwise
      } else if (turn == CLOCKWISE && servo_position > 0) {
        servo_position -= FOLLOWING_SERVO_INCREMENT;
      }

      servo.write(servo_position);
//      broadcast_tf();

    }
  }

  digitalWrite(LED_PIN, aruco_lost.data);  // turn LED on or off based on whether we're lost or not
  nh.spinOnce();
}
