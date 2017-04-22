extends KinematicBody2D

var hitpoints=1;
var points=10;

func _fixed_process(delta):
	if Globals.has("gameRunning"):
		if Globals.get("gameRunning")==false:
			get_node(".").queue_free();
	if get_pos().y>720:
		get_node(".").queue_free();
	if hitpoints==0:
		Globals.set("triggerEnemysound",true);
		if Globals.has("gameScore"):
			Globals.set("gameScore",Globals.get("gameScore") + points);
			get_node(".").queue_free();

func _ready():
	set_fixed_process(true);
	set_pos(Vector2(rand_range(50,700),100));

