extends Node

var speed=-1920;
var particle = preload ("res://PEffects/Particles.tscn");
var hit_enemy=false;

func _fixed_process(delta):
	if get_node("KinematicBody2D")!=null:
		get_node("KinematicBody2D").move(Vector2(0,speed * delta));
		if get_node("KinematicBody2D").get_global_pos().y<0 or get_node("KinematicBody2D").is_colliding():
			if get_node("KinematicBody2D").is_colliding():
				
				get_node("KinematicBody2D").get_collider().hitpoints -=1;
				var explosion;
				explosion=particle.instance();
				get_node("/root/aw_root").add_child(explosion);
				explosion.set_owner(get_node("/root/aw_root")); 
				explosion.set_pos(get_node("KinematicBody2D").get_collider().get_pos());
				explosion=null;
				hit_enemy=true;
				get_node(".").queue_free();


func set_pos(p):
	get_node("KinematicBody2D").set_pos(p);

func _ready():
	Globals.set("triggerLaserSound",true);
	set_fixed_process(true);
	
