extends Node

var rocket = preload("res://Enemies/ToxicRocket.scn");
var ntbe = preload ("res://Enemies/NotTooBadEnemy.scn");
var vbe = preload ("res://Enemies/VeryBadEnemy.scn");
var bamfe = preload ("res://Enemies/BadAssMotherF**erEnemy.scn");
var create_enemy;
var enemy_cnt=0;



func _ready():
	set_process(true);
	Globals.set("gameRunning",true);
	Globals.set("BossBattle",false);
func _process(delta):
	if create_enemy==true:
		var number = rand_range(1,3);
		if number <2 && Globals.get("BossBattle")==false:
			var newRocket = rocket.instance();
			add_child(newRocket);
			newRocket.set_owner(self);
			enemy_cnt = enemy_cnt+ 1;
		if number<4 && Globals.get("BossBattle")==false:
			var newNTBE = ntbe.instance();
			add_child(newNTBE);
			newNTBE.set_owner(self);
			enemy_cnt=enemy_cnt+1;
		if enemy_cnt==10:
			Globals.set("BossBattle",true);
			var newBAMFE = bamfe.instance();
			add_child(newBAMFE);
			newBAMFE.set_owner(self);
#				Globals.set("BossBattle",true);
#				var newVBE = vbe.instance();
#				add_child(newVBE);
#				newVBE.set_owner(self);
			enemy_cnt=0;
		create_enemy=false;

func _on_Timer_timeout():
	if Globals.get("gameRunning")==true:
		create_enemy = true;
