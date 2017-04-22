extends KinematicBody2D

var hitpoints=1;
var speedx = 50
var speedy = 75
var points=10;
var lasercount = 0;
var nlaser = preload("res://Enemies/noobLaser.tscn")

func _fixed_process(delta):
	if get_pos().x<100:
		speedx=speedx*-1;
	if get_pos().x>600 :
		speedx=speedx*-1;
	move(Vector2((speedx)*delta,speedy*delta));
	
	if Globals.has("gameRunning"):
		if Globals.get("gameRunning")==false:
			get_node(".").queue_free();
	if get_pos().y>720:
		get_node(".").queue_free();
	if hitpoints==0:
		get_node(".").queue_free()
		Globals.set("enemy_cnt", Globals.get("enemy_cnt")+1)
		Globals.set("triggerEnemysound",true);
		if Globals.has("gameScore"):
			Globals.set("gameScore",Globals.get("gameScore") + points);

func _ready():
	set_fixed_process(true);
	set_pos(Vector2(rand_range(50,700),-5));

func _on_Timer_timeout():
	lasercount += 1
	var tlaser = nlaser.instance()
	tlaser.set_name("nlaser" + str(lasercount))
	add_child(tlaser)
	tlaser.set_owner(self)
	tlaser.set_pos(Vector2(get_node(".").get_pos().x, get_node(".").get_pos().y+75))
	get_node("nlaser" + str(lasercount) + "/KinematicBody2D").add_collision_exception_with(get_node("."))
	pass # replace with function body

func type():
	return "enemy"