extends RigidBody2D

var hitpoints = 2
var value = 300
var laser = preload("res://tower/not_too_bad_tower/ntblaser.tscn")
var lasercount = 0

func _ready():
	set_fixed_process(true)
	set_pos(Vector2(rand_range(93,800-93),10))
	apply_impulse(get_pos(),Vector2(0,-1))
	pass

func _fixed_process(delta):
	if Globals.has("gameRunning"):
		if !Globals.get("gameRunning"):
			get_node(".").queue_free()
	if get_pos().y > 720+100:
		get_node(".").queue_free()
	if hitpoints <= 0:
		get_node(".").queue_free()
		Globals.set("enemy_cnt", Globals.get("enemy_cnt")+1)
		if Globals.has("gameScore"):
			Globals.set("gameScore", Globals.get("gameScore") + value)

func _on_Timer_timeout():
	lasercount += 1
	var tlaser = laser.instance()
	tlaser.set_name("laser" + str(lasercount))
	add_child(tlaser)
	tlaser.set_owner(self)
	tlaser.set_pos(Vector2(get_node(".").get_pos().x, get_node(".").get_pos().y + 107))
	get_node("laser" + str(lasercount) + "/ntblaser_body").add_collision_exception_with(get_node("."))
	pass # replace with function body

func type():
	return "enemy"
