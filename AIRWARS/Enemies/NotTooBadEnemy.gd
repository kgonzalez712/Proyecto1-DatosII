extends KinematicBody2D

var hitpoints=1;
var points=20;
var acc=100;
var kin_speed=Vector2(0,0);


func _fixed_process(delta):
	if Globals.has("gameRunning"):
		if Globals.get("gameRunning")==false:
			get_node(".").queue_free();
#	if get_pos().y>720:
#		get_node(".").queue_free();
	if hitpoints==0:
		if Globals.has("gameScore"):
			Globals.set("gameScore",Globals.get("gameScore") + points);
			get_node(".").queue_free();

func _ready():
	set_fixed_process(true);
	set_pos(Vector2(rand_range(50,700),70));
	#set_angular_velocity(rand_range(5,-5));