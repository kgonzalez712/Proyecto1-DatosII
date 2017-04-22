# scrip: aw_root

extends Node

var score = 0;
var highscore = 0;
onready var info = get_node("info")

func _ready():
	Globals.set("gameRunning",false);
	Globals.set("gameScore", score);
	Globals.set("gameLevels",false);
	set_process(true)

# input from the user to star/end game
func _process(delta):
	
	if (Input.is_action_pressed("ui_quit")):
		get_tree().quit()
	
	if Globals.get("gameRunning")==true:
		run_game(delta)
	
	else:
		if (Input.is_action_pressed("ui_accept")):
			star_game()

# load game level
func star_game():
	score = 0
	get_node("hud_root").set_score(score)
	get_node("info").set_text("Level 1");
	get_node("hud_root").set_running();
	Globals.set("gameLevels",true);  
	Globals.set("gameRunning",true);
	Globals.set("gameScore",0);

# Running loop
func run_game(delta):
	if Globals.get("gameScore")>score:
		score=Globals.get("gameScore");
		get_node("hud_root").set_score(score);
	if (Input.is_action_pressed("ui_cancel")) or Globals.get("gameLevels")==false:
		Globals.set("gameRunning",false);
		get_node("info").set_text("Game Over")
		if (score >= highscore):
			highscore = score
		get_node("hud_root").set_game_over(highscore)