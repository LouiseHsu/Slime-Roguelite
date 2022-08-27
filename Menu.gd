extends Control

func _on_Start_pressed():
	get_tree().change_scene("res://World.tscn")
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Options_pressed():
	get_tree().change_scene("res://Options.tscn")
	pass # Replace with function body.


func _on_Load_pressed():
	pass # Replace with function body.
