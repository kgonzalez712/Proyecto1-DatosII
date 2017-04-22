extends SamplePlayer


func _ready():
	set_process(true);
	Globals.set("triggerLaserSound",false);
	Globals.set("triggeerEnemySound",false);
	Globals.set("triggerIsaacSound",false);
	Globals.set("triggerGodzillaSound",false);
	Globals.set("triggerSHSound",false);
	Globals.set("triggerStarSound",false);
	
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
	if Globals.get("triggerGodzillaSound"):
		play("Godzilla",false);
		Globals.set("triggerGodzillaSound",false);
	if Globals.get("triggerSHSound"):
		play("Silent Hill Siren",false);
		Globals.set("triggerSHSound",false);
	if Globals.get("triggerStarSound"):
		play("Star Wars TIE fighter flyby and spinout sound FX",false);
		Globals.set("triggerStarSound",false);