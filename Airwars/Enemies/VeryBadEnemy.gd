extends KinematicBody2D

var hitpoints=30;
var points=200;
var speed =100;


func _fixed_process(delta):

	if Globals.has("gameRunning"):
		if get_pos().y<87:
			speed=speed*-1;
		if get_pos().y>500 :
			speed=speed*-1;
		move(Vector2(0,speed*delta));
		if Globals.get("gameRunning")==false:
			get_node(".").queue_free();
	if get_pos().y>720:
		get_node(".").queue_free();
	if hitpoints==0:
		Globals.set("BossBattle",false);
		Globals.set("triggerEnemysound",true);
		if Globals.has("gameScore"):
			Globals.set("gameScore",Globals.get("gameScore") + points);
			get_node(".").queue_free();

func _ready():
	set_fixed_process(true);
	set_pos(Vector2(500,100));

func type():
	return "Boss"