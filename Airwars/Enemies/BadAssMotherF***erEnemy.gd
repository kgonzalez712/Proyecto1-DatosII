extends KinematicBody2D

var hitpoints=50;
var points=500;
var speedx=100;
var speedy=-100;


func _fixed_process(delta):
	if get_pos().x<100:
		speedx=speedx*-1;
	if get_pos().x>600 :
		speedx=speedx*-1;
	move(Vector2((speedx)*delta,0));
#	move(Vector2(speedx*delta,speedy*delta));
	if Globals.has("gameRunning"):
		if Globals.get("gameRunning")==false:
			get_node(".").queue_free();
	if get_pos().y>720:
		get_node(".").queue_free();
	if hitpoints==0:
		Globals.set("BossBattle",false);
		Globals.set("triggerIsaacSound",true);
		if Globals.has("gameScore"):
			Globals.set("gameScore",Globals.get("gameScore") + points);
			get_node(".").queue_free();

func _ready():
	set_fixed_process(true);
	set_pos(Vector2(100,120));

func type():
	return "Boss"