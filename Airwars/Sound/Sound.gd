extends SamplePlayer


func _ready():
	set_process(true);
	Globals.set("triggerLaserSound",false);
	Globals.set("triggeerEnemySound",false);
	Globals.set("triggerIsaacSound",false);

func _process(delta):
	if Globals.get("triggerLaserSound"):
		play("shoot_small",false);
		Globals.set("triggerLaserSound",false);
	if Globals.get("triggerEnemySound"):
		play("explosion",false);
		Globals.set("triggerEnemySound",false);
	if Globals.get("triggerIsaacSound"):
		play("isaacscream",false);
		Globals.set("triggerIsaacSound",false);
