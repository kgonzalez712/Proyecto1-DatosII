extends Node

var speed=1920;

func _fixed_process(delta):
	get_node("KinematicBody2D").move(Vector2(0,speed * delta));
	if get_node("KinematicBody2D").get_global_pos().y>720 or get_node("KinematicBody2D").is_colliding():
		if get_node("KinematicBody2D").is_colliding():
			get_node("KinematicBody2D").get_collider().hitpoints -=1;
		get_node(".").queue_free();


func set_pos(p):
	get_node("KinematicBody2D").set_pos(p);

func _ready():
	set_fixed_process(true);
	