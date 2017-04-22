extends Node

var rocket = preload("res://Enemies/ToxicRocket.scn");
var ntbe = preload ("res://Enemies/NotTooBadEnemy.scn");
var vbe = preload ("res://Enemies/VeryBadEnemy.scn");
var be = preload ("res://Enemies/BadEnemy.scn");
var bamfe = preload ("res://Enemies/BadAssMotherF**erEnemy.scn");
var create_enemy;
var n_enemy = 0;


func _ready():
	set_process(true);
	Globals.set("gameRunning",true);
	Globals.set("BossBattle",false);
	Globals.set("enemy_cnt", 0);
	
func _process(delta):
	
	#print(Globals.get("enemy_cnt"))
	
	if (Globals.get("enemy_cnt") == 15):
		create_enemy = false
		Globals.set("enemy_cnt", Globals.get("enemy_cnt")+1)
		print("ENtro en 15");
		Globals.set("BossBattle",true);
		var newBE = be.instance();
		add_child(newBE);
		Globals.set("triggerStarSound",true);
		newBE.set_owner(self);
	
	elif (Globals.get("enemy_cnt") == 31):
		create_enemy = false;
		Globals.set("enemy_cnt", Globals.get("enemy_cnt")+1)
		Globals.set("BossBattle",true);
		var newVBE = vbe.instance();
		add_child(newVBE);
		Globals.set("triggerGodzillaSound",true);
		newVBE.set_owner(self);
	
	elif (Globals.get("enemy_cnt") == 50):
		create_enemy = false
		Globals.set("enemy_cnt", Globals.get("enemy_cnt")+1)
		Globals.set("BossBattle",true);
		var newBAMFE = bamfe.instance();
		add_child(newBAMFE);
		Globals.set("triggerSHSound",true);
		newBAMFE.set_owner(self);
	
	elif create_enemy==true:
		var number = rand_range(1,3);
		if number <2 && Globals.get("BossBattle")==false:
			var newRocket = rocket.instance();
			add_child(newRocket);
			newRocket.set_owner(self);
		elif number<4 && Globals.get("BossBattle")==false:
			var newNTBE = ntbe.instance();
			add_child(newNTBE);
			newNTBE.set_owner(self);
	create_enemy=false;

func _on_Timer_timeout():
	if Globals.get("gameRunning")==true:
		create_enemy = true;
