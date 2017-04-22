extends Node

var speed = 555
var distance = 0 # distancia al objetivo
var angle = 0 # angulo de rotacion
var spawn = Vector2(400,720/2)
var target = Vector2(400,720)
var c = 0

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	
	if (get_node("KinematicBody2D").is_colliding()):
		if (get_node("KinematicBody2D").get_collider().type() == "enemy"):
				get_node("KinematicBody2D").add_collision_exception_with(get_node("KinematicBody2D").get_collider())
			
	get_node("KinematicBody2D").rotate(1*delta)
	get_node("KinematicBody2D").move(Vector2(0, (800/720)*speed*delta))
	
	if (get_node("KinematicBody2D").get_pos().y >= 720):
		get_node(".").queue_free()

func calibrate():
	angle = get_node("KinematicBody2D").get_angle_to(target)
	get_node("KinematicBody2D").rotate(angle)
	if (target.y < 720/2):
		speed = -1*speed
	elif (int(deg(angle)) == 90):
		angle = 0
	elif (int(deg(angle)) == -90):
		angle = rad(180)
	elif (angle == 0):
		angle = rad(90)
	elif (int(deg(angle)) < 0 ):
		speed *= -1

func square(x):
	return (x*x)

func rad(deg):
	#retorna radianes
	return deg*PI/180

func deg(rad):
	#retorna grados
	return rad*180/PI

func get_angle():
	angle = get_node("KinematicBody2D").get_angle_to(target)
	if ((target.x - spawn.x) < 0):
		speed *= -1
		angle = 2*PI - angle
	get_node("KinematicBody2D").rotate(angle)

func set_pos(pos):
	get_node("KinematicBody2D").set_pos((Vector2(pos.x,pos.y)))

func type():
	return "enemy"