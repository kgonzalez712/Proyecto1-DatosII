extends Node

var speed = 250
var distance = 0 # distancia al objetivo
var angle = 0 # angulo de rotacion
var spawn = Vector2(650,72)
var target = Vector2(400,720)
var c = 0
var hitpoints = 1

func _ready():
	get_node(".").set_pos(spawn)
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if (c == 0):
		calibrate()
		c = 1
	get_node("blaser_body").move(Vector2(speed*cos(angle)*delta, speed*sin(angle)*delta))
	if get_node("blaser_body").get_global_pos().y < 0 or get_node("blaser_body").get_global_pos().x > 800 or get_node("blaser_body").get_global_pos().y > 720 or get_node("blaser_body").get_global_pos().x < 0:
		get_node(".").queue_free()

func calibrate():
	angle = get_node("blaser_body").get_angle_to(target)
	get_node("blaser_body").rotate(angle)
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
	angle = get_node("blaser_body").get_angle_to(target)
	if ((target.x - spawn.x) < 0):
		speed *= -1
		angle = 2*PI - angle
	get_node("blaser_body").rotate(angle)

func set_pos(pos):
	get_node("blaser_body").set_pos((Vector2(pos.x,pos.y)))


func type():
	return "laser"















