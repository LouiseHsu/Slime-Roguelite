extends CanvasLayer

onready var score_ui = $ScoreValue;

var score = 0;

func _ready():
	score_ui.text = str(0);

func update_score(value):
	score = score + value;
	score_ui.text = str(score);
