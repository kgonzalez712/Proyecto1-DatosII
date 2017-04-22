extends KinematicBody2D

var hitpoints=50;
var points=500;
var speedx=100;
var speedy=-100;
var ilaser = preload("res://Enemies/iLaser.tscn")
var lasercount = 0


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
			get_node("/root/aw_root/info").set_text("Endless level")
			get_node(".").queue_free();

func _ready():
	set_fixed_process(true);
	set_pos(Vector2(400,120));

func type():
	return "enemy"

func _on_Timer_timeout():
	lasercount += 1
	var tlaser = ilaser.instance()
	tlaser.set_name("ilaser" + str(lasercount))
	add_child(tlaser)
	tlaser.set_owner(self)
	tlaser.set_pos(Vector2(get_node(".").get_pos().x+475/2.5*0.4+6, get_node(".").get_pos().y))
	get_node("ilaser" + str(lasercount) + "/KinematicBody2D").add_collision_exception_with(get_node("."))
	pass # replace with function body
