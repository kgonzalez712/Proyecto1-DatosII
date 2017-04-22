extends Particles2D


func _ready():
	get_node(".").set_emitting(true);
	


func _on_Timer_timeout():
	get_node(".").queue_free();
