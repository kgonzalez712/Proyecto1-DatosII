extends KinematicBody2D

var maxSpeed=700;
var acc=20;
var kin_speed=Vector2(0,0);
var shipPadx=50;
var shipPady=50;
var gun_fired=false;
var laser = preload("res://Lasers/Laser.scn");
var laser_cnt=0;

func _fixed_process(delta):
	if Globals.get("gameRunning"):
		if((Input.is_action_pressed("ui_up")) or (Input.is_action_pressed("ui_down")) or Input.is_action_pressed("ui_left")) or (Input.is_action_pressed(("ui_right"))):
			if (Input.is_action_pressed("ui_up")):
				if kin_speed.y>-maxSpeed:
					kin_speed += Vector2(0,-acc);
			if (Input.is_action_pressed("ui_down")):
				if kin_speed.y< maxSpeed:
					kin_speed += Vector2(0,acc);
			if (Input.is_action_pressed("ui_left")):
				if kin_speed.x > -maxSpeed:
					kin_speed += Vector2(-acc,0);
			if (Input.is_action_pressed("ui_right")):
				if kin_speed.x < maxSpeed:
					kin_speed += Vector2(acc,0);
		else:
			kin_speed.x=lerp(kin_speed.x,0,.05);
			kin_speed.y=lerp(kin_speed.y,0,.05);
			
		move(kin_speed * delta);
		
		if (get_pos().x<shipPadx):
			kin_speed.x=0;
			move_to(Vector2(shipPadx,get_pos().y));
		if (get_pos().x>get_viewport().get_rect().size.x - shipPadx):
			kin_speed.x=0;
			move_to(Vector2(get_viewport().get_rect().size.x - shipPadx,get_pos().y));
		if (get_pos().y<shipPadx):
			kin_speed.y=0;
			move_to(Vector2(get_pos().x,shipPady));
		if (get_pos().y>get_viewport().get_rect().size.y - shipPady):
			kin_speed.y=0;
			move_to(Vector2(get_pos().x,get_viewport().get_rect().size.y - shipPady ));
			
		if (Input.is_action_pressed("ui_select")) and !gun_fired:
			laser_cnt+=1;
			var laserInstance=laser.instance();
			laserInstance.set_name("Laser"+ str(laser_cnt));
			add_child(laserInstance);
			laserInstance.set_owner(self);
			laserInstance.set_pos(get_pos() + Vector2(0,-82));
			get_node("Laser" + str(laser_cnt) + "/KinematicBody2D").add_collision_exception_with(get_node("."));
		gun_fired = Input.is_action_pressed("ui_select")
		
		if get_node(".").is_colliding():
			Globals.set("triggerEnemysound",true);
			kin_speed = Vector2(0,0);
			Globals.set("gameLevels",false);
	else:
		kin_speed = Vector2(0,0);
		get_node(".").move_to(Vector2(400,650));

func _ready():
	set_fixed_process(true);
	get_node(".").move_to(Vector2(400,650));

