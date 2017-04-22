extends Node

var speed = -700

func _ready():
	set_fixed_process(true)
	get_node("laser_body").move_to(Vector2(800/2,720))
	pass

func _fixed_process(delta):
	get_node("laser_body").move(Vector2(0,speed * delta))
	if get_node("laser_body").get_global_pos().y < 0:
		get_node(".").queue_free()