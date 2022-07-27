extends Control

onready var healthBar = $"Health Bar";
onready var expBar = $"EXP Bar";

func _init():
	PlayerStats.connect("update_exp_bar", self, "_on_Player_Stats_update_exp_bar");

func _on_Player_damage_taken():
	healthBar.value = PlayerStats.health;
	print(PlayerStats.health);

func _on_Player_player_ready():
	healthBar.max_value = PlayerStats.max_health;
	healthBar.value = PlayerStats.health;

func _on_Player_Stats_update_exp_bar(curr, next):
	expBar.max_value = next;
	expBar.value = curr;
