extends Node

var rocket = preload("res://Enemies/ToxicRocket.scn");
var enemy1 = preload("res://Enemies/NotTooBadEnemy.scn");

var create_enemy;

func _ready():
	set_process(true);
	Globals.set("gameRunning",true);

func _process(delta):
	if create_enemy==true:
		var number = rand_range(1,3);
		if number <2:
			var newRocket = rocket.instance();
			add_child(newRocket);
			newRocket.set_owner(self);
		if number <3:
			var newNTB = enemy1.instance();
			add_child(newNTB);
			newNTB.set_owner(self);
		create_enemy=false;

func _on_Timer_timeout():
	if Globals.get("gameRunning")==true:
		create_enemy = true;
