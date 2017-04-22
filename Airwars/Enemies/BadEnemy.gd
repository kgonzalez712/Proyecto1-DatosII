extends KinematicBody2D

var hitpoints=20;
var points=100;
var speed=100;


func _fixed_process(delta):
	if Globals.has("gameRunning"):
		if get_pos().x<200:
			speed=speed*-1;
		if get_pos().x>600 :
			speed=speed*-1;
		move(Vector2((speed)*delta,0));
		if Globals.get("gameRunning")==false:
			get_node(".").queue_free();
	if get_pos().y>720:
		get_node(".").queue_free();
	if hitpoints==0:
		Globals.set("BossBattle",false);
		Globals.set("triggerEnemySound",true);
		if Globals.has("gameScore"):
			Globals.set("gameScore",Globals.get("gameScore") + points);
			get_node("/root/aw_root/info").set_text("Level 2")
			get_node(".").queue_free();

func _ready():
	set_fixed_process(true);
	set_pos(Vector2(400,150));

func type():
	return "enemy"