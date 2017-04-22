extends RigidBody2D

var hitpoints = 3
var value = 100

func _ready():
	set_fixed_process(true)
	set_pos(Vector2(rand_range(182/2,800-182/2),-283/2))
	apply_impulse(get_pos(),Vector2(0,125))
	set_angular_velocity(rand_range(-5,5))
	pass

func _fixed_process(delta):
	if Globals.has("gameRunnin"):
		if !Globals.get("gameRunnin"):
			
			get_node(".").queue_free()
	if get_pos().y > 720:
		get_node(".").queue_free()
	if hitpoints <= 0:
		if Globals("gameScore"):
			Globals.set("gameScore", Globals("gameScore") + value)
			Globals.set("enemy_cnt", Globals.get("enemy_cnt")+1)
			get_node(".").queue_free()

func type():
	return "tower"