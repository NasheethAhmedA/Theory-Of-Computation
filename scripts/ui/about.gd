extends Control

func _on_btn_mouse_entered():
	MusicPlayer.play("hover_sfx")


func _on_btn_mouse_exited():
	MusicPlayer.play("unhover_sfx")


func _on_exit_btn_pressed():
	MusicPlayer.play("press_sfx")
	get_tree().change_scene_to_file("res://scenes/ui/main.tscn")
