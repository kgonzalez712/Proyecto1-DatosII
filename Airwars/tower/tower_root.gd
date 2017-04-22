extends Node

var btower = preload("res://tower/bad_tower/btower.tscn")
var ntbtower = preload("res://tower/not_too_bad_tower/ntbtower.tscn")

var create_tower = false

func _ready():
	set_process(true)
	Globals.set("gameRunning", true)
	pass

func _process(delta):
	if create_tower:
		var type = rand_range(0,2)
		if type <= 1 and Globals.get("BossBattle")==false:
			var new_tower = btower.instance()
			add_child(new_tower)
			new_tower.set_owner(self)
		elif type <= 2 and Globals.get("BossBattle")==false:
			var new_tower = ntbtower.instance()
			add_child(new_tower)
			new_tower.set_owner(self)
		create_tower = false

func _on_tower_timer_timeout():
	if Globals.get("gameRunning"):
		create_tower = true
	pass